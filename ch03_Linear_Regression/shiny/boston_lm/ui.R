# ui.R

shinyUI(fluidPage(
    
    titlePanel("Boston Linear Models"),
    sidebarLayout(
        sidebarPanel(
            h3("Set parameters below."),
            br(),
            
            selectInput("xvar",
                        label = h4("x-axis"),
                        choices = names(Boston),
                        selected = "lstat"),
            selectInput("yvar",
                        label = h4("y-axis"),
                        choices = names(Boston),
                        selected = "medv")
        ),
        
        mainPanel(
            h2(textOutput("caption")),
            plotOutput("plot"),
            h4("Summary"),
            verbatimTextOutput("summary")
        )
    )
    
))