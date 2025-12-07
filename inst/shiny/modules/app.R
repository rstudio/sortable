## ---- modules-app -----------------------------------------------------
## Example shiny app that dynamically updates a rank list

library(shiny)
library(sortable)
library(magrittr)

# shiny module ui ----
mod_rank_list_ui <- function(id, text, labels) {
  ns <- NS(id)
  fluidRow(
  rank_list(text, labels, input_id = ns("rank_list_1")),
  verbatimTextOutput(ns("results"))
  )
}

# shiny module serevr ----
mod_rank_list_server <- function(id) {
  moduleServer(id, function(input, output, session) {
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

  })
}


# shiny ui ----
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
      width = 6,
        h2("Rank list A"),
        mod_rank_list_ui(
          id = "rl1",
          text = "Change the order",
          labels = letters[1:5]
      )
    ),
    column(
      width = 6,
      h2("Rank list B"),
      mod_rank_list_ui(
        id = "rl2",
        text = "Second order",
        labels = LETTERS[6:10]
      )
    )
  ),
)


# shiny server ----
server <- function(input, output, session) {
  mod_rank_list_server("rl1")
  results_2 <- mod_rank_list_server("rl2")
}

shinyApp(ui, server)
