#' Create a parsons problem.
#'
#'
#' @inheritParams sortable_list
#'
#' @template options
#'
#'
#' @param output_id Character vector of `output_id` to pass (individually) to [sortable_list]
#' @param labels List of `label` to pass (individually) to [sortable_list]
#' @param text Vector of headings for each column.
#' @param group_name Passed to `sortable.js` as the group name
#' @param group_put_max Not yet implemented
#'
#' @export
#' @example inst/examples/example_parsons.R
parsons <- function(
  text,
  labels,
  output_id,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options(),
  style = css_parsons()
) {
  if (is.null(selector)) {
    selector <- vapply(seq_along(labels), function(i)increment_parsons(), FUN.VALUE = character(1))
  }
  assert_sortable_options(options)

  bucketable_list(
    text = text,
    labels = labels,
    selector = selector,
    output_id = output_id,
    group_name = group_name,
    style = style
  )

}
