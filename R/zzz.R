# nocov start

.onLoad <- function(...) {
  as_character_vector <- function(x) {
    # works for both x = NULL and x = list()
    if (length(x) == 0) {
      return(character(0))
    }
    unlist(x)
  }

  # Register input handlers
  shiny::registerInputHandler(
    force = TRUE,
    "sortablejs.rank_list",
    function(val, shinysession, name) {
      ret <- as_character_vector(val)
      ret
    }
  )

  shiny::registerInputHandler(
    force = TRUE,
    "sortablejs.bucket_list",
    function(val, shinysession, name) {
      ret <- lapply(val, function(x) {
        as_character_vector(x)
      })
      ret
    }
  )
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    rlang::inform(
      cli::cli_text(
        "To use sortable with shiny modules, run {.run sortable::enable_modules()} to opt into the new standard."
      ),
      .frequency = "once",
      .frequency_id = "sortable"
    )
  )
}

# nocov end
