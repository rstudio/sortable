
## Bucketable list with three columns

bucketable_list(
  text = c("Sort these items", "into Letters", "and Numbers"),
  labels = list(
    sample(c(1:3, letters[1:3])),
    NULL,
    NULL
  ),
  output_id = paste0("output", 1:3),
  group_name = "bucket_test"
)


## Bucketable list with two columns
library(htmltools)

html_print(tagList(
  tags$p("A prototype for a bucketable_list with two columns"),
  bucketable_list(
    text = c("Drag items from here", "to here"),
    labels = list(
      letters[1:5],
      NULL
    ),
    output_id = paste0("output", 1:2),
    group_name = "bucket_test"
  )
))
