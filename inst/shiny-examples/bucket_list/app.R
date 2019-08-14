## ---- bucket-list-app -----------------------------------------------
## Example shiny app with bucket list

library(shiny)
library(sortable)


ui <- fluidPage(
  fluidRow(
    column(
      tags$b("Exercise"),
      width = 12,
      bucket_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucket_list_group",
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
      tags$b("Result"),
      width = 12
    )),
  fluidRow(
    column(
      width = 12,
      column(
        width = 6,
        tags$p("input$rank_list_1"),
        verbatimTextOutput("results_1")
      ),
      column(
        width = 6,
        tags$p("input$rank_list_2"),
        verbatimTextOutput("results_2")
      )
    )
  ),
  fluidRow(
    column(
      width = 12,
      column(
        width = 12,
        tags$p("input$bucket_list_group"),
        verbatimTextOutput("results_3")
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
  output$results_3 <-
    renderPrint(
      input$bucket_list_group # Matches the group_name of the bucket list
    )
}


shinyApp(ui, server)
