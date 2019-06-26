
as.sortable_list <- function(x){
  class(x) <- c("sortable_list", class(x))
  x
}

#' @export
print.sortable_list <- function(x, ...){
  htmltools::html_print(x)
}


as.bucketable_list <- function(x){
  class(x) <- c("bucketable_list", class(x))
  x
}

#' @export
print.bucketable_list <- function(x, ...){
  htmltools::html_print(x)
}


as.parsons <- function(x){
  class(x) <- c("parsons", class(x))
  x
}

#' @export
print.parsons <- function(x, ...){
  htmltools::html_print(x)
}
