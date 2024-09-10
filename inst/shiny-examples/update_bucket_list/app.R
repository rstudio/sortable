## ---- update-bucket-list-app -----------------------------------------------
## Example shiny app with bucket list update

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
      h2("Update the title"),
      actionButton("btnUpdateBucket", label = "Update bucket list title"),
      actionButton("btnAddLeft", label = "Add element to left"),
      actionButton("btnMoveLeft", label = "Move element from right to left"),
    )
  ),
  fluidRow(
    column(
      h2("Exercise"),
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
            "three"
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
  )
)

server <- function(input, output, session) {

  # test updating the bucket list label
  counter_bucket <- reactiveVal(1)
  counter_option <- reactiveVal(3)
  observe({
    update_bucket_list(
      "bucket_list_group",
      header = paste("You pressed the update button", counter_bucket(), "times"),
      session = session
    )
    counter_bucket(counter_bucket() + 1)
  }) %>%
    bindEvent(input$btnUpdateBucket)

  observe({
    len <- length(input$rank_list_1)
    count_word <- if(len == 0) "" else glue::glue("({len})")
    update_rank_list(
      "rank_list_1",
      text = paste0("From here ", count_word),
      session = session
    )
  }) %>%
    bindEvent(input$rank_list_1)

  observe({
    len <- length(input$rank_list_2)
    count_word <- if(len == 0) "" else glue::glue("({len})")
    update_rank_list(
      "rank_list_2",
      text = paste0("To here ", count_word),
      session = session
    )
  }) %>%
    bindEvent(input$rank_list_2)

  # Respond to press of btnAddLeft
  observe({
    new_el <- paste("Element", counter_option() + 1)
    counter_option(counter_option() + 1)
    update_rank_list(
      "rank_list_1",
      labels = c(input$rank_list_1, new_el)
    )
  }) %>%
    bindEvent(input$btnAddLeft)

  # Respond to press of btnMoveLeft
  observe({
    bottom_el <- tail(input$rank_list_2, 1)
    if (length(bottom_el)){
      update_rank_list(
        "rank_list_1",
        labels = c(input$rank_list_1, bottom_el)
      )
      update_rank_list(
        "rank_list_2",
        labels = head(input$rank_list_2, -1)
      )
    }
  }) %>%
    bindEvent(input$btnMoveLeft)

}




shinyApp(ui, server)
