
#' Create a ranking item list.
#'
#' Creates a ranking item list using the `sortable.js` framework, and generates
#' an `htmlwidgets` element.  The elements of this list can be dragged and
#' dropped in any order.  Typically you will embed a `rank_list` inside a
#' Shiny app or any shiny runtime, e.g. a `learnr` tutorial.
#'
#' The widget automatically updates a Shiny output, with the matching `input_id`.
#'
#' @inheritParams sortable_js
#'
#' @param input_id output variable to read the plot/image from.
#' @param labels A character vector with the text to display inside the widget.
#' @param text Text to appear at top of list.
#' @param selector This is the css id to use, and must be unique in your shiny
#'   app. If NULL, the function generates a selector of the form
#'   `rank_list_id_1`, and will automatically increment for every
#'   `rank_list`.
#' @param additional_class Additional css class name to use. This gets appended to the `rank-list` class, and is used by the [bucket_list()] function.
#' @param style A css stylesheet, provided as a character string.  See also [css_rank_list()].
#' @template options
#'
#' @seealso [sortable_js], [bucket_list]
#'
#' @export
#' @importFrom utils modifyList
#' @importFrom htmltools  tagList tags
#' @example inst/examples/example_rank_list.R
#' @examples
#' ## Example of a shiny app
#' if (interactive()) {
#'   app <- system.file("shiny-examples/rank_list_app.R", package = "sortable")
#'   shiny::runApp(app)
#' }
rank_list <- function(
  text = "",
  labels,
  input_id,
  selector = NULL,
  options = sortable_options(),
  additional_class = "",
  style = css_rank_list()
) {
  if (is.null(selector)) {
    selector <- increment_rank_list()
  }
  assert_that(is_sortable_options(options))
  assert_that(is_input_id(input_id))

  options$onSort <- chain_js_events(
    options$onSort,
    sortable_js_capture_input(input_id)
  )

  z <- tagList(
    tags$div(
      tags$style(htmltools::HTML(style)),
      class = paste("rank-list-container", additional_class),
      tags$p(text),
      tags$div(
        class = paste("rank-list", additional_class),
        id = selector,
        lapply(labels, function(x) {
          tags$div(class = "rank-list-item", x )
        })
      )
    ),
    sortable_js(
      selector = selector,
      options = options
    )
  )

  as.rank_list(z)

}
