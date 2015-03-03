#' Sortable.js for R
#'
#' htmlwidget that provides \href{http://rubaxa.github.io/Sortable/}{Sortable.js}
#' to use for additional interactivity in the Viewer, Browser, or Shiny.
#'
#' @param selector \code{String} selector id on which to apply Sortable.  Note, Sortable
#'   works with any html element, not just \code{ul/li}.
#' @param options \code{list} configuration options for Sortable.  For a throrough
#'   discussion, see \href{https://github.com/RubaXa/Sortable#options}{Sortable Options}.
#'   Below is the list of supported options.
#'   \itemize{
#'      \item group
#'      \item sort
#'      \item disabled
#'      \item store
#'      \item animation
#'      \item handle
#'      \item filter
#'      \item draggable
#'      \item ghostClass
#'      \item scroll
#'      \item scrollSensitivity
#'      \item scrollSpeed
#'      \item setData
#'      \item onStart
#'      \item onEnd
#'      \item onAdd
#'      \item onUpdate
#'      \item onSort
#'      \item onRemove
#'      \item onFilter
#'   }
#' @param width \code{integer} width in pixels.  Since the container is expected
#'   to not be displayed, \code{0} is the default.
#' @param height \code{integer} height in pixels.  Since the container is expected
#'   to not be displayed, \code{0} is the default.
#'
#' @import htmlwidgets
#'
#' @export

sortableR <- function(
  selector
  , options = NULL
  , width = 0
  , height = 0
) {

  # forward options using x
  x = list(
    selector = selector
    , options = options
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
sortableROutput <- function(outputId, width = '0px', height = '0px'){
  shinyWidgetOutput(outputId, 'sortableR', width, height, package = 'sortableR')
}

#' Widget render function for use in Shiny
#'
#' @export
renderSortableR <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, sortableROutput, env, quoted = TRUE)
}
