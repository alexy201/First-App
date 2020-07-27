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
    titlePanel(h1("My Shiny App")),
    sidebarLayout(
        sidebarPanel(
            h1("Installation"),
            p(style = "color:black", "Shiny is available on CRAN, so you can install it in the usual way from your R console: "),
            code("install.packages(\"shiny\")"),
            br(),
            br(),
            br(),
            img(src = "rstudio.png", height = 70, width = 200),
            br(),
            br(),
            p(style = "color:black", "Shiny is a product of ", a("RStudio", href = "http://www.rstudio.com", style = "color:blue")),
        ),
        mainPanel(
            h1("Intoducing Shiny"),
            p(style = "color:black", "Shiny is a new package from RStudio that makes it ", span(em("incredibly easy")), "to build interactive web
              applications with R."),
            br(),
            p(style = "color:black", "For an introduction and live examples, visit the ",
              a("Shiny homepage.", href = "http://shiny.rstudio.com")),
            br(),
            h1("Features"),
            p("- Build useful web applications with only a few lines of code—no Javascipt required.", style = "color:black"),
            p(style = "color:black", "- Shiny applications are automatically 'live' in the same way that ",
              strong("spreadsheets "), "are live. Outputs change instantly as users
              modify inputs, without requiring a reload of the browser."),
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
