

# update Readme.Rmd
devtools::build_readme()


# build vignettes
devtools::build_vignettes()
vig_doc_folder <- file.path("inst", "doc")
if (!dir.exists(vig_doc_folder)) {
  dir.create(vig_doc_folder, recursive = TRUE)
}
# copy over pre-compiled vignettes
file.copy(
  dir("doc", full.names=TRUE, pattern = ".html"),
  vig_doc_folder,
  overwrite = TRUE
)
# remove copied files
unlink("doc", recursive = TRUE)

# remove `doc` from .gitignore
gitignore <- readLines(".gitignore")
gitignore <- gitignore[gitignore != "doc"]
writeLines(gitignore, ".gitignore")
