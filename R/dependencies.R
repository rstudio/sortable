css_dependency <- function(name, files) {
  htmltools::htmlDependency(
    name,
    utils::packageVersion("sortable"),
    system.file("htmlwidgets/plugins/sortable-rstudio", package = "sortable"),
    stylesheet = files
  )
}

rank_list_dependencies <- function() {
  list(
    css_dependency("sortable-rank-list", "rank_list.css")
  )
}

bucket_list_dependencies <- function() {
  append(
    rank_list_dependencies(),
    list(
      css_dependency("sortable-bucket-list", "bucket_list.css")
    )
  )
}
