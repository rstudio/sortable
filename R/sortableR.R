#' Sortable.js for R
#'
#' htmlwidget for \href{http://rubaxa.github.io/Sortable/}{Sortable.js}
#' to use in interactive HTML in the Viewer, Browser, or Shiny.
#'
#' @import htmlwidgets
#'
#' @export
sortableR <- function(message, width = NULL, height = NULL) {

  # forward options using x
  x = list(
    message = message
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'sortableR',
    x,
    width = width,
    height = height,
    package = 'sortableR'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
sortableROutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'sortableR', width, height, package = 'sortableR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderSortableR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sortableROutput, env, quoted = TRUE)
}
