require(shiny)
require(ggplot2)
require(ISLR)
require(MASS)
require(class)

mydata <- Smarket

ui <- fluidPage(
    titlePanel("Smarket Exploratory Classifier Analysis"),
    br(),
    
    fluidRow(
        column(3,
               selectInput('xcol', 
                           'X Variable', 
                           names(mydata)[2:6])
        ),
        column(3,
               selectInput('ycol', 
                           'Y Variable', 
                           names(mydata)[2:6],
                           selected=names(mydata)[[3]])
        ),
        column(2,
               selectInput('model', 
                            'Classifier Model',
                            c("logit", "lda", "knn"),
                           selected = "logit")
        ),
        
        # hide k-neighbor selection unless choosen as model above
        column(2,
               uiOutput('kInputUI')
        ),

        column(2,
               numericInput('testYear', 
                           'Withhold/Test Year',
                           min = 2001, max = 2005, step = 1,
                           value = 2005)
        )
    ),
    
    fluidRow(
        column(6,
               h4(textOutput("yearsPlotted"))),
        column(6,
               h4(textOutput("testYear")))
    ),
    
    fluidRow(
        
        plotOutput(outputId = "plot")
        
    ),
    
    fluidRow(
        column(6,
               h4("Model Fit Summary:")),
        column(6,
               h4("Model Prediction Summary:"))
    ),
    
    fluidRow(
        column(6,
               verbatimTextOutput("modelFit")
        ),
        
        column(6,
               verbatimTextOutput("modelPredict")
        )
    )
)


server <- function(input, output) {
    
    trainData <- reactive({
        mydata[mydata$Year!=input$testYear,c(input$xcol, input$ycol, "Direction")]
    })
    
    testData <- reactive({
        mydata[mydata$Year==input$testYear,c(input$xcol, input$ycol, "Direction")]
    })
    
    output$yearsPlotted <- renderText({
        switch(as.character(input$testYear),
               "2001" = "Training Data, 4 Years Plotted: 2002 - 2005",
               "2002" = "Training Data, 4 Years Plotted: 2001, 2003-2005",
               "2003" = "Training Data, 4 Years Plotted: 2001, 2002, 2004, 2005",
               "2004" = "Training Data, 4 Years Plotted: 2001-2003, 2005",
               "2005" = "Training Data, 4 Years Plotted: 2001-2004")
    })
    
    output$testYear <- renderText({
        paste("Test/Predict on Year:", as.character(input$testYear))
    })
    
    output$kInputUI <- renderUI({
        
        if (input$model == "knn") {
            numericInput('k',
                         '# of K',
                         min = 1, max = 10, step = 1,
                         value = 1)
        }
    })
    
    # output$dynamic_k <-
    
    output$plot <- renderPlot({
        # regular R plot
        # plot(trainData()[,c(1,2)], col=c(2,4), pch=20)
        
        # ggplot
        p <- ggplot(trainData(), aes_string(x=input$xcol, y=input$ycol, col="Direction")) + geom_point()
        print(p)
    })
    
    output$modelFit <- renderPrint({
        
        label = "Direction~"
        features = paste(input$xcol, input$ycol, sep="+")
        f = paste(label, features, sep="")
        
        switch(input$model,
               "logit" = summary(glm(f, trainData(), family=binomial)),
               "lda" = lda(trainData()[,c(1,2)], trainData()$Direction),
               "knn" = table(knn(train = trainData()[,c(1,2)],
                           test = testData()[,c(1,2)],
                           cl = trainData()$Direction,
                           k = input$k))
               )
    })
    
    output$modelPredict <- renderPrint({

        label = "Direction~"
        features = paste(input$xcol, input$ycol, sep="+")
        f = paste(label, features, sep="")
        
        if (input$model == "logit") {
            
            glm.fit=glm(f, trainData(), family=binomial)
            glm.probs=predict(glm.fit, newdata=testData(), type="response")
            glm.pred=ifelse(glm.probs>0.5, "Up", "Down")
            Direction.test = testData()$Direction
            
            print("Confusion Matrix:")
            print(table(glm.pred, Direction.test))
            print("###############")
            print("Model Accuracy:")
            print((mean(glm.pred==Direction.test)))
            
        } else if (input$model == "lda") {
            
            lda.fit=lda(trainData()[,c(1,2)], trainData()$Direction)
            lda.pred=predict(lda.fit, testData()[,c(1,2)])
            Direction.test = testData()$Direction
            
            print("Confusion Matrix:")
            print(table(lda.pred$class, Direction.test))
            print("###############")
            print("Model Accuracy:")
            print((mean(lda.pred$class==Direction.test)))
            
        } else {
            
            knn.predict=knn(train = trainData()[,c(1,2)],
                            test = testData()[,c(1,2)],
                            cl = trainData()$Direction,
                            k = input$k)
            Direction.test = testData()$Direction
            
            print(paste("Confusion Matrix of k=",input$k,":",sep=""))
            print(table(knn.predict,testData()$Direction))
            print("###############")
            print("Model Accuracy:")
            print(mean(knn.predict==Direction.test))
        }
        
    })
    
}


shinyApp(ui = ui, server = server)