require(shiny)
require(ISLR)
require(MASS)

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
        column(3,
               selectInput('model', 
                            'Classifier Model',
                            c("logit", "lda", "knn"))
        ),
        column(3,
               numericInput('testYear', 
                           'Withhold/Test Year',
                           min = 2001, max = 2005, step = 1,
                           value = 2005)
        )
    ),
    
    fluidRow(
        
        plotOutput(outputId = "plot")
    ),
    
    fluidRow(
        column(6,
               h4(paste("Model Fit Summary:", "test"))),
        column(6,
               h4(paste("Model Fit Summary:", "test2")))
    ),
    
    fluidRow(
        column(6,
               verbatimTextOutput("modelOutput")
        ),
        
        column(6,
               verbatimTextOutput("modelPredict")
        )
    )
)


server <- function(input, output) {
    
    selectedData <- reactive({
        mydata[,c(input$xcol, input$ycol)]
    })
    
    output$plot <- renderPlot({
        plot(selectedData(), 
             col=c(2,4),
             pch=20)
    })
    
    output$modelOutput <- renderPrint({
        label = "Direction~"
        features = paste(input$xcol, input$ycol, sep="+")
        f = paste(label, features, sep="")
        
        testYear = input$testYear
        
        switch(input$model,
               "logit" = summary(glm(f, mydata, family=binomial, subset=Year!=2005)),
               "lda" = lda(formula=f, data=mydata, subset=Year!=2005),
               "knn" = "HELLO")
    })
    
    output$modelPredict <- renderPrint({
        input$testYear
    })
}


shinyApp(ui = ui, server = server)