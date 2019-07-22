

sortable_version <- "1.10.0-rc3"
yaml_version <- "1.10.0"


writeLines(
  readLines(paste0("https://unpkg.com/sortablejs@", sortable_version)),
  file.path("inst", "htmlwidgets", "lib", "sortable", "sortable.js")
)

sortable_yaml_file <- file.path("inst", "htmlwidgets", "sortable.yaml")
config <- yaml::read_yaml(sortable_yaml_file)
config$dependencies[[1]]$version <- yaml_version
yaml::write_yaml(config, sortable_yaml_file)
