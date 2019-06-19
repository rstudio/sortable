

# build vignettes
devtools::build_vignettes()
# copy over pre-compiled vignettes
file.copy(
  dir("doc", full.names=TRUE, pattern = ".html"),
  "vignettes/",
  overwrite = TRUE
)
# remove copied files
unlink("doc", recursive = TRUE)
