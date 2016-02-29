require(shiny)
require(ggplot2)
require(MASS)

ui <- fluidPage(
    
    titlePanel("Boston"),
    
    sidebarLayout(
        
        sidebarPanel(
            h4("Feature Fit on 'medv'"),
            
            checkboxGroupInput(inputId = "features",
                               "'lstat' fitted by default",
                               choices = c("crim",
                                 "zn",
                                 "indus",
                                 "chas",
                                 "nox",
                                 "rm",
                                 "age",
                                 "dis",
                                 "rad",
                                 "tax",
                                 "ptratio",
                                 "black"),
                               selected = c("crim",
                                            "zn",
                                            "indus",
                                            "chas",
                                            "nox",
                                            "rm",
                                            "age",
                                            "dis",
                                            "rad",
                                            "tax",
                                            "ptratio",
                                            "black"))
            
        ),
        
        mainPanel(
            plotOutput("plot"),
            verbatimTextOutput("summary")
        )
    )
)

server <- function(input, output){
    
    output$plot <- renderPlot({
        default = "medv~lstat"
        def_append = ""
        for(i in input$features){def_append=(paste(def_append, "+", i, sep = ""))}
        
        formula = (paste(default,def_append,sep=""))
            
        fit=lm(formula,Boston)
        
        p <- ggplot(fit, aes(.fitted, .resid))
        
        p + geom_point() +
            stat_smooth(method="loess") +
            geom_hline(yintercept=0, col="red", linetype="dashed") +
            xlab("Fitted values")+ylab("Residuals") + 
            ggtitle("Residual vs Fitted Plot")
        
    })
    
    output$summary <- renderPrint({
        default = "medv~lstat"
        def_append = ""
        for(i in input$features){def_append=(paste(def_append, "+", i, sep = ""))}
        
        formula = (paste(default,def_append,sep=""))
        
        ols <- lm(formula, Boston)
        print(summary(ols))
    })
    
}

shinyApp(ui = ui, server = server)