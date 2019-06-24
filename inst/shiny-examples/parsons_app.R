## - parsons_app ---------------------------------------------
## Example shiny app with parsons problem

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
      tags$h2("This shiny app contains a parsons problem."),
    column(
      width = 12,
      parsons(
        header = "This is an example of a Parsons problem",
        text = c("Drag from here", "Construct your solution here"),
        labels = list(
          c(
            "iris",
            "mutate(...)",
            "summarize(...)",
            "print()"
          ),
          NULL
        ),
        selector = paste0("input", 1:2),
        output_id = paste0("parsons_", 1:2),
        group_name = "parsons_test",
      )
    )
  ),
  fluidRow(
    tags$h2("You provided the answer"),
    column(
      width = 6,
      verbatimTextOutput("answer")
    )
  )
)

server <- function(input,output) {
  output$answer <-
    renderPrint(
      input$parsons_2 # This matches the output_id of the sortable list
    )
}


shinyApp(ui, server)
