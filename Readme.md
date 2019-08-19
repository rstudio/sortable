
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
[SortableJS](https://sortablejs.github.io/Sortable/) JavaScript library
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
      tags$b("Exercise"),
      rank_list(
        text = "Drag the items in the correct order",
        labels = list(
          "one",
          "two",
          "three",
          htmltools::tags$div(
            htmltools::em("Complex"), " html tags with no label name"
          ),
          "five" = htmltools::tags$div(
            htmltools::em("Complex"), " html tags with name: 'five'"
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
```

### Bucket list

With a bucket list you can have more than one rank lists in a single
object. This can be useful for bucketing tasks, e.g. asking your
students to classify objects into multiple
categories.

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
      tags$b("Exercise"),
      width = 12,
      bucket_list(
        header = "Drag the items in any desired bucket",
        group_name = "bucket_list_group",
        add_rank_list(
          text = "Drag from here",
          labels = list(
            "one",
            "two",
            "three",
            htmltools::tags$div(
              htmltools::em("Complex"), " html tags with no label name"
            ),
            "five" = htmltools::tags$div(
              htmltools::em("Complex"), " html tags with name: 'five'"
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
      tags$b("Result"),
      width = 12
    )),
  fluidRow(
    column(
      width = 12,
      column(
        width = 6,
        tags$p("input$rank_list_1"),
        verbatimTextOutput("results_1")
      ),
      column(
        width = 6,
        tags$p("input$rank_list_2"),
        verbatimTextOutput("results_2")
      )
    )
  ),
  fluidRow(
    column(
      width = 12,
      column(
        width = 12,
        tags$p("input$bucket_list_group"),
        verbatimTextOutput("results_3")
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
  output$results_3 <-
    renderPrint(
      input$bucket_list_group # Matches the group_name of the bucket list
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
      mermaid("graph LR; S[SortableJS] -->|sortable| R ",
              height = 250, width = 300)
    ),
    tags$div(
      style = "border: solid 0.2em gray; float:left; margin: 5px",
      mermaid("graph TD; JavaScript -->|htmlwidgets| R ", 
              height = 250, width = 150)
    )
  ),
  sortable_js("aUniqueId") # again, the CSS id must match the selector
))
```

## Related work

The [`esquisse` package](https://github.com/dreamRs/esquisse) lets ‘you
explore your data quickly to extract the information they hold. You can
only create simple plots, you won’t be able to use custom scales and all
the power of ggplot2. This is just the start\!’

There is also the [`shinyjqui`
package](https://yang-tang.github.io/shinyjqui/), an ‘R wrapper for
jQuery UI javascript library. It allows user to easily add interactions
and animation effects to a shiny app’.
