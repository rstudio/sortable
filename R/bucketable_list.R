#' Create a bucketable item list.
#'
#'
#' @inheritParams sortable_list
#'
#' @template options
#'
#'
#' @export
bucketable_list <- function(
  output_ids,
  labels_list,
  # heading_list,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  class = "list-group-item",
  options = sortable_options()
) {
  if (is.null(selector) || is.na(selector)) {
    selector <- vapply(seq_along(labels), function(i)increment_bucketable_list(), FUN.VALUE = character(1))
  }
  assert_sortable_options(options)

  lapply(seq_along(labels_list), function(i){
    sortable_list(
      selector = selector[i],
      output_id = output_ids[i],
      labels = labels_list[[i]],
      options = sortable_options(
        group = list(
          name = group_name,
          put = TRUE
        ),
        swapClass = "sortable-swap-highlight",
        onSort = sortable_js_capture_input(output_ids[i])
      )
    )

  })

}
