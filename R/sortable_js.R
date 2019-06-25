#' Creates an htmlwidget with the 'sortable.js' library embedded.
#'
#' Creates an `htmlwidget` that provides [sortable.js](https://github.com/SortableJS/Sortable)
#' to use for drag-and-drop interactivity in Shiny apps and R Markdown.
#'
#' @param selector `String` selector id on which to apply `sortable.js`.  Note, `sortable_js`
#'   works with any html element, not just `ul/li`.
#' @template options
#' @param width `integer` width in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#' @param height `integer` height in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#'
#' @param element_id Use an explicit element ID for the widget (rather than an automatically generated one). Useful if you have other JavaScript that needs to explicitly discover and interact with a specific widget instance.  Passed to [htmlwidgets::createWidget].
#' @param pre_render_hook A function to be run on the widget, just prior to rendering. It accepts the entire widget object as input, and should return a modified widget object. Passed to [htmlwidgets::createWidget].
#'
#' @importFrom htmlwidgets shinyWidgetOutput
#' @seealso [sortable_options()]
#'
#' @export
#' @example inst/examples/example_sortable_js.R
sortable_js <- function(
  selector,
  options = sortable_options(),
  width = 0,
  height = 0,
  element_id = NULL,
  pre_render_hook = NULL
) {

  assert_that(is_sortable_options(options))

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
    package = "sortable",
    elementId = element_id,
    preRenderHook = pre_render_hook
  )
}

#' Widget output function for use in Shiny.
#'
#' @inheritParams sortable_js
#' @param input_id output variable to use for the sortable object
#'
#' @export
sortable_output <- function(input_id, width = "0px", height = "0px") {
  htmlwidgets::shinyWidgetOutput(input_id, "sortable", width, height, package = "sortable")
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
