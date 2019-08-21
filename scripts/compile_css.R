
local({
  if (!require(sass)) {
    install.packages("sass")
  }
  library(sass)


  scss_files <- dir(
    file.path("inst", "htmlwidgets", "plugins", "sortable-rstudio"),
    pattern = "\\.scss",
    full.names = TRUE
  )

  for (scss_file in scss_files) {
    if (grepl("^_", basename(scss_file))) {
      message("Skipping   : ", basename(scss_file))
      NULL
    } else {
      message("Translating: ", basename(scss_file))
      sass::sass(
        input = sass::sass_file(scss_file),
        output = sub("\\.scss", ".css", scss_file)
      )
    }
  }
})
