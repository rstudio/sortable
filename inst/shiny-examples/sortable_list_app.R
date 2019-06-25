## - shiny-sortable-list -------------------------------------
## Example shiny app with bucketable list


library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a sortable list"),
      sortable_list(
        text = "Drag the items in the correct order",
        labels = sample(c("one", "two", "three", "four", "five")),
        input_id = "sortable_list_1"
      )
    )
  ),
  fluidRow(
    verbatimTextOutput("results")
  )
)

server <- function(input, output) {
  output$results <- renderPrint({
    input$sortable_list_1 # This matches the input_id of the sortable list
  })
}


shinyApp(ui, server)
