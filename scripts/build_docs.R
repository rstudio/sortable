# compile readme
rmarkdown::render("README.Rmd", rmarkdown::github_document(html_preview = FALSE))

# build website locally
devtools::install() # files are retrieved from system.file location
pkgdown::build_site()
