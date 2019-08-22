#' Creates an htmlwidget with embedded 'SortableJS' library.
#'
#' Creates an `htmlwidget` that provides
#' [SortableJS](https://github.com/SortableJS/Sortable) to use for
#' drag-and-drop interactivity in Shiny apps and R Markdown.
#'
#' @param css_id `String` css_id id on which to apply `SortableJS`.  Note,
#'   `sortable_js` works with any html element, not just `ul/li`.
#' @template options
#' @inheritParams htmlwidgets::createWidget
#'
#' @importFrom htmlwidgets shinyWidgetOutput
#' @seealso [sortable_options()]
#'
#' @export
#' @example inst/examples/example_sortable_js.R
sortable_js <- function(
  css_id,
  options = sortable_options(),
  width = 0,
  height = 0,
  elementId = NULL, # nolint
  preRenderHook = NULL # nolint
) {

  assert_that(is_sortable_options(options))

  # forward options using x
  x <- list(
    css_id = css_id,
    options = modifyList(
      # set default options to be overwritten by supplied options
      default_sortable_options(),
      options
    )
  )

  # create widget
  htmlwidgets::createWidget(
    name = "sortable",
    x,
    width = width,
    height = height,
    package = "sortable",
    elementId = elementId, # nolint
    preRenderHook = preRenderHook # nolint
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
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This is useful
#'   if you want to save an expression in a variable.
#'
#' @export
render_sortable <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sortable_output, env, quoted = TRUE)
}
