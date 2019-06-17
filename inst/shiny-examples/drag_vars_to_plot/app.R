library(shiny)
library(sortable)
library(ggplot2)
library(dplyr)

ui <- fluidPage(
  fluidRow(
    class = "panel panel-success",
    tags$div(
      class = "panel-heading",
      tags$h3("Dragging variables to define a plot")
    ),
    fluidRow(
      class = "panel-body",
      column(
        width = 3,
        tags$div(
          class = "panel panel-default",
          tags$div(class = "panel-heading", "Variables"),
          tags$div(
            class = "panel-body",
            id = "sort1",
            lapply(
              colnames(mtcars),
              function(co) {
                tag(
                  "p",
                  list(
                    class = class(mtcars[, co]),
                    tags$span(class = "glyphicon glyphicon-move"),
                    tags$strong(co)
                  )
                )
              }
            )
          )
        )
      ),
      column(
        width = 3,
        # analyse as x
        tags$div(
          class = "panel panel-default",
          tags$div(
            class = "panel-heading",
            tags$span(class = "glyphicon glyphicon-stats"),
            "Analyze as x (drag here)"
          ),
          tags$div(
            class = "panel-body",
            id = "sort2"
          )
        ),
        # analyse as y
        tags$div(
          class = "panel panel-default",
          tags$div(
            class = "panel-heading",
            tags$span(class = "glyphicon glyphicon-stats"),
            "Analyze as y (drag here)"
          ),
          tags$div(
            class = "panel-body",
            id = "sort3"
          )
        )

      ),
      column(
        width = 6,
        plotOutput("plot")

      )
    )
  ),
  sortable(
    "sort1",
    options = sortable_options(
      group = list(
        name = "sortGroup1",
        put = TRUE
      ),
      swap = TRUE,
      swapClass = "sortable-swap-highlight",
      sort = FALSE,
      onSort = sortable_js_capture_input("sort_vars")
    )
  ),
  sortable(
    "sort2",
    options = sortable_options(
      group = list(
        group = "sortGroup1",
        put = htmlwidgets::JS('function (to) { return to.el.children.length < 1; }'),
        pull = TRUE
      ),
      swap = TRUE,
      swapClass = "sortable-swap-highlight",
      onSort = sortable_js_capture_input("sort_x")
    )
  ),
  sortable(
    "sort3",
    options = sortable_options(
      group = list(
        group = "sortGroup1",
        put = htmlwidgets::JS('function (to) { return to.el.children.length < 1; }'),
        pull = TRUE
      ),
        swap = TRUE,
      swapClass = "sortable-swap-highlight",
      onSort = sortable_js_capture_input("sort_y")
    )
  )
)

server <- function(input, output) {
  output$variables <- renderPrint(input[["sort_vars"]])
  output$analyse_x <- renderPrint(input[["sort_x"]])
  output$analyse_y <- renderPrint(input[["sort_y"]])


  x <- reactive({
    x <- input$sort_x
    if (is.character(x)) x %>% trimws()
  })

  y <- reactive({
    input$sort_y %>% trimws()
  })

  output$plot <-
    renderPlot({
      validate(
        need(x(), "Drag a variable to x"),
        need(y(), "Drag a variable to y")
      )
      if (!is.null(x()) && x() != "" && !is.null(y()) && (y() != "")) {
        dat <- mtcars[, c(x(), y())]
        names(dat) <- c("x", "y")
        ggplot(dat, aes(x = x, y = y)) + geom_point() +
          xlab(x()) +
          ylab(y())
      } else {
        ggplot() + geom_blank()
      }

    })

}
shinyApp(ui, server)
