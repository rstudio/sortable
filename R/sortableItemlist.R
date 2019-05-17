# Construct the onSort method for sortable
sortableItemlist_onsort <- function(outputId){
  innerText <- '
    $.map(this.el.children, function(child){return child.innerText})
  '
  jsText <- 'function(evt){{
    Shiny.onInputChange("%s", %s)
  }}'

  js <- sprintf(jsText, outputId, innerText)

  list(onSort = htmlwidgets::JS(js))
}


#' Sortable item list.
#'
#' Creates a sortable item list using the `sortable.js` framework, and generates
#' an **htmlwidgets** element.
#'
#' @inheritParams sortable
#'
#' @param outputId output variable to read the plot/image from.
#' @param labels A character vector with text to display.
#' @param selector This is the css id to use, and must be unique in your shiny
#'   app. If NULL, the function generates a selector of the form
#'   `sortable_itemlist_id_1`, and will automatically increment for every
#'   `sortableItemlist`
#' @param class The css class to use
#'
#' @seealso [sortable]
#'
#' @export
#' @importFrom htmltools tags
sortableItemlist <- function(outputId, labels, selector, class = "list-group-item"){
  if (missing(selector) || is.null(selector) || is.na(selector)) {
    selector <- incrementSortableItemlist()
  }
  # browser()
  list(
    tags$div(
      id = selector,
      class = class,
      lapply(labels, function(x)tags$div(class = class, x))
    ),
    sortable(
      selector = selector,
      options = sortableItemlist_onsort(outputId = outputId)
    )
  )

}


