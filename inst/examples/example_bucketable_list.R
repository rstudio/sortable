library(htmltools)

# bucket <- function(text, id){
#   tags$div(
#     class = "panel panel-default",
#     tags$div(
#       class = "panel-heading",
#       htmltools::tags$span(class = "glyphicon glyphicon-stats"), text),
#       tags$div(
#         class = "panel-body",
#         id = id
#       )
#
#   )
# }




## Bucketable list with three columns

htmltools::html_print(
  htmltools::tagList(
    tags$style(css_sortable_list()),
    tags$p("A prototype for a bucketable_list"),
    bucketable_list(
      selector = paste0("input", 1:3),
      output_ids = paste0("output", 1:3),
      labels_list = list(letters[1:5], NULL, NULL),
      headings = paste("Bucket", c("A", "B", "C")),
      group_name = "bucket_test"
    )
  )
)


## Bucketable list with two columns

htmltools::html_print(
  htmltools::tagList(
    tags$style(css_sortable_list()),
    tags$p("A prototype for a bucketable_list with two columns"),
    bucketable_list(
      selector = paste0("input", 1:2),
      output_ids = paste0("output", 1:2),
      labels_list = list(letters[1:7], NULL),
      headings = paste("Bucket", c("A", "B")),
      group_name = "bucket_test"
    )
  )
)

## Parson's problem


htmltools::html_print(
  htmltools::tagList(
    tags$style(htmltools::HTML(css_parsons_problem())),
    tags$p("This is an example of a Parsons Problem"),
    bucketable_list(
      selector = paste0("input", 1:2),
      output_ids = paste0("output", 1:2),
      labels_list = list(
        c(
          "iris",
          "mutate(...)",
          "summarize(...)",
          "print()"
        ),
        NULL
        ),
      headings = c("Drag from here", "Construct your solution here"),
      group_name = "parsons_test"
    )
  )
)
