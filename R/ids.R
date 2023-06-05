# The names must be suffix values to allow for modules which use prefix values
# https://github.com/rstudio/sortable/issues/100
bucket_list_id <- function(id) {
    paste0(id, "-bucket-list")
}
rank_list_id <- function(id) {
    paste0(id, "-rank-list")
}
