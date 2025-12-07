# nocov start

.onLoad <- function(...) {


  # use the `cli` package to send a message on startup to use `enable_modules()`
  msg <- c("")
  packageStartupMessage(
    # rlang::inform("This message will appear only once per session.", .frequency = "once", .frequency_id = "sortable"),
    rlang::inform(
      cli::cli_text("To use sortable with shiny modules, run {.run sortable::enable_modules()} to opt into the new standard."),
    .frequency = "once",
    .frequency_id = "sortable"
    )
  )

  as_character_vector <- function(x) {
    # works for both x = NULL and x = list()
    if (length(x) == 0) {
      return(character(0))
    }
    unlist(x)
  }

  # Register a handler for a bucket_list to unlist each set of values.
  # should return a list of character vectors or NULL
  shiny::registerInputHandler(
    force = TRUE,
    "sortablejs.rank_list",
    function(val, shinysession, name) {
      ret <- as_character_vector(val)
      ret
    }
  )

  # Register a handler for a bucket_list to unlist each set of values.
  # should return a list of character vectors or NULL
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

# nocov end
