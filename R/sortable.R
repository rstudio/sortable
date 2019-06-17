#' Sortable.js for R
#'
#' htmlwidget that provides [Sortable.js](https://github.com/SortableJS/Sortable)
#' to use for additional interactivity in the Viewer, Browser, or Shiny.
#'
#' @param selector `String` selector id on which to apply Sortable.  Note, Sortable
#'   works with any html element, not just `ul/li`.
#' @template options
#' @param width `integer` width in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#' @param height `integer` height in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#'
#' @importFrom htmlwidgets shinyWidgetOutput
#' @seealso [sortable_options()]
#'
#' @export
#' @example inst/examples/example_sortable.R
sortable <- function(
  selector,
  options = sortable_options(),
  width = 0,
  height = 0
) {

  assert_sortable_options(options)

  # forward options using x
  x <- list(
    selector = selector,
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = "sortable",
    x,
    width = width,
    height = height,
    package = "sortable"
  )
}

#' Widget output function for use in Shiny.
#'
#' @inheritParams sortable
#' @param output_id output variable to use for the sortable object
#'
#' @export
sortable_output <- function(output_id, width = "0px", height = "0px") {
  htmlwidgets::shinyWidgetOutput(output_id, "sortable", width, height, package = "sortable")
}

#' Widget render function for use in Shiny.
#'
#' @param expr An expression
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This is useful if you want to save an expression in a variable.
#'
#' @export
render_sortable <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sortable_output, env, quoted = TRUE)
}
