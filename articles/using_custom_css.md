# Using custom styles with CSS

``` r
library(sortable)
#> To use sortable with shiny modules, run `sortable::enable_modules()` to opt
#> into the new standard.
#> 
#> 
#> 
#> This message is displayed once per session.
```

## Using custom styles

Sometimes you want to take control of the styling of your app,
e.g. changing colours or sizes.

The functions
[`rank_list()`](https://rstudio.github.io/sortable/reference/rank_list.md)
and
[`bucket_list()`](https://rstudio.github.io/sortable/reference/bucket_list.md)
allows you to set a custom CSS class, and you can then define your own
CSS rules that modifies your shiny app.

The default CSS style for a rank list is `default-sortable`, but you can
specify your own class by modifying the `class` argument.

For example, to add `custom-sortable` to the CSS class, use:

``` r
rank_list(
  class = c("default-sortable", "custom-sortable"), # add custom style
  ...
)
```

Then you can use any of the standard techniques to [Style your apps with
CSS](https://shiny.rstudio.com/articles/css.html) to modify your
styling.

For example, to modify the `custom-sortable` class using a `shiny` tag,
use:

``` r
tags$style(
  HTML("
    .rank-list-container.custom-sortable {
      background-color: #8A8;
    }
    .custom-sortable .rank-list-item {
      background-color: #BDB;
    }
  ")
)
```

This app contains a fully worked example that turns the background
colours of the `rank_list` into shades of green:

**Exercise**

Drag the items in any desired order

one

two

three

four

five

**Result**

``` shiny-text-output
```

## Source code

``` r
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
```
