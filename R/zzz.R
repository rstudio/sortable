

.onLoad <- function(...) {

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
