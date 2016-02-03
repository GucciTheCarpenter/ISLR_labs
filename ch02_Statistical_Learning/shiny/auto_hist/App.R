require(shiny)

Auto <- read.csv('../../../data_sets/Auto.csv')


ui <- fluidPage(
    titlePanel('Auto'),
    
    sidebarLayout(
        
        sidebarPanel(
            h4('Choose feature & bins'),
            br(),
            
            selectInput('f',
                        'Feature',
                        names(Auto)[1:7],
                        selected = Auto$mpg),
            
            numericInput('bins',
                         'Bins',
                         value = 8,
                         min = 3,
                         max = 23,
                         step = 5
                        ),
            h6("NOTE: not all bin values will result in a modified plot."),
            
            br()
        ),
        
        mainPanel(
            h4('Histogram / Bar Chart'),
            plotOutput(outputId = "hist")
            
        )
    )
)


server <- function(input, output){
    
    
    output$hist <- renderPlot({
        
        bins <- input$bins
        
        if(class(Auto[,input$f]) == "factor") {
            hist(as.numeric(as.character(Auto[,input$f])),
                 xlab = as.character(input$f),
                 main = '',
                 col = 'lightblue')
        } else {
            hist(Auto[,input$f],
                 breaks = bins,
                 xlab = as.character(input$f),
                 main = '',
                 col = 'lightblue'
            )
        }

    })
}


shinyApp(ui = ui, server = server)