#' Create a bucketable item list.
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
#' @example inst/examples/example_bucketable_list.R
bucketable_list <- function(
  text,
  labels,
  output_id,
  group_name,
  group_put_max = rep(Inf, length(labels)),
  selector = NULL,
  options = sortable_options(),
  style = css_bucketable_list()
) {
  if (is.null(selector)) {
    selector <- vapply(
      seq_along(labels),
      function(i) {
        increment_bucketable_list()
      },
      FUN.VALUE = character(1)
    )
  }
  assert_sortable_options(options)

  z <- tags$div(
    tags$style(htmltools::HTML(style)),
    class = "bucketable-list-container",

    lapply(seq_along(labels), function(i){
      sortable_list(
        selector = selector[i],
        output_id = output_id[i],
        labels = labels[[i]],
        text = text[i],
        additional_class = paste0("column_", i),
        options = sortable_options(
          group = list(
            name = group_name,
            put = TRUE
          ),
          onSort = sortable_js_capture_input(output_id[i])
        ),
        style = ""
      )

    })
  )

  as.sortable_list(z)

}
