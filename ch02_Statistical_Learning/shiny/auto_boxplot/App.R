require(shiny)
require(ggplot2)

Auto <- read.csv('../../../data_sets/Auto.csv')


ui <- fluidPage(
    titlePanel('Auto'),
    
    sidebarLayout(
        
        sidebarPanel(
            h4('Choose Features'),
            br(),
            
            selectInput('cat',
                        'Category',
                        c('cylinders', 'year', 'origin'),
                        selected = 'cylinders'),
            
            selectInput('m',
                        'Measure',
                        c('mpg', 'displacement', 'horsepower', 'weight', 'acceleration'),
                        selected = 'mpg'),
            
            br()
        ),
        
        mainPanel(
            h4('Boxplot with ggplot2'),
            plotOutput(outputId = "boxplot")
            
        )
    )
)


server <- function(input, output){
    
    
    output$boxplot <- renderPlot({
        x <- Auto[,input$cat]
        y <- Auto[,input$m]
        clr <- as.factor(x)
        xlab <- input$cat
        ylab <- input$m
        
        g <- ggplot(Auto, aes(as.factor(x), as.numeric(y), fill=clr))
        
        g + geom_boxplot() +
            scale_fill_discrete(name = xlab) + 
            labs(title = toupper(paste(ylab, 'by', xlab)), x = xlab, y = ylab) 

    })
}


shinyApp(ui = ui, server = server)