library(shiny)
library(sortable)


# Example of "independently working" sortable items.
#
# From https://community.rstudio.com/t/trying-to-use-input-text-to-subset-sortable-input/61612
#
# This uses rank_lists to mimic how how a bucket list works, without actually using a bucket_list.  Only the CSS formatting of a bucket_list is re-used.
#
# To link the independent rank_lists, use sortable_options(group = "GROUP") in the rank_list definitions. (You can think of bucket lists as rank lists that share the same group value.). See https://rstudio.github.io/sortable/reference/sortable_options.html for more details.
#
# Create an extra wrapping div container to make the grouped rank_lists appear like a bucket_list.

ui <- fluidPage(
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
  fluidRow(
    column(
      width = 12,
      # choose list of variable names to send to bucket list
      radioButtons(
        inputId = "variableList",
        label   = "Choose your variable list",
        choices = c(
          "names(mtcars)" = "names(mtcars)",
          "state.name" = "state.name"
          )
      ),
      # input text to subset variable names
      textInput(
        inputId = "subsetChooseListText",
        label   = "You can subset the input list by typing here",
        value   = ""
      ),
      div(
        # class value is current default class value for container
        class = "bucket-list-container default-sortable",
        "Drag the items in any desired bucket",
        div(
          # class value is current default class value for list
          class = "default-sortable bucket-list bucket-list-horizontal",
          # need to make sure the outer div size is respected
          # use the current default flex value
          column(
            width = 4,
            uiOutput("selection_list", style = "flex:1 0 100px;")
          ),
          column(
            width = 4,
            rank_list(
              text = "to here",
              labels = list(),
              input_id = "rank_list_2",
              options = sortable_options(group = "mygroup")
            )),
          column(
            width = 4,
            rank_list(
              text = "and also here",
              labels = list(),
              input_id = "rank_list_3",
              options = sortable_options(group = "mygroup")
            )
          )
        )
      ),
      uiOutput("dragAndDropList")
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

        tags$p("input$rank_list_3"),
        verbatimTextOutput("results_3")
      )
    )
  )
)

server <- function(input, output) {

  # initialize reactive values
  varList <- reactive({
    req(input$variableList)
    if (input$variableList == "state.name") {
      state.name
    } else {
      names(mtcars)
    }
  })

  subsetChooseList <- reactive({
    items <- varList()
    pattern <- input$subsetChooseListText
    if (nchar(pattern) < 1) {
      return(items)
    }
    items[
      grepl(
        x = items,
        pattern = input$subsetChooseListText,
        ignore.case = TRUE
      )
    ]
  })

  output$selection_list <- renderUI({
    labels <- subsetChooseList()

    # remove already chosen items
    labels <- labels[!(
      labels %in% input$rank_list_2 |
        labels %in% input$rank_list_3
    )]
    rank_list(
      text = "Drag from here",
      labels = labels,
      input_id = "rank_list_1",
      options = sortable_options(group = "mygroup")
    )
  })

  # visual output for debugging
  output$results_1 <- renderPrint(input$rank_list_1)
  output$results_2 <- renderPrint(input$rank_list_2)
  output$results_3 <- renderPrint(input$rank_list_3)

}


shinyApp(ui, server)
