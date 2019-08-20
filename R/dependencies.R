css_dependency <- function(name, files, package = "sortable") {
  list(
    htmltools::htmlDependency(
      name,
      version = utils::packageVersion("sortable"),
      src = "htmlwidgets/plugins/sortable-rstudio",
      package = "sortable",
      stylesheet = files
    )
  )
}

rank_list_dependencies <- function() {
  css_dependency("sortable-rank-list", "rank_list.css")
}

bucket_list_dependencies <- function() {
  append(
    rank_list_dependencies(),
    css_dependency("sortable-bucket-list", "bucket_list.css")
  )
}
