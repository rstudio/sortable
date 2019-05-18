incrementor <- function(prefix = "increment_"){
  i <-  0
  function(){
    i <<- i + 1
    paste0(prefix, i)
  }
}

incrementSortableItemlist <- incrementor("sortable_itemlist_id_")
