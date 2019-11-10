#' Create a ranking item list.
#'
#' @description Creates a ranking item list using the `SortableJS` framework,
#' and generates an `htmlwidgets` element.  The elements of this list can be
#' dragged and dropped in any order.
#'
#' You can embed a ranking question inside a `learnr` tutorial, using
#' [question_rank()].
#'
#' To embed a `rank_list` inside a shiny app, see the Details section.
#'
#' @details
#'
#' You can embed a `rank_list` inside a Shiny app, to capture the preferred
#' ranking order of your user.
#'
#' The widget automatically updates a Shiny output, with the matching
#' `input_id`.
#'
#' @inheritParams sortable_js
#'
#' @param input_id output variable to read the plot/image from.
#' @param labels A character vector with the text to display inside the widget.
#'   This can also be a list of html tag elements.  The text content of each
#'   label or label name will be used to set the shiny `input_id` value.
#' @param text Text to appear at top of list.
#' @param css_id This is the css id to use, and must be unique in your shiny
#'   app. If NULL, the function generates a id of the form
#'   `rank_list_id_1`, and will automatically increment for every `rank_list`.
#' @param class A css class applied to the rank list.  This can be used to
#'   define custom styling.
#' @template options
#'
#' @seealso [sortable_js], [bucket_list] and [question_rank]
#'
#' @export
#' @importFrom utils modifyList
#' @importFrom htmltools  tagList tags
#' @example inst/examples/example_rank_list.R
#' @examples
#' ## Example of a shiny app
#' if (interactive()) {
#'   app <- system.file("shiny-examples/rank_list/app.R", package = "sortable")
#'   shiny::runApp(app)
#' }
#'
rank_list <- function(
  text = "",
  labels,
  input_id,
  css_id = NULL,
  options = sortable_options(),
  class = "default-sortable"
) {
  if (is.null(css_id)) {
    css_id <- increment_rank_list()
  }
  assert_that(is_sortable_options(options))
  assert_that(is_input_id(input_id))

  options$onSort <- chain_js_events( # nolint
    options$onSort, # nolint
    sortable_js_capture_input(input_id)
  )
  options$onLoad <- chain_js_events( # nolint
    options$onLoad, # nolint
    sortable_js_capture_input(input_id),
    sortable_js_set_empty_class(css_id)
  )

  title_tag <- if (!is.null(text) && nchar(text) > 0) {
    tags$p(
      class = "rank-list-title",
      text
    )
  } else {
    NULL
  }

  label_tags <- mapply(
    USE.NAMES = FALSE,
    SIMPLIFY = FALSE,
    labels,
    label_ids(labels),
    FUN = function(label, label_id) {
      if (identical(label_id, "")) {
        label_id <- NULL
      }
      tags$div(
        class = "rank-list-item",
        "data-rank-id" = label_id,
        label
      )
    }
  )

  rank_list_tags <- tagList(
    tags$div(
      class = paste("rank-list-container", paste(class, collapse = " ")),
      title_tag,
      tags$div(
        class = "rank-list",
        id = css_id,
        label_tags
      )
    ),
    sortable_js(
      css_id = css_id,
      options = options
    ),
    rank_list_dependencies()
  )

  as_rank_list(rank_list_tags)

}
