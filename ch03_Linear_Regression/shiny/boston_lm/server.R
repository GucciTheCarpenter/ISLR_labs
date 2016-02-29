# server.R

require(shiny)
require(ggplot2)
require(MASS)
require(ISLR)

dat <- Boston

shinyServer(function(input, output) {
    
    text <- reactive({
        paste(input$yvar, '~', input$xvar)
    })
    
    output$caption <- renderText({
        text()
    })
    
    output$plot <- renderPlot({
        p <- ggplot(dat, aes_string(x=input$xvar, y=input$yvar)) + 
            geom_point() + 
            geom_smooth()
        print(p)
    })
    
    output$summary <- renderPrint({
        formula = paste(input$yvar,"~",input$xvar,sep="")
        print(summary(lm(formula, dat)))
    })
    
})