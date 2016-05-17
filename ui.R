# Airquality in New York 1973

library(shiny)
library(markdown)

# Define UI for application that draws a histogram
shinyUI(navbarPage("Air Quality in New York in 1973",
                   
                   # Application title
                   tabPanel("Data Selection",
                            
                            # Sidebar with a slider input month
                            sidebarLayout(
                                sidebarPanel(
                                    helpText("Which variable should be displayed?"),
                                    selectInput("variable", label = h5("Variable"), 
                                                choices = list("Ozone" = 1, "Solar radiation" = 2, "Wind" = 3, "Temperature" = 4), 
                                                selected = 4),
                                    helpText("Which months should be displayed?"),
                                    sliderInput('month', label = h5("Month"), min=5, max=9, value=c(5,9), step=1)
                                ),
                                
                                # Show a plot of the data
                                mainPanel(
                                    plotOutput("plotOut")
                                )
                            )
                   ),
                   tabPanel("Help",
                            mainPanel(
                                includeMarkdown("help.md")
                            )
                   )
))

