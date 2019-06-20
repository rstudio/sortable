# example-sortable-list ---------------------------------------------------

if (require(htmltools)) {

  html_print(
    tagList(
      tags$style(css_sortable_list()),
      tags$p(),
      sortable_list("example_2",
                    labels = c("one", "two", "three", "four"),
                    heading = "You can drag, drap and re-order these items:")
    )
  )
}

