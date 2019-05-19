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

## ------------------------------------------------------------------------
sortable( "example01" )

## ------------------------------------------------------------------------
library(htmltools)
tagList(
  tags$ul(
    id = "example02",
    tags$li(tags$h4("drag me")),
    tags$li(tags$h4("sort me")),
    tags$li(tags$h4("touch (yes touch) me")),
    tags$li(tags$h4("any way you like"))
  ),
  sortable("example02")
)

## ---- collapse=TRUE------------------------------------------------------
library(base64)

# use example from ?base64::img
pngfile <- tempfile()
png(pngfile, width = 400, height = 300)
plot(1:100, rnorm(100), pch = 21, bg = "red", cex = 2)
title(main = "Best Scatter Chart Ever (Moves Like Jagger)")
msg <- capture.output(dev.off())


# make another plot for demo purposes
pngfile2 <- tempfile()
png(pngfile2, width = 400, height = 300)
barplot(1:9, col = blues9)
title(main = "Best Bar Chart Ever (I Like the Way You Move)")
msg <- capture.output(dev.off())

tagList(
  tags$div(
    id = "example03",
    HTML(img(pngfile)),
    HTML(img(pngfile2))
  ),
  sortable("example03")
)

## ----echo=FALSE----------------------------------------------------------
unlink(pngfile)
unlink(pngfile2)

## ------------------------------------------------------------------------
library(shiny)
fluidPage(
  fluidRow(
    class = "panel panel-success",
    tags$div(
      class = "panel-heading",
      tags$h3("Magic Can Happen Here")
    ),
    fluidRow(
      class = "panel-body",
      column(
        width = 4,
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
        width = 4,
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
        )
      ),
      column(
        width = 4,
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
      )
    )
  ),
  sortable("sort1", options = list(group = "sortGroup1")),
  sortable("sort2", options = list(group = "sortGroup1")),
  sortable("sort3", options = list(group = "sortGroup1"))
)

## ----eval=F--------------------------------------------------------------
#  # all credit for code goes to RStudio
#  # https://github.com/rstudio/shiny-examples/tree/master/006-tabsets
#  library(sortable)
#  library(shiny)
#  
#  ui <- # Define UI for random distribution application
#  shinyUI(fluidPage(
#  
#    # Application title
#    titlePanel("Tabsets"),
#  
#    # Sidebar with controls to select the random distribution type
#    # and number of observations to generate. Note the use of the
#    # br() element to introduce extra vertical spacing
#    sidebarLayout(
#      sidebarPanel(
#        radioButtons(
#          "dist", "Distribution type:",
#          c(
#            "Normal" = "norm",
#            "Uniform" = "unif",
#            "Log-normal" = "lnorm",
#            "Exponential" = "exp"
#          )
#        ),
#        br(),
#  
#        sliderInput("n",
#          "Number of observations:",
#          value = 500,
#          min = 1,
#          max = 1000
#        )
#      ),
#  
#      # Show a tabset that includes a plot, summary, and table view
#      # of the generated distribution
#      mainPanel(
#        tabsetPanel(
#          type = "tabs", id = "sortTab",
#          tabPanel("Plot", plotOutput("plot")),
#          tabPanel("Summary", verbatimTextOutput("summary")),
#          tabPanel("Table", tableOutput("table"))
#        )
#      )
#    ),
#    sortable("sortTab")
#  ))
#  
#  server <- function(input, output) {
#  
#    # Reactive expression to generate the requested distribution.
#    # This is called whenever the inputs change. The output
#    # functions defined below then all use the value computed from
#    # this expression
#    data <- reactive({
#      dist <- switch(input$dist,
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
#        main = paste("r", dist, "(", n, ")", sep = "")
#      )
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
#  }
#  
#  shinyApp( ui, server )

