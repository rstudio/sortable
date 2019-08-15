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
        text = "Drag the items in the correct order",
        labels = list(
          "one",
          "two",
          "three",
          htmltools::tags$div(
            htmltools::tags$div(
              id = "inner_element_4",
              "Complex html tag(s) with no 'id' attribute in outer element."
            )
          ),
          htmltools::tags$div(
            id = "five",
            "Extra text",
            htmltools::tags$div(
              id = "inner_element_5",
              "Complex html tag(s) with id: 'five'"
            )
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
