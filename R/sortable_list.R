#' Construct JS method to capture inputs on change.
#'
#' This captures the inputs of a `sortable` list.  Typically you would use this
#' with the `onSort` option of `sortable`. See [sortable_options()]
#' @param output_id The output id.
#' @export
#' @examples inst/shiny/app_drag_mtcars.R
sortable_js_capture_input <- function(output_id) {
  inner_text <- '
    $.map(this.el.children, function(child){return child.innerText})
  '
  js_text <- 'function(evt){{
    Shiny.onInputChange("%s", %s)
  }}'

  js <- sprintf(js_text, output_id, inner_text)

  htmlwidgets::JS(js)
}


#' Sortable item list.
#'
#' Creates a sortable item list using the `sortable.js` framework, and generates
#' an **htmlwidgets** element.
#'
#' @inheritParams sortable
#'
#' @param output_id output variable to read the plot/image from.
#' @param labels A character vector with text to display.
#' @param selector This is the css id to use, and must be unique in your shiny
#'   app. If NULL, the function generates a selector of the form
#'   `sortable_list_id_1`, and will automatically increment for every
#'   `sortable_list`
#' @param class The css class to use
#' @template options
#'
#' @seealso [sortable]
#'
#' @export
#' @importFrom utils modifyList
sortable_list <- function(
  output_id,
  labels,
  selector = NULL,
  class = "list-group-item",
  options = sortable_options()
) {
  if (is.null(selector) || is.na(selector)) {
    selector <- increment_sortable_list()
  }
  assert_sortable_options(options)

  htmltools::tagList(
    htmltools::tags$div(
      id = selector,
      class = class,
      lapply(labels, function(x) {
        htmltools::tags$div(class = class, x)
      })
    ),
    sortable(
      selector = selector,
      options = modifyList(
        onSort = sortable_js_capture_input(output_id),
        options
      )
    )
  )

}
