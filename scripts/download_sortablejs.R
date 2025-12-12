get_new_sortable_version <- function() {
  x <- readLines("https://unpkg.com/sortablejs", n = 1)
  # sub("^.* Sortable (.*?) - MIT.*$", "\\1", x)
  sub(".*(\\d+\\.\\d+\\.\\d+).*", "\\1", x)
}
get_new_sortable_version()

sortable_version <- "1.15.6"
yaml_version <- sortable_version


writeLines(
  readLines(
    paste0("https://unpkg.com/sortablejs@", sortable_version),
    warn = FALSE
  ),
  file.path("inst", "htmlwidgets", "lib", "sortable", "sortable.js")
)

sortable_yaml_file <- file.path("inst", "htmlwidgets", "sortable.yaml")
config <- yaml::read_yaml(sortable_yaml_file)
config$dependencies[[1]]$version <- yaml_version
yaml::write_yaml(config, sortable_yaml_file)
