#' Create a parsons problem.
#'
#'
#' @inheritParams rank_list
#'
#' @template options
#'
#' @inheritParams bucket_list
#' @param labels List of `label` to pass (individually) to [rank_list()].
#' @param text Vector of headings for each column.
#' @param input_id Character vector of `input_id` to pass (individually) to [rank_list()].
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
  assert_that(is_sortable_options(options))

  if (length(input_id) == 1) input_id <- list(paste0(input_id, "_1"), input_id)

  z <- bucket_list(
    header = NULL,
    add_rank_list(text = text[1], labels = labels[[1]], input_id = input_id[[1]]),
    add_rank_list(text = text[2], labels = labels[[2]], input_id = input_id[[2]], options = options),
    group_name = group_name,
    style = style
  )
  as.parsons(z)
}
