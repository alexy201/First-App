#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
    titlePanel(h1("censusVis")),
    sidebarLayout(
        sidebarPanel(
            helpText("Create demographic maps with information from the 2010 US Census."),
            selectInput("var", label = "Choose a variable to display", 
                        choices = list("Percent White" = 1, "Percent Black" = 2,
                                       "Percent Hispanic" = 3, "Percent Asian" = 4), selected = 1),
            sliderInput("range", h3("Range of Interest"), min = 0, max = 100, value = c(0, 100)),
        ),
        mainPanel(
            
        )
    )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
    
    # Histogram of the Old Faithful Geyser Data ----
    # with requested number of bins
    # This expression that generates a histogram is wrapped in a call
    # to renderPlot to indicate that:
    #
    # 1. It is "reactive" and therefore should be automatically
    #    re-executed when inputs (input$bins) change
    # 2. Its output type is a plot
    output$distPlot <- renderPlot({
        
        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "#75AADB", border = "red",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")
        
    })
    
}

# Run the application 
shinyApp(ui = ui, server = server)
