incrementor <- function(prefix = "increment_"){
  i <-  0
  function(){
    i <<- i + 1
    paste0(prefix, i)
  }
}

increment_rank_list <- incrementor("rank_list_id_")

increment_bucket_list <- incrementor("bucket_list_id_")

increment_parsons <- incrementor("parsons_list_id_")

increment_bucketable_group <- incrementor("bucketable_group_")
