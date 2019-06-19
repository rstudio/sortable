# example-sortable-list ---------------------------------------------------

if (require(htmltools)) {

  list_group_css <- '
  .list-group-item {
    position: relative;
    display: block;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
      border: 1px solid #ddd;
  }'

  html_print(
    tagList(
      tags$style(list_group_css),
      tags$p("You can drag and drop these list items:"),
      sortable_list("example_2", labels = c("one", "two", "three"))
    )
  )
}
