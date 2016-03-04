require(shiny)
require(ggplot2)
require(rCharts)

Auto <- read.csv('../../../data_sets/Auto.csv')


ui <- fluidPage(navbarPage(
    title = h2('Auto'),
    
    tabPanel(h4('Boxplot'),
             fluidRow(
                 column(2,
                        selectInput('cat',
                                    'Category',
                                    c('cylinders', 'year', 'origin'),
                                    selected = 'cylinders'),
                        
                        selectInput('m',
                                    'Measure',
                                    c('mpg', 'displacement', 'horsepower', 'weight', 'acceleration'),
                                    selected = 'mpg')
                        ),
                 
                 column(10,
                        plotOutput('boxplot')
                        )
                    )
             ),
    
    tabPanel(h4('Histogram'),
             fluidRow(
                 column(2,
                        selectInput('f_hist',
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
                        h6("NOTE: not all bin values will result in a modified plot.")
                        ),
                 
                 column(10,
                        plotOutput('hist')
                        )
                    )
             ),
    
    tabPanel(h4('Scatter Plot Matrix'),
             fluidRow(
                 column(2,
                        checkboxGroupInput('f_scat',
                                           'Features',
                                           c('mpg' = 1,
                                             'cylinders' = 2,
                                             'displacement' = 3,
                                             'horsepower' = 4,
                                             'weight' = 5,
                                             'acceleration' = 6,
                                             'year' = 7,
                                             'origin' = 8),
                                           selected = c(1, 3, 4, 5, 6))
                        ),
                 
                 column(10,
                        plotOutput("scat")
                        )
                    )
             
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
    
    output$hist <- renderPlot({
        
        bins <- input$bins
        
        if(class(Auto[,input$f_hist]) == "factor") {
            hist(as.numeric(as.character(Auto[,input$f_hist])),
                 xlab = as.character(input$f_hist),
                 main = '',
                 col = 'lightblue')
        } else {
            hist(Auto[,input$f_hist],
                 breaks = bins,
                 xlab = as.character(input$f_hist),
                 main = '',
                 col = 'lightblue'
            )
        }
        
    })
    
    output$scat <- renderPlot({
        
        pairs(Auto[,c(as.numeric(input$f_scat))])
        
    })
    
}


shinyApp(ui = ui, server = server)