# server.R

require(shiny)
require(ggplot2)
require(MASS)
require(ISLR)


shinyServer(function(input, output) {
    
    curdata <- reactive({
        switch(input$dataset,
               "Boston" = Boston,
               "Carseats" = Carseats)
    })
    
    xvar <- reactive({
        switch(input$dataset,
               Boston = lstat,
               Carseats = Price)
    })
    
    yvar <- reactive({
        switch(input$dataset,
               Boston = medv,
               Carseats = Sales)
    })
    
    output$text <- renderText({
        input$x
    })
    
    output$summary <- renderPrint({
        ols <- lm(mtcars$mpg~mtcars$wt)
        print(summary(ols))
    })
    
    output$dot <- renderPlot({
        if (input$plot_type == "base") {
            xvals <- curdata()[[xvar()]]
            yvals <- curdata()[[yvar()]]
            plot(xvals, yvals)
        } else if (input$plot_type == "ggplot2") {
            dat <- curdata()
            ggplot(curdata(), aes(xvar, yvar())) + geom_point()
        }
    })
    
})