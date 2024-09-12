## ---- custom-css-app ------------------------------------------------
## Example shiny app with custom css

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
          "four",
          "five"
        ),
        input_id = "rank_list_1",
        class = c("default-sortable", "custom-sortable") # add custom style
      ),
      tags$style(
        HTML("
          .rank-list-container.custom-sortable {
            background-color: #8A8;
          }
          .custom-sortable .rank-list-item {
            background-color: #BDB;
          }
        ")
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
