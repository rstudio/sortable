sortableItemlist_onsort <- function(outputId){
  innerText <- '
    $.map(this.el.children, function(child){return child.innerText})
  '
  js <- glue::glue('function(evt){{
    debugger
    Shiny.onInputChange("{outputId}", {innerText})
  }}')

  list(onSort = htmlwidgets::JS(js))
}


#' Sortable item list.
#'
#' @param outputId
#' @param labels
#' @param selector
#' @param class
#'
#' @export
sortableItemlist <- function(outputId, labels, selector, class = "list-group-item"){
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


