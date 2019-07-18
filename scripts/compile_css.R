
if (!require(sass)) {
  install.packages("sass")
}
library(sass)


scss_files <- dir(
  file.path("inst", "htmlwidgets", "plugins", "sortable-rstudio"),
  pattern = "\\.scss",
  full.names = TRUE
)

lapply(scss_files, function(scss_file) {
  if (grepl("^_", basename(scss_file))) {
    return(NULL)
  }
  print(scss_file)
  sass::sass(
    input = sass::sass_file(scss_file),
    output = sub("\\.scss", ".css", scss_file)
  )
})
