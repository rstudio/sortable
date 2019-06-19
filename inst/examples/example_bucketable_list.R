tags <- htmltools::tags

bucket <- function(text, id){
  tags$div(
    class = "panel panel-default",
    tags$div(
      class = "panel-heading",
      htmltools::tags$span(class = "glyphicon glyphicon-stats"), text),
      tags$div(
        class = "panel-body",
        id = id
      )

  )
}

list_group_css <- '
  .list-group-item {
    position: relative;
    display: block;
    padding: 10px 15px;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
    # float: left;
  }'


htmltools::html_print(
  htmltools::tagList(
    # bucket("Drag x value here", id = "input1"),
    # bucket("Drag y value here", id = "input2"),
    # bucket("Drag z value here", id = "input3"),
    tags$style(list_group_css),
    bucketable_list(
      selector = paste0("input", 1:3),
      output_ids = paste0("output", 1:3),
      labels_list = list(letters[1:5], NULL, NULL),
      group_name = "bucket_test"
    )
  )
)
