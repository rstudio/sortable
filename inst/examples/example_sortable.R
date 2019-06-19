# Simple example of sortable.
# Important: set the tags CSS `id` equal to the sortable `selector`
if (require(htmltools)) {
  html_print(
    tagList(
      tags$p("You can drag and reorder the items in this list:"),
      tags$ul(
        id = "example_1",
        tags$li("Move"),
        tags$li("Or drag"),
        tags$li("Each of the items"),
        tags$li("To different positions")
      ),
      sortable(selector = "example_1")
    )
  )
}
