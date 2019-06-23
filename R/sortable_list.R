#' Construct JS method to capture inputs on change.
#'
#' This captures the inputs of a `sortable` list.  Typically you would use this
#' with the `onSort` option of `sortable`. See [sortable_options()].
#'
#' @param output_id The output id.
#'
#' @seealso [sortable] and [sortable_list].
#'
#' @export
#' @examples
#' # For an example, see the Shiny app at
#' system.file("shiny-examples/drag_vars_to_plot/app.R", package = "sortable")
sortable_js_capture_input <- function(output_id) {
  if (
    !(
      shiny::isRunning()
    )
  ) {
    # if there is no shiny or no shiny running... quit early
    return(NULL)
  }

  inner_text <- "
    $.map(this.el.children, function(child){return child.innerText})
  "
  js_text <- "function(evt){{
    Shiny.onInputChange(\"%s\", %s)
  }}"

  js <- sprintf(js_text, output_id, inner_text)

  htmlwidgets::JS(js)
}


#' Create a sortable item list.
#'
#' Creates a sortable item list using the `sortable.js` framework, and generates
#' an `htmlwidgets` element.  The elements of this list can be dragged and
#' dropped in any order.  Typically you will embed a `sortable_list` inside a
#' Shiny app or any shiny runtime, e.g. a `learnr` tutorial.
#'
#' The widget automatically updates a Shiny output, with the matching `output_id`
#'
#' @inheritParams sortable
#'
#' @param output_id output variable to read the plot/image from.
#' @param labels A character vector with the text to display inside the widget.
#' @param text Text to appear at top of list.
#' @param selector This is the css id to use, and must be unique in your shiny
#'   app. If NULL, the function generates a selector of the form
#'   `sortable_list_id_1`, and will automatically increment for every
#'   `sortable_list`.
#' @param additional_class Additional css class name to use. This gets appended to the `sortable-list` class, and is used by the [bucketable_list()] function.
#' @param style A css stylesheet, provided as a character string.  See also [css_sortable_list()].
#' @template options
#'
#' @seealso [sortable], [bucketable_list], [parsons]
#'
#' @export
#' @importFrom utils modifyList
#' @importFrom htmltools  tagList tags
#' @example inst/examples/example_sortable_list.R
sortable_list <- function(
  text = "",
  labels,
  output_id,
  selector = NULL,
  options = sortable_options(),
  additional_class = "",
  style = css_sortable_list()
) {
  if (is.null(selector)) {
    selector <- increment_sortable_list()
  }
  assert_sortable_options(options)

  z <- tagList(
    tags$div(
      tags$style(htmltools::HTML(style)),
      class = paste("sortable-list-container", additional_class),
      tags$p(text),
      tags$div(
        class = paste("sortable-list", additional_class),
        id = selector,
        lapply(labels, function(x) {
          tags$div(class = "sortable-list-item", x )
        })
      )
    ),
    sortable(
      selector = selector,
      options = modifyList(
        sortable_options(onSort = sortable_js_capture_input(output_id)),
        options
      )
    )
  )

  as.sortable_list(z)

}

