incrementor <- function(prefix = "increment_"){
  i <-  0
  function(){
    i <<- i + 1
    paste0(prefix, i)
  }
}

increment_sortable_list <- incrementor("sortable_list_id_")

increment_bucketable_list <- incrementor("bucketable_list_id_")

increment_parsons <- incrementor("parsons_list_id_")

increment_bucketable_group <- incrementor("bucketable_group_")
