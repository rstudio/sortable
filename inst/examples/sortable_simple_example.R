# Simple example of sortable. Set the tags `id` equal to the sortable `selector`
if (require(htmltools)) {
  html_print(
    tagList(
      tags$ul(
        id = "example02",
        tags$li(tags$h4("drag me")),
        tags$li(tags$h4("sort me")),
        tags$li(tags$h4("touch me")),
        tags$li(tags$h4("any way you like"))
      ),
      sortable(selector = "example02")
    )
  )
}
