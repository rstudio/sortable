#' sortable UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sortable_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(
        width = 12,
        h2("Update the title"),
        actionButton(ns("btnUpdateBucket"), label = "Update bucket list title"),
        actionButton(ns("btnUpdateLabels"), label = "Update bucket list labels")
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
              "1"
            ),
            input_id = ns("rank_list_1")
          ),
          add_rank_list(
            text = "to here",
            labels = NULL,
            input_id = ns("rank_list_2")
          )
        )
      )
    )
  )
}

#' sortable Server Functions
#'
#' @noRd
mod_sortable_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    # test updating the bucket list label
    counter_bucket <- reactiveVal(1)
    label_counter <- reactiveVal(1)
    observe({
      update_bucket_list(
        "bucket_list_group",
        header = paste("You pressed the update button", counter_bucket(), "times"),
        session = session
      )
      counter_bucket(counter_bucket() + 1)
    }) %>%
      bindEvent(input$btnUpdateBucket)

    observeEvent(
      input$btnUpdateLabels, {
        label_counter(label_counter() + 1)
        update_rank_list(
          "rank_list_1",
          labels = c(input$rank_list_1, label_counter())
        )
      })

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

  })
}

## To be copied in the UI
# mod_sortable_ui("sortable_1")

## To be copied in the server
# mod_sortable_server("sortable_1")
