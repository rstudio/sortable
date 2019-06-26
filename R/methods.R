
as.rank_list <- function(x){
  class(x) <- c("rank_list", class(x))
  x
}

#' @export
print.rank_list <- function(x, ...){
  htmltools::html_print(x)
}


as.bucket_list <- function(x){
  class(x) <- c("bucket_list", class(x))
  x
}

#' @export
print.bucket_list <- function(x, ...){
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
