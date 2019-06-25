## ---- shiny-bucketable-list ---------------------------------------------
## Example shiny app with bucketable list

library(shiny)
library(sortable)


ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a bucketable list"),
      bucketable_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucketable_list",
        add_sortable_list(
          text = "Drag from here",
          labels = c("one", "two", "three", "four", "five"),
          input_id = "sortable_list_1"
        ),
        add_sortable_list(
          text = "to here",
          labels = NULL,
          input_id = "sortable_list_2"
        )
      )
    )
  ),
  fluidRow(
    column(
      width = 12,
      tags$h2("You can capture the contents of the lists"),
      column(
        width = 6,
        verbatimTextOutput("results_1")
      ),
      column(
        width = 6,
        verbatimTextOutput("results_2")
      )
    )
  )
)

server <- function(input,output) {
  output$results_1 <-
    renderPrint(
      input$sortable_list_1 # This matches the input_id of the sortable list
    )
  output$results_2 <-
    renderPrint(
      input$sortable_list_2 # This matches the input_id of the sortable list
    )
}


shinyApp(ui, server)
