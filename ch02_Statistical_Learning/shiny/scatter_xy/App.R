# scatter plot of random data

library(shiny)
library(ggplot2)

ui <- fluidPage(
    
    titlePanel("Random Data"),
    
    sidebarLayout(
        
        sidebarPanel(
            h4("Set parameters below."),
            br(),
            
            sliderInput(inputId = "n", "Sample Set", value = 50, 
                         min = 10, max = 250, step = 20),
            selectInput(inputId = "c", label = "Color", 
                        choices = c("Red", "Green", "Blue")),
            radioButtons(inputId = "shape", label = "Shape",
                         choices = c("Circle", "Star", "Cross")),
            numericInput(inputId = "size", label = "Size", value = 3,
                         min = .5, max = 10, step = .5),
            
            br(),
            img(src="bigorb.png", height = 72, width = 72),
            "shiny is a product of ",
                span((a("RStudio", href = "http://www.rstudio.com/shiny")), 
                     style = "color:blue")
            ),
        
        mainPanel(
            h4("Scatter Plot"),
            plotOutput(outputId = "scatterPlot")
            )
    )
)

server <- function(input, output){
    
    shapes = c("Circle" = "o", "Star" = "*", "Cross" = "+")
    
    output$scatterPlot <- renderPlot({
        x <- runif(input$n)
        y <- rnorm(input$n)
        c <- tolower(input$c)
        p <- shapes[[input$shape]]
        s <- input$size
        
        rand_xy = data.frame(x,y)
        f <- ggplot(rand_xy, aes(x, y))
        f + geom_point(color=c, shape=p, size=s) +
            labs(list(x='Random Uniform', y='Random Norm')) +
            theme(axis.title.x = element_text(size = 15),
                  axis.text.x = element_text(angle = 45, face = "bold", vjust = .5),
                  axis.title.y = element_text(size = 15))
        
    })
    

}



shinyApp(ui = ui, server = server)

### NOTES

#x = runif(50)   # random uniform
#y = rnorm(50)   # random norm