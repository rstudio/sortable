incrementor <- function(prefix = "increment_"){
  i <-  0
  function(){
    i <<- i + 1
    paste0(prefix, i)
  }
}

incrementSortableList <- incrementor("sortable_list_id_")
