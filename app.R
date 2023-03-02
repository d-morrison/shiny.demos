#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("reactlog")
reactlog_enable()
# Define UI for application that draws a histogram
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  h2(),
  fluidRow(
    "The selected dataset is", textOutput("text_test", inline = TRUE)
  ),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  # Create a reactive expression
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })
  
  output$table <- renderTable({
    dataset()
  })
  
  
  output$text_test = paste(
    "Dataset = ", input$dataset) |> renderText()
  
}


# Run the application 
shinyApp(ui = ui, server = server)
