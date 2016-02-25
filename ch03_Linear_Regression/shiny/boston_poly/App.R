require(shiny)
require(ggplot2)
require(MASS)

ui <- fluidPage(
    
    titlePanel("Boston"),
    
    sidebarLayout(
        
        sidebarPanel(
            h4("Select Polynomial Fit"),
            
            checkboxInput("poly1",
                          "p = 1",
                          value = T),
            checkboxInput("poly2",
                          "p = 2",
                          value = F),
            checkboxInput("poly3",
                          "p = 3",
                          value = F),
            checkboxInput("poly4",
                          "p = 4",
                          value = F),
            
            radioButtons("plot_type",
                         "Plotting Style",
                         c("base", "ggplot2"),
                         selected = "base", inline = T)
        ),
        
        mainPanel(
            plotOutput("plot")
        )
    )
)

server <- function(input, output){
    
    output$plot <- renderPlot({
        if(input$plot_type == "base") {
            plot(medv~lstat, Boston,
                 xlab = "Median Value of Owner-Occupied Homes ($1,000's)",
                 ylab = "Lower Status of the Population",
                 main = "medv ~ lstat")
            if(input$poly1) { abline(lm(medv~lstat,Boston)) }
            if(input$poly2) { points(Boston$lstat,fitted(lm(medv~lstat + I(lstat^2),Boston)),col="red") }
            if(input$poly3) { points(Boston$lstat,fitted(lm(medv~poly(lstat,3),Boston)),col="green") }
            if(input$poly4) { points(Boston$lstat,fitted(lm(medv~poly(lstat,4),Boston)),col="blue") }
        } else {
            p <- ggplot(Boston, aes(x = lstat, y = medv)) + geom_point() + labs(title="medv ~ lstat", 
                     x="Median Value of Owner-Occupied Homes ($1,000's)", 
                     y="Lower Status of the Population")
            if(input$poly1) { p <- p + geom_smooth(method=lm, color='black', size=1, se=F) }
            if(input$poly2) { p <- p + geom_smooth(method=lm, formula = y ~ x + I(x^2), color='red', size=1, se=F) }
            if(input$poly3) { p <- p + geom_smooth(method=lm, formula = y ~ poly(x,3), color='green', size=1, se=F) }
            if(input$poly4) { p <- p + geom_smooth(method=lm, formula = y ~ poly(x,4), color='blue', size=1, se=F) }
            print(p)
        }
        
    })
}

shinyApp(ui = ui, server = server)