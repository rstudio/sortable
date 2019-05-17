
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sortable

<!-- badges: start -->

<!-- badges: end -->

The goal of sortable is to …

## Installation

You can install the released version of sortable from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("sortable")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("timelyportfolio/sortable")
```

## sortable.js

[Sortable.js](http://rubaxa.github.io/Sortable) is so ridiculously
amazing that of course we need it in **R** as an
[htmlwidget](http://htmlwidgets.org). `sortable` attempts to harness
some of the power of `Sortable.js`.

*note: this is experimental and underdevelopment*, but it does work. Try
it out. I don’t think it will hurt anything. `sortable` is not on CRAN,
but should install easily with `devtools::install_github`.

``` r
# install.packages("remotes")
remotes::install_github("timelyportfolio/sortable")
```

### Good Widgets Just Work

I think `sortable` works best with `htmltools::tags`.

``` r
library(sortable)
library(htmltools)

html_print(tagList(
  tags$ul(id = "uniqueId01"
          ,tags$li("can you move me?")
          ,tags$li("sure, touch me.")
          ,tags$li("do you know my powers?")
  )
  ,sortable("uniqueId01") # use the id as the selector
))
```

### Good Widgets Work with other Widgets

When `htmlwidgets` play well together, I am very happy.

``` r
library(DiagrammeR)
library(htmltools)
library(sortable)

html_print(tagList(
  tags$div(id="aUniqueId"
           ,tags$div(style = "border: solid 0.2em gray; float:left;"
                     ,mermaid("graph LR; S[Sortable.js] -->|sortable| R ",height=200,width = 200)
           )
           ,tags$div(style = "border: solid 0.2em gray; float:left;"
                     ,mermaid("graph TD; js -->|htmlwidgets| R ",height=200,width = 200)
           )
  )
  ,sortable("aUniqueId")
))
```

### Good Widgets Work in Shiny

It only works as an output right now, but of course I want it to be an
input (*I’ll try*) also. Let’s see it as an output.

``` r
library(shiny)
library(sortable)

ui = shinyUI(fluidPage(
  fluidRow(
    column( width = 4
            ,tags$h4("sortable in Shiny + Bootstrap")
            ,tags$div(id="veryUniqueId", class="list-group"
                      ,tags$div(class="list-group-item","bootstrap 1")
                      ,tags$div(class="list-group-item","bootstrap 2")
                      ,tags$div(class="list-group-item","bootstrap 3")
            )
    )
  )
  ,sortable( "veryUniqueId")
))

server = function(input,output){
  
}

shinyApp(ui=ui,server=server)
```

Now, let’s see if we can get an idea what it might look like as an input
or integral piece of Shiny.

``` r
library(shiny)
library(sortable)

ui <- shinyUI(fluidPage(
  fluidRow(
    column(
      width = 6,
      tags$h4("sortable in Shiny + Bootstrap"),
      sortableItemlist(
        outputId = "mySort", selector = "veryUniqueId", class = "list-group-item",
        labels = c(
          "bootstrap 1",
          "bootstrap 2",
          "bootstrap 3"
        )
      ),
      tags$h4("Current sorting order"),
      verbatimTextOutput("results")
    )
  )
))

server <- function(input, output) {
  output$results <- renderPrint({
    input$mySort
  })
}
shinyApp(ui=ui,server=server)
```

Or, check out these reorderable tabs by
`runGist("2dbe45f77b65e28acab9")`. All we had to do was add an `id` and
add one line of code to the [Tabset
example](https://github.com/rstudio/shiny-examples/tree/master/006-tabsets)
from [RStudio](http://rstudio.com).

<img src="inst/images/sortable_tabs.gif"/>
