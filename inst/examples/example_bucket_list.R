## -- example-bucket-list ---------------------------------------------

## bucket list

if(interactive()) {
  bucket_list(
    header = "This is a bucket list. You can drag items between the lists.",
    add_rank_list(
      text = "Drag from here",
      labels = c("a", "bb", "ccc")
    ),
    add_rank_list(
      text = "to here",
      labels = NULL
    )
  )
}

## bucket list with three columns

if(interactive()) {
  bucket_list(
    header = c("Sort these items into Letters and Numbers"),
    add_rank_list(
      text = "Drag from here",
      labels = sample(c(1:3, letters[1:2]))
    ),
    add_rank_list(
      text = "Letters"
    ),
    add_rank_list(
      text = "Numbers"
    )
  )
}

## drag items between bucket lists

if(interactive()) {

  ui <- shiny::fluidPage(
    shiny::column(4, bucket_list(NULL,
      group_name = "foo",
      add_rank_list(
        text = "Drag from here...",
        labels = sample(c(1:3, letters[1:2]))
      )
    )),
    shiny::column(4, "Some empty space"),
    shiny::column(4, bucket_list(NULL,
      group_name = "foo",
      add_rank_list(
        text = "...To here"
      )
    ))
  )

  server <- function(input, output, session) {}

  shiny::shinyApp(ui, server)


}

