# scatter plot of random data

library(shiny)

ui <- fluidPage(
    
    titlePanel("Scatter Plot, Random XY"),
    
    sidebarLayout(
        
        sidebarPanel(
            h4("Set parameters below."),
            p("Will allow rand & n choices here"),
            p("color // shape // runif v. rnorm // size"),
            br(),
            img(src="bigorb.png", height = 72, width = 72),
            "shiny is a product of ",
                span((a("RStudio", href = "http://www.rstudio.com/shiny")), 
                     style = "color:blue")
            ),
        
        mainPanel("plot here")
    )
)

server <- function(input, output){
    
}



shinyApp(ui = ui, server = server)

### NOTES

#x = runif(50)   # random uniform
#y = rnorm(50)   # random norm