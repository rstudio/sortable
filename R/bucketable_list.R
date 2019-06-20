#' Create a bucketable item list.
#'
#'
#' @inheritParams sortable_list
#'
#' @template options
#'
#'
#' @param output_ids Character vector of `output_id` to pass (individually) to [sortable_list]
#' @param labels_list List of `label` to pass (individually) to [sortable_list]
#' @param headings Vector of headings for each column
#' @param group_name Passed to `sortable.js` as the group name
#' @param group_put_max Not yet implemented
#'
#' @export
bucketable_list <- function(
  output_ids,
  labels_list,
  headings,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options()
) {
  if (is.null(selector) || is.na(selector)) {
    selector <- vapply(seq_along(labels), function(i)increment_bucketable_list(), FUN.VALUE = character(1))
  }
  assert_sortable_options(options)

  tags$div(
    # id = selector,
    class = "bucketable-list-container",

    lapply(seq_along(labels_list), function(i){
      sortable_list(
        selector = selector[i],
        output_id = output_ids[i],
        labels = labels_list[[i]],
        heading = headings[i],
        additional_class = paste0("column_", i),
        options = sortable_options(
          group = list(
            name = group_name,
            put = TRUE
          ),
          onSort = sortable_js_capture_input(output_ids[i])
        )
      )

    })
  )

}
