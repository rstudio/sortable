# Construct JavaScript method to capture Shiny inputs on change.

This captures the state of a `sortable` list. It will look for a
`data-rank-id` attribute of the first child for each element. If no?
attribute exists for that particular item's first child, the inner text
will be used as an identifier.

## Usage

``` r
sortable_js_capture_input(input_id)

sortable_js_capture_bucket_input(input_id, input_ids, css_ids)
```

## Arguments

- input_id:

  Shiny input name to set

- input_ids:

  Set of Shiny input ids to set corresponding to the provided `css_ids`

- css_ids:

  Set of SortableJS `css_id` values to help retrieve all to set as an
  object

## Value

A character vector with class `JS_EVAL`. See
[`htmlwidgets::JS()`](https://rdrr.io/pkg/htmlwidgets/man/JS.html).

## Details

This method is used with the `onSort` option of `sortable_js`. See
[`sortable_options()`](https://rstudio.github.io/sortable/reference/sortable_options.md).

## See also

[sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)
and
[rank_list](https://rstudio.github.io/sortable/reference/rank_list.md).

Other JavaScript functions:
[`chain_js_events()`](https://rstudio.github.io/sortable/reference/chain_js_events.md)

## Examples

``` r
## -- example-sortable-js-capture -----------------------------------------
# Simple example of sortable_js_capture.
# Important: set the tags CSS `id` equal to the sortable_js `css_id`

if(interactive()) {
  library(shiny)
  library(sortable)

  ui <- fluidPage(
    div(
      id = "sortable",
      div(id = 1, `data-rank-id` = "HELLO", class = "well", "Hello"),
      div(id = 2, `data-rank-id` = "WORLD", class = "well", "world")
    ),
    verbatimTextOutput("chosen"),
    sortable_js(
      css_id = "sortable",
      options = sortable_options(
        onSort = sortable_js_capture_input(input_id = "selected")
      )
    )
  )

  server <- function(input, output){
    output$chosen <- renderPrint(input$selected)
  }

  shinyApp(ui, server)
}



## ------------------------------------
# For an example, see the Shiny app at
system.file("shiny/drag_vars_to_plot/app.R", package = "sortable")
#> [1] "/home/runner/work/_temp/Library/sortable/shiny/drag_vars_to_plot/app.R"
```
