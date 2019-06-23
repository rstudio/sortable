
as.sortable_list <- function(x){
  class(x) <- c("sortable_list", class(x))
  x
}

#' @export
print.sortable_list <- function(x, ...){
  htmltools::html_print(x)
}


as.bucketable_list <- function(x){
  class(x) <- "bucketable_list"
  x
}

print.bucketable_list <- function(x, ...){
  htmltools::html_print(x)
}
