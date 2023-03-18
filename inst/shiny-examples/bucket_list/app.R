## ---- bucket-list-app -----------------------------------------------
## Example shiny app with bucket list

library(shiny)
library(sortable)


ui <- fluidPage(
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
  fluidRow(
    column(
      tags$b("Exercise"),
      actionButton("btnUpdateBucket", label = "Update bucket list title"),
      actionButton("btnUpdateRank", label = "Update rank list title"),
      width = 12,
      bucket_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucket_list_group",
        orientation = "horizontal",
        add_rank_list(
          text = "Drag from here",
          labels = list(
            "one",
            "two",
            "three",
            htmltools::tags$div(
              htmltools::em("Complex"), " html tag without a name"
            ),
            "five" = htmltools::tags$div(
              htmltools::em("Complex"), " html tag with name: 'five'"
            )
          ),
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
      tags$b("Result"),
      column(
        width = 12,

        tags$p("input$rank_list_1"),
        verbatimTextOutput("results_1"),

        tags$p("input$rank_list_2"),
        verbatimTextOutput("results_2"),

        tags$p("input$bucket_list_group"),
        verbatimTextOutput("results_3")
      )
    )
  )
)

server <- function(input, output, session) {
  output$results_1 <-
    renderPrint(
      input$rank_list_1 # This matches the input_id of the first rank list
    )
  output$results_2 <-
    renderPrint(
      input$rank_list_2 # This matches the input_id of the second rank list
    )
  output$results_3 <-
    renderPrint(
      input$bucket_list_group # Matches the group_name of the bucket list
    )

  # test updating the bucket list label
  counter_bucket <- reactiveVal(1)
  observe({
    update_bucket_list(
      "bucket_list_group",
      text = paste("You pressed the button", counter_bucket(), "times"),
      session = session
    )
    counter_bucket(counter_bucket() + 1)
  }) %>%
    bindEvent(input$btnUpdateBucket)

  # test updating the rank list label
  counter_rank <- reactiveVal(1)
  observe({
    update_rank_list(
      "rank_list_1",
      text = paste("You pressed the button", counter_rank(), "times"),
      session = session
    )
    counter_rank(counter_rank() + 1)
  }) %>%
    bindEvent(input$btnUpdateRank)
}


shinyApp(ui, server)
