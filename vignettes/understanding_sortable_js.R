## ----echo = F------------------------------------------------------------
## get knitr just the way we like it

knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE,
  error = FALSE,
  tidy = FALSE,
  cache = FALSE
  # , results = 'asis'
)

## ------------------------------------------------------------------------
library(sortable)

## ---- echo=FALSE---------------------------------------------------------
sortable_js(selector = "example01")

## ------------------------------------------------------------------------
library(htmltools)
tagList(
  tags$ul(
    id = "example02",
    tags$li("drag me"),
    tags$li("sort me"),
    tags$li("any way you like")
  ),
  sortable_js("example02")
)

## ---- collapse=TRUE------------------------------------------------------
library(base64)
library(withr)

# use example from ?base64::img
pngfile_1 <- tempfile()
with_png(pngfile_1, width = 300, height = 200,{
  plot(1:100, rnorm(100), pch = 21, bg = "red")
  title(main = "Moves Like Jagger")
})

# make another plot for demo purposes
pngfile_2 <- tempfile()
with_png(pngfile_2, width = 300, height = 200,{
  barplot(1:9, col = blues9)
  title(main = "I Like the Way You Move")
})

tagList(
  tags$div(
    id = "example03",
    HTML(img(pngfile_1)),
    HTML(img(pngfile_2))
  ),
  sortable_js(selector = "example03")
)

## ----shiny-drag-vars-to-plot, eval=FALSE---------------------------------
#  knitr::read_chunk(
#    systm.file("shiny-examples/drag_vars_to_plot_app.R", package = "sortable")
#  )

## ----echo=FALSE, cache=FALSE---------------------------------------------
knitr::read_chunk(
  system.file("shiny-examples/shiny_tabset_app.R", package = "sortable")
)


## ----shiny-tabset-app, eval=FALSE----------------------------------------
#  ## Example shiny app to create a plot from sortable inputs
#  
#  
#  # all credit for code goes to RStudio
#  # https://github.com/rstudio/shiny-examples/tree/master/006-tabsets
#  library(sortable)
#  library(shiny)
#  
#  ui = # Define UI for random distribution application
#    shinyUI(fluidPage(
#  
#      # Application title
#      titlePanel("Tabsets"),
#  
#      # Sidebar with controls to select the random distribution type
#      # and number of observations to generate. Note the use of the
#      # br() element to introduce extra vertical spacing
#      sidebarLayout(
#        sidebarPanel(
#          radioButtons(
#            "dist", "Distribution type:",
#            c(
#              "Normal" = "norm",
#              "Uniform" = "unif",
#              "Log-normal" = "lnorm",
#              "Exponential" = "exp"
#            )
#          ),
#          br(),
#  
#          sliderInput(
#            "n",
#            "Number of observations:",
#            value = 500,
#            min = 1,
#            max = 1000)
#        ),
#  
#        # Show a tabset that includes a plot, summary, and table view
#        # of the generated distribution
#        mainPanel(
#          tabsetPanel(
#            type = "tabs",
#            id = "sortTab",
#            tabPanel("Plot", plotOutput("plot")),
#            tabPanel("Summary", verbatimTextOutput("summary")),
#            tabPanel("Table", tableOutput("table"))
#          )
#        )
#      ),
#      sortable_js("sortTab")
#    ))
#  
#  server = function(input, output) {
#  
#    # Reactive expression to generate the requested distribution.
#    # This is called whenever the inputs change. The output
#    # functions defined below then all use the value computed from
#    # this expression
#    data <- reactive({
#      dist <- switch(
#        input$dist,
#        norm = rnorm,
#        unif = runif,
#        lnorm = rlnorm,
#        exp = rexp,
#        rnorm
#      )
#  
#      dist(input$n)
#    })
#  
#    # Generate a plot of the data. Also uses the inputs to build
#    # the plot label. Note that the dependencies on both the inputs
#    # and the data reactive expression are both tracked, and
#    # all expressions are called in the sequence implied by the
#    # dependency graph
#    output$plot <- renderPlot({
#      dist <- input$dist
#      n <- input$n
#  
#      hist(data(),
#           main=paste('r', dist, '(', n, ')', sep=''))
#    })
#  
#    # Generate a summary of the data
#    output$summary <- renderPrint({
#      summary(data())
#    })
#  
#    # Generate an HTML table view of the data
#    output$table <- renderTable({
#      data.frame(x = data())
#    })
#  
#  }
#  
#  shinyApp( ui, server )

