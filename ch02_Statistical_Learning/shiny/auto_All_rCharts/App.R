require(shiny)
require(ggplot2)
require(rCharts)

Auto <- read.csv('../../../data_sets/Auto.csv')


ui <- fluidPage(navbarPage(
    title = h2('Auto'),
    
    tabPanel(h4('Histogram'),
             fluidRow(
                 column(3,
                        selectInput('hist_feat',
                                    'Feature',
                                    names(Auto)[1:7],
                                    selected = mpg)
                        ),
                 
                 column(3,
                        numericInput('bins',
                                     'data groups / bin',
                                     value = 8,
                                     min = 3,
                                     max = 23,
                                     step = 5
                                    )
                        )
                                     
                    
            ),
             fluidRow(
                 column(10,
                        showOutput("histPlot", lib="polycharts"),
                        
                        verbatimTextOutput("value")
                 )
             )
             
             ),
    
    tabPanel(h4('Scatter Plot'),
             fluidRow(
                 column(2,
                        selectInput('x_scat',
                                   'X axis',
                                   names(Auto)[1:8],
                                   selected = 'cylinders'),
                        
                        selectInput('y_scat',
                                    'Y axis',
                                    names(Auto)[1:8],
                                    selected = 'mpg'),
                        
                        selectInput('gr_scat',
                                    'Color by:',
                                    c('cylinders', 'year', 'origin'))
                        ),
                 
                 column(10,
                        showOutput("scatPlot", lib="highcharts")
                        )
                    )
             
          )
    )
)



server <- function(input, output){
    
    output$histPlot <- renderChart2({
        
        dataPlot = melt(table(Auto[, input$hist_feat]))
        xFormula = paste("bin(Var1, ", as.character(input$bins), ")", sep="")
        rp1 <- rPlot(x = xFormula, y = "value", data = dataPlot, type = "bar", barGap=0)
        rp1$addParams(title = paste('hist of', input$hist_feat))
        rp1$guides(
            x = list(title = input$hist_feat),
            y = list(title = "count")
        )
        return(rp1)
        
    })
    
    
    output$scatPlot <- renderChart2({
        
        dataPlot = Auto[, c(input$x_scat, input$y_scat, input$gr_scat)]
        names(dataPlot) = c('x', 'y', 'g')
        
        h1 <- hPlot(y~x, data=dataPlot, type='scatter', group='g')
        h1$title(text = paste(input$y_scat, '~', input$x_scat))
        h1$xAxis(title = list(text = input$x_scat))
        h1$yAxis(title = list(text = input$y_scat))
        return(h1)
        
    })
    
    output$value <- renderPrint({ 
                        input$hist_feat
        })
    
}


shinyApp(ui = ui, server = server)