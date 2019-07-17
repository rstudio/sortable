## ---- bucket-list-app -----------------------------------------------
## Example shiny app with bucket list

library(shiny)
library(sortable)


ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a bucket list from the `sortable` package"),
      bucket_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucket_list",
        add_rank_list(
          text = "Drag from here",
          labels = c("one", "two", "three", "four", "five"),
          input_id = "rank_list_1"
        ),
        add_rank_list(
          text = "to here",
          labels = NULL,
          input_id = "rank_list_2"
        )
      )
    )
  ),
  fluidRow(
    column(
      width = 12,
      tags$h2("You provided the answers"),
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
      input$rank_list_1 # This matches the input_id of the rank list
    )
  output$results_2 <-
    renderPrint(
      input$rank_list_2 # This matches the input_id of the rank list
    )
}


shinyApp(ui, server)
