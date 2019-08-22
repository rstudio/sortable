## ---- rank-list-app -------------------------------------------------
## Example shiny app with rank list

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$b("Exercise"),
      rank_list(
        text = "Drag the items in any desired order",
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
      tags$b("Result"),
      verbatimTextOutput("results")
    )
  )
)

server <- function(input, output) {
  output$results <- renderPrint({
    input$rank_list_1 # This matches the input_id of the rank list
  })
}

shinyApp(ui, server)
