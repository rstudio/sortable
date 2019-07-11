#' Construct JavaScript method to capture Shiny inputs on change.
#'
#' This captures the inputs of a `sortable` list.  Typically you would use this
#' with the `onSort` option of `sortable_js`. See [sortable_options()].
#'
#' @param input_id The output id.
#'
#' @seealso [sortable_js] and [rank_list].
#'
#' @export
#' @examples
#' # For an example, see the Shiny app at
#' system.file("shiny-examples/drag_vars_to_plot/drag_vars_to_plot_app.R", package = "sortable")
sortable_js_capture_input <- function(input_id) {
  inner_text <- "
    $.map(this.el.children, function(child){return child.innerText})
  "
  js_text <- "function(evt){{
    if (typeof Shiny !== \"undefined\") {
      Shiny.onInputChange(\"%s\", %s)
    }
  }}"

  js <- sprintf(js_text, input_id, inner_text)

  htmlwidgets::JS(js)
}
