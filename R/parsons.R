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
#' @param group_name Passed to `sortable.js` options as the group name. See also [sortable_options()].
#' @param group_put_max Not yet implemented.
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
  header,
  text = c("Drag from here", "Construct your solution here"),
  labels,
  input_id,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options(),
  style = css_parsons()
) {
  # if (is.null(selector)) {
  #   selector <- vapply(
  #     seq_along(labels),
  #     function(i) {
  #       increment_parsons()
  #     },
  #     FUN.VALUE = character(1)
  #   )
  # }
  if (is.character(labels)) labels <- list(labels, NULL)
  assert_that(is_sortable_options(options))

  bucketable_list(
    header = header,
    add_sortable_list(text = text[1], labels = labels[[1]], input_id = paste0(input_id, "_1")),
    add_sortable_list(text = text[2], labels = labels[[2]], input_id = input_id),
    # selector = selector,
    # input_id = input_id,
    group_name = group_name,
    style = style
  )
}
