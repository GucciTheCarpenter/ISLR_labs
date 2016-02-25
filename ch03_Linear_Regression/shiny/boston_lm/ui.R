# ui.R

shinyUI(fluidPage(
    
    titlePanel("Linear Model"),
    sidebarLayout(
        sidebarPanel(
            h4("Set parameters below."),
            br(),
            
            selectInput("x",
                        "Choose an X var:",
                        choices = names(Boston),
                        selected = "lstat"),
            
            selectInput("y",
                        "Choose a Y var:",
                        choices = names(Boston),
                        selected = "medv"),
            
            radioButtons("dataset",
                         "Data Set",
                         c("Boston", "Carseats"),
                         selected = "Boston"),
            
            radioButtons("plot_type",
                         "Plotting Style",
                         c("base", "ggplot2"),
                         selected = "ggplot2")
        ),
        
        mainPanel(
            h4("Dot Plot: X v Y"),
            plotOutput("dot"),
            textOutput("text"),
            p("Summary"),
            verbatimTextOutput("summary")
        )
    )
    
))