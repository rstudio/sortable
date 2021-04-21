## ---- update-rank-list-app ----------------------------------------------
## Example shiny app that dynamically updates a rank list

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 4,
      selectInput("data", label = "Select the data source", choices = c("mtcars", "iris")),
      selectInput("nrow", label = "Number of rows", choices = c("15", "50", "All")),
      uiOutput("sortable")
    ),
    column(
      width = 8,
      h2("Results"),
      tableOutput("table")
    )
  )
)

server <- function(input, output, session) {
  rv <- reactiveValues(data = data.frame())

  observeEvent(input$data, {
    rv$data <- get(input$data)
  })

  observeEvent(input$sortable, {
    rv$data <- rv$data[input$sortable]
  })

  output$sortable <- renderUI({
    rank_list("Drag column names to change order", names(rv$data), "sortable")
  })

  output$table <- renderTable({
    if (input$nrow == "All") {
      rv$data
    } else {
      head(rv$data, as.numeric(input$nrow))
    }
  })
}

shinyApp(ui, server)
