context("parsons")

test_that("Can create parsons", {
  z <- parsons(
    header = "This is an example of a Parsons problem",
    labels = c(
      "iris",
      "mutate(...)",
      "summarize(...)",
      "print()"
    ),
    input_id = "parsons_input",
    group_name = "parsons_test",
  )


  expect_is(z, "bucketable_list")
})
