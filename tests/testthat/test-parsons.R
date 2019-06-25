context("parsons")

test_that("Can create parsons", {
  z <- parsons(
    header = "This is an example of a Parsons problem",
    text = c("Drag from here", "Construct your solution here"),
    labels = list(
      c(
        "iris",
        "mutate(...)",
        "summarize(...)",
        "print()"
      ),
      NULL
    ),
    selector = paste0("input", 1:2),
    input_id = paste0("output", 1:2),
    group_name = "parsons_test",
  )


  expect_is(z, "bucketable_list")
})
