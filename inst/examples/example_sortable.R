# Simple example of sortable. Set the tags `id` equal to the sortable `selector`
if (require(htmltools)) {
  html_print(
    tagList(
      tags$p("You can drag and reorder the items in this list:"),
      tags$ul(
        id = "example02",
        tags$li("drag me"),
        tags$li("order me"),
        tags$li("sort me"),
        tags$li("any way you like")
      ),
      sortable(selector = "example02")
    )
  )
}
