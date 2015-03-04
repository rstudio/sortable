[Sortable.js](http://rubaxa.github.io/Sortable) is so ridiculously amazing that of course we need it in **R** as an [htmlwidget](http://htmlwidgets.org).  `sortableR` attempts to harness some of the power of `Sortable.js`.

*note: this is experimental and underdevelopment*, but it does work.  Try it out.  I don't think it will hurt anything.  `sortableR` is not on CRAN, but should install easily with `devtools::install_github`.

```r
# devtools::install_github("timelyportfolio/sortableR")
```

### Good Widgets Just Work

I think `sortableR` works best with `htmltools::tags`.

```r
library(sortableR)
library(htmltools)

html_print(tagList(
  tags$ul(id = "uniqueId01"
    ,tags$li("can you move me?")
    ,tags$li("sure, touch me.")
    ,tags$li("do you know my powers?")
  )
  ,sortableR("uniqueId01") # use the id as the selector
))
```

### Good Widgets Work with other Widgets

When `htmlwidgets` play well together, I am very happy.

```r
library(DiagrammeR)
library(htmltools)
library(sortableR)

html_print(tagList(
  tags$div(id="aUniqueId"
    ,tags$div(style = "border: solid 0.2em gray; float:left;"
      ,mermaid("graph LR; S[Sortable.js] -->|sortableR| R ",height=200,width = 200)
    )
    ,tags$div(style = "border: solid 0.2em gray; float:left;"
      ,mermaid("graph TD; js -->|htmlwidgets| R ",height=200,width = 200)
    )
  )
  ,sortableR("aUniqueId")
))

```

### Good Widgets Work in Shiny

It only works as an output right now, but of course I want it to be an input (*I'll try*) also.  Let's see it as an output.

```r
library(shiny)
library(sortableR)

ui = shinyUI(fluidPage(
  fluidRow(
    column( width = 4
      ,tags$h4("sortableR in Shiny + Bootstrap")
      ,tags$div(id="veryUniqueId", class="list-group"
        ,tags$div(class="list-group-item","bootstrap 1")
        ,tags$div(class="list-group-item","bootstrap 2")
        ,tags$div(class="list-group-item","bootstrap 3")
      )
    )
  )
  ,sortableR( "veryUniqueId")
))

server = function(input,output){
  
}

shinyApp(ui=ui,server=server)
```

Now, let's see if we can get an idea what it might look like as an input or integral piece of Shiny.

```r
library(shiny)
library(sortableR)

ui = shinyUI(fluidPage(
  fluidRow(
    column( width = 4
      ,tags$h4("sortableR in Shiny + Bootstrap")
      ,tags$div(id="veryUniqueId", class="list-group"
        ,tags$div(class="list-group-item","bootstrap 1")
        ,tags$div(class="list-group-item","bootstrap 2")
        ,tags$div(class="list-group-item","bootstrap 3")
      )
    )
  )
  ,verbatimTextOutput("results")
  ,sortableR(
    "veryUniqueId"
    ,options = list(onSort = htmlwidgets::JS('
      function(evt){
        debugger
        Shiny.onInputChange("mySort", this.el.textContent)
      }      
    '))
  )
))

server = function(input,output){
  output$results <- renderPrint({input$mySort})
}

shinyApp(ui=ui,server=server)
```
