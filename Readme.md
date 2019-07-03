
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sortable <img src='man/figures/sortable-logo.png' align="right" height="139" />

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/rstudio/sortable.svg?branch=master)](https://travis-ci.org/rstudio/sortable)
[![CRAN
version](http://www.r-pkg.org/badges/version/sortable)](https://cran.r-project.org/package=sortable)
[![sortable downloads per
month](http://cranlogs.r-pkg.org/badges/sortable)](http://www.rpackages.io/package/sortable)
[![Codecov test
coverage](https://codecov.io/gh/rstudio/sortable/branch/master/graph/badge.svg)](https://codecov.io/gh/rstudio/sortable?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The `sortable` package enables drag-and-drop behaviour in your Shiny
apps. It does this by exposing the functionality of the
[sortable.js](https://sortablejs.github.io/Sortable/) JavaScript library
as an [htmlwidget](https://htmlwidgets.org) in R, so you can use this in
Shiny apps and widgets, `learnr` tutorials as well as R Markdown.

## Installation

~~You can install the released version of sortable from
[CRAN](https://CRAN.R-project.org) with:~~

``` r
~~install.packages("sortable")~~
```

And the development version from
[GitHub](https://github.com/rstudio/sortable) with:

``` r
# install.packages("remotes")
remotes::install_github("rstudio/sortable")
```

## Examples

### Rank list

You can create a drag-and-drop input object in Shiny, using the
`rank_list()` function.

<center>

<img src="man/figures/rank_list_shiny.gif" style = 'width:500px;'></img>

</center>

``` r
## Example shiny app with rank list

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a rank list"),
      rank_list(
        text = "Drag the items in the correct order",
        labels = sample(c("one", "two", "three", "four", "five")),
        input_id = "rank_list_1"
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
```

### Bucket list

Witha a bucket list you can have more than one rank lists in a single
object. This can be useful for bucketing task, e.g. asking your students
to classify objects into multiple categories.

<center>

<img src="man/figures/bucket_list_shiny.gif" style = 'width:500px;'></img>

</center>

``` r
## Example shiny app with bucket list

library(shiny)
library(sortable)


ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a bucket list from the `sortable` package"),
      bucket_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucket_list",
        add_rank_list(
          text = "Drag from here",
          labels = c("one", "two", "three", "four", "five"),
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
      tags$h2("You provided the answers"),
      column(
        width = 6,
        verbatimTextOutput("results_1")
      ),
      column(
        width = 6,
        verbatimTextOutput("results_2")
      )
    )
  )
)

server <- function(input,output) {
  output$results_1 <-
    renderPrint(
      input$rank_list_1 # This matches the input_id of the rank list
    )
  output$results_2 <-
    renderPrint(
      input$rank_list_2 # This matches the input_id of the rank list
    )
}


shinyApp(ui, server)
```

### Add drag-and-drop to any HTML element

You can also use `sortable_js()` to drag and drop other widgets:

<center>

![](man/figures/diagrammer.gif)

</center>

``` r
library(DiagrammeR)
library(htmltools)

html_print(tagList(
  tags$p("You can drag and drop the diagrams to switch order:"),
  tags$div(
    id = "aUniqueId",
    tags$div(
      style = "border: solid 0.2em gray; float:left; margin: 5px",
      mermaid("graph LR; S[Sortable.js] -->|sortable| R ", height = 250, width = 300)
    ),
    tags$div(
      style = "border: solid 0.2em gray; float:left; margin: 5px",
      mermaid("graph TD; JavaScript -->|htmlwidgets| R ", height = 250, width = 150)
    )
  ),
  sortable_js("aUniqueId") # again, the CSS id must match the selector
))
```
