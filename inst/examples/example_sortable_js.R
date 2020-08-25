## -- example-sortable-js -------------------------------------------------
# Simple example of sortable_js.
# Important: set the tags CSS `id` equal to the sortable_js `css_id`

if (interactive()) {
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
        sortable_js(css_id = "example_1")
      )
    )
  }
}
