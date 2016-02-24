require(shiny)

Auto <- read.csv('../../../data_sets/Auto.csv')


ui <- fluidPage(
    titlePanel('Auto'),
    
    sidebarLayout(
        
        sidebarPanel(
            h4('Check features to compare'),
            br(),
            
            checkboxGroupInput('f',
                        'Features',
                        c('mpg' = 1,
                          'cylinders' = 2,
                          'displacement' = 3,
                          'horsepower' = 4,
                          'weight' = 5,
                          'acceleration' = 6,
                          'year' = 7,
                          'origin' = 8),
                        selected = c(1, 3, 4, 5, 6)),
            
            br(),
            submitButton('Submit')
        ),
        
        mainPanel(
            h4('Scatterplot Matrix '),
            plotOutput(outputId = "scat")
            
        )
    )
)


server <- function(input, output){
    
    output$scat <- renderPlot({
        
        pairs(Auto[,c(as.numeric(input$f))])

    })
}


shinyApp(ui = ui, server = server)