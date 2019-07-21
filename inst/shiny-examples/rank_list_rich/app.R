## ---- rank-list-rich-app -------------------------------------------------
## Example shiny app with rank list, rich content, and a custom callback for the
## Shiny input

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a rank list"),
      rank_list(
        text = "Drag the items in the correct order",
        labels = c(
          list(htmltools::div(
            id = "item_1",
            tags$b("Bold Text")
          )),
          list(htmltools::div(
            id = "item_2",
            tags$i("Italic Text")
          )),
          list(htmltools::div(
            id = "item_3",
            tags$a("Link Text", href = "https://github.com/rstudio/sortable")
          ))
        ),
        input_id = "rank_list_1",
        # add a custom callback to return the id
        options = sortable_options(
          onSort = sortable_js_capture_input(
            "rank_list_1",
            "function(item){ return item.firstElementChild.id }"
            )
        )
      ),
      tags$p("You provided the answer"),
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
