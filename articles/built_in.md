# Using rank list and bucket lists in Shiny apps

## Introduction

Although `sortable` is designed to be a low-level wrapper around the
`SortableJS` library, the package also exposes a few higher level
functions.

These functions enable you to easily using drag-and-drop widgets into a
Shiny app for specific tasks:

- To create a ranking task, use
  [`rank_list()`](https://rstudio.github.io/sortable/reference/rank_list.md)
- To create a bucketing task, use
  [`bucket_list()`](https://rstudio.github.io/sortable/reference/bucket_list.md)

## Rank list

### Demo

This is a rank list app, allowing you to change the order of items in a
list. The app demonstrates three types of drag-and-drop behaviour:

- Default
- Multi-drag, to select multiple items and drag as a group
- Swap, to swap two items

## Default, multi-drag and swapping behaviour

- [Default](_w_336835e4509c4aa2b453d0022517c520/#tab-8729-1)
- [Multi-drag](_w_336835e4509c4aa2b453d0022517c520/#tab-8729-2)
- [Swap](_w_336835e4509c4aa2b453d0022517c520/#tab-8729-3)

**Exercise**

Drag the items in any desired order

one

two

three

*Complex* html tag without a name

*Complex* html tag with name: 'five'

**Result**

``` shiny-text-output
```

**Exercise**

You can select multiple items, then drag as a group

one

two

three

*Complex* html tag without a name

*Complex* html tag with name: 'five'

**Result**

``` shiny-text-output
```

**Exercise**

Notice that dragging causes items to swap

one

two

three

*Complex* html tag without a name

*Complex* html tag with name: 'five'

**Result**

``` shiny-text-output
```

### Source code

This is the source code:

``` r
## Example shiny app with rank list

library(shiny)
library(sortable)

labels <- list(
  "one",
  "two",
  "three",
  htmltools::tags$div(
    htmltools::em("Complex"), " html tag without a name"
  ),
  "five" = htmltools::tags$div(
    htmltools::em("Complex"), " html tag with name: 'five'"
  )
)

rank_list_basic <- rank_list(
  text = "Drag the items in any desired order",
  labels = labels,
  input_id = "rank_list_basic"
)

rank_list_swap <- rank_list(
  text = "Notice that dragging causes items to swap",
  labels = labels,
  input_id = "rank_list_swap",
  options = sortable_options(swap = TRUE)
)

rank_list_multi <- rank_list(
  text = "You can select multiple items, then drag as a group",
  labels = labels,
  input_id = "rank_list_multi",
  options = sortable_options(multiDrag = TRUE)
)



ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
    tags$h2("Default, multi-drag and swapping behaviour"),
      tabsetPanel(
        type = "tabs",
        tabPanel(
          "Default",
            tags$b("Exercise"),
            rank_list_basic,
            tags$b("Result"),
            verbatimTextOutput("results_basic")
        ),
        tabPanel(
          "Multi-drag",
            tags$b("Exercise"),
            rank_list_multi,
            tags$b("Result"),
            verbatimTextOutput("results_multi")
        ),
        tabPanel(
          "Swap",
            tags$b("Exercise"),
            rank_list_swap,
            tags$b("Result"),
            verbatimTextOutput("results_swap")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  output$results_basic <- renderPrint({
    input$rank_list_basic # This matches the input_id of the rank list
  })
  output$results_multi <- renderPrint({
    input$rank_list_multi # This matches the input_id of the rank list
  })
  output$results_swap <- renderPrint({
    input$rank_list_swap # This matches the input_id of the rank list
  })
}

shinyApp(ui, server)
```

## Bucket list

### Demo

This is a bucket list app, where the bucket list allows you to drag from
one bucket to another.

**Exercise**

Drag the items in any desired bucket

Drag from here

one

two

three

*Complex* html tag without a name

*Complex* html tag with name: 'five'

to here

**Result**

input\$rank_list_1

``` shiny-text-output
```

input\$rank_list_2

``` shiny-text-output
```

input\$bucket_list_group

``` shiny-text-output
```

### Source code

This is the source code:

``` r
## Example shiny app with bucket list

library(shiny)
library(sortable)

ui <- fluidPage(
  tags$head(
    tags$style(HTML(".bucket-list-container {min-height: 350px;}"))
  ),
  fluidRow(
    column(
      tags$b("Exercise"),
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
        add_rank_list(
          text = "to here",
          labels = NULL,
          input_id = "rank_list_2"
        )
      )
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

        tags$p("input$bucket_list_group"),
        verbatimTextOutput("results_3")
      )
    )
  )
)

server <- function(input, output, session) {
  output$results_1 <-
    renderPrint(
      input$rank_list_1 # This matches the input_id of the first rank list
    )
  output$results_2 <-
    renderPrint(
      input$rank_list_2 # This matches the input_id of the second rank list
    )
  output$results_3 <-
    renderPrint(
      input$bucket_list_group # Matches the group_name of the bucket list
    )

}


shinyApp(ui, server)
```
