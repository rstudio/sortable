## ---- update-rank-list-method-app ---------------------------------------
## Example shiny app that dynamically updates a rank list

library(shiny)
library(sortable)
library(magrittr)


ui <- fluidPage(
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
  fluidRow(
    column(
      width = 12,
      h2("Modify a rank list"),
      actionButton("btnUpdateRank", label = "Update rank list title"),
      actionButton("btnChangeLabels", label = "Change labels"),
      actionButton("btnSortLabels", label = "Sort labels"),
      actionButton("btnEmptyLabels", label = "Empty labels")
    )
  ),
  fluidRow(
    column(
      h2("Exercise"),
      width = 12,
        rank_list(
          text = "Change the order",
          labels = letters[1:5],
          input_id = "rank_list_1"
      )
    )
  ),
  verbatimTextOutput("results")
)

server <- function(input, output, session) {

  # test updating the bucket list label
  counter_bucket <- reactiveVal(1)

  output$results <- renderPrint({
    input$rank_list_1 # This matches the input_id of the rank list
  })

  observe({
    update_rank_list(
      "rank_list_1",
      text = paste("You pressed the update button", counter_bucket(), "times"),
    )
    counter_bucket(counter_bucket() + 1)
  }) %>%
    bindEvent(input$btnUpdateRank)


  observe({
    update_rank_list(
      "rank_list_1",
      labels = sample(LETTERS, 5)
    )
  }) %>%
    bindEvent(input$btnChangeLabels)

  observe({
    update_rank_list(
      "rank_list_1",
      labels = list()
    )
  }) %>%
    bindEvent(input$btnEmptyLabels)

  observe({
    update_rank_list(
      "rank_list_1",
      labels = sort(input$rank_list_1)
    )
  }) %>%
    bindEvent(input$btnSortLabels)


}

shinyApp(ui, server)
