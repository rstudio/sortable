css_dependency <- function(name, files, scripts = NULL) {
  list(
    htmltools::htmlDependency(
      name,
      version = utils::packageVersion("sortable"),
      src = "htmlwidgets/plugins/sortable-rstudio",
      package = "sortable",
      stylesheet = files,
      script = scripts
    )
  )
}

rank_list_dependencies <- function() {
  css_dependency(
    "sortable-rank-list",
    files = "rank_list.css",
    scripts = "rank_list_binding.js"
  )
}

bucket_list_dependencies <- function() {
  append(
    rank_list_dependencies(),
    css_dependency("sortable-bucket-list", "bucket_list.css")
  )
}
