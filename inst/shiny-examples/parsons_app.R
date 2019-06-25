## ---- parsons-app -------------------------------------------------------
## Example shiny app with parsons problem

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This shiny app contains a parsons problem."),

      ## This is the parsons problem
      parsons(
        header = "This is an example of a Parsons problem",
        labels = c(
          "iris",
          "mutate(...)",
          "summarize(...)",
          "print()"
        ),
        input_id = "parsons_unique_id"
      )

    )
  ),
  fluidRow(
    column(
      width = 12,
      tags$h2("You provided the answer"),
      verbatimTextOutput("answer")
    )
  )
)

server <- function(input,output) {
  output$answer <-
    renderPrint(
      input$parsons_unique_id # This matches the input_id of the parsons problem
    )
}


shinyApp(ui, server)
