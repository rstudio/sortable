#' Create a parsons problem.
#'
#'
#' @inheritParams sortable_list
#'
#' @template options
#'
#' @inheritParams bucketable_list
#' @param labels List of `label` to pass (individually) to [sortable_list()].
#' @param text Vector of headings for each column.
#' @param input_id Character vector of `input_id` to pass (individually) to [sortable_list()].
#'
#' @export
#' @example inst/examples/example_parsons.R
#' @examples
#' ## Example of a shiny app
#' if (interactive()) {
#'   app <- system.file("shiny-examples/parsons_app.R", package = "sortable")
#'   shiny::runApp(app)
#' }
parsons <- function(
  header = NULL,
  text = c("Drag from here", "Construct your solution here"),
  labels,
  input_id,
  group_name,
  options = sortable_options(),
  style = css_parsons()
) {
  if (is.character(labels)) labels <- list(labels, NULL)
  # assert_that(is_sortable_options(options))

  # str(input_id)
  if (length(input_id) == 1) input_id <- list(paste0(input_id, "_1"), input_id)

  z <- bucketable_list(
    header = NULL,
    add_sortable_list(text = text[1], labels = labels[[1]], input_id = input_id[[1]]),
    add_sortable_list(text = text[2], labels = labels[[2]], input_id = input_id[[2]]),
    group_name = group_name,
    style = style
  )
  as.parsons(z)
}
