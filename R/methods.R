
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
as_rank_list_id <- function(id) {
  paste0("rank-list-", id)
}
# TODO: in future, change the order of paste, to enable shiny modules
# paste0(id, "-rank-list")

as_bucket_list_id <- function(id) {
  paste0("bucket-list-", id)
}
# TODO: in future, change the order of paste, to enable shiny modules
# paste0(id, "-bucket-list")
