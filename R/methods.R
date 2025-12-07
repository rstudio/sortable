
as_rank_list <- function(x){
  class(x) <- c("rank_list", class(x))
  x
}


as_bucket_list <- function(x){
  class(x) <- c("bucket_list", class(x))
  x
}


#' @export
print.rank_list <- function(x, ...){
  htmltools::html_print(x)
}

#' @export
print.bucket_list <- function(x, ...){
  htmltools::html_print(x)
}


# The names must be suffix values to allow for modules which use prefix values
# https://github.com/rstudio/sortable/issues/100
as_rank_list_id <- function(id, use_module = is_modules_enabled()) {
  if (use_module){
    paste0(id, "-rank-list")
  } else {
    paste0("rank-list-", id)
  }
}

as_bucket_list_id <- function(id, use_module = is_modules_enabled()) {
  if (use_module){
    paste0(id, "-bucket-list")
  } else {
    paste0("bucket-list-", id)
  }
}

