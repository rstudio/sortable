% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/js.R
\name{sortable_js_capture_input}
\alias{sortable_js_capture_input}
\alias{sortable_js_capture_bucket_input}
\title{Construct JavaScript method to capture Shiny inputs on change.}
\usage{
sortable_js_capture_input(input_id)

sortable_js_capture_bucket_input(input_id, input_ids, css_ids)
}
\arguments{
\item{input_id}{Shiny input name to set}

\item{input_ids}{Set of Shiny input ids to set corresponding to the provided
\code{css_ids}}

\item{css_ids}{Set of SortableJS \code{css_id} values to help retrieve all to
set as an object}
}
\value{
A character vector with class \code{JS_EVAL}. See \code{\link[htmlwidgets:JS]{htmlwidgets::JS()}}.
}
\description{
This captures the state of a \code{sortable} list.  It will look for a \code{data-rank-id}
attribute of the first child for each element.  If no? attribute exists for
that particular item's first child, the inner text will be used as an
identifier.
}
\details{
This method is used with the \code{onSort} option of \code{sortable_js}. See
\code{\link[=sortable_options]{sortable_options()}}.
}
\examples{
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
}
\seealso{
\link{sortable_js} and \link{rank_list}.

Other JavaScript functions: 
\code{\link{chain_js_events}()}
}
\concept{JavaScript functions}
