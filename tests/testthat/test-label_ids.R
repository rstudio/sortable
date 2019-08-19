
context("label_ids")


test_that("no names are found", {
  lets <- letters[1:3]
  expect_equal(label_ids(lets), c("", "", ""))
  expect_equal(label_ids(as.list(lets)), c("", "", ""))
})
test_that("no NA names are found", {
  lets <- letters[1:3]
  names(lets) <- c("A", NA, "B")
  expect_equal(label_ids(lets), c("A", "", "B"))
  expect_equal(label_ids(as.list(lets)), c("A", "", "B"))
})
test_that("all names are found", {
  lets <- as.list(letters[1:3])
  names(lets) <- c("A", "B", "C")
  expect_equal(label_ids(lets), c("A", "B", "C"))
  expect_equal(label_ids(as.list(lets)), c("A", "B", "C"))
})
test_that("missing names do not cause issues", {
  expect_equal(label_ids(list(A = 1, 2, 3)), c("A", "", ""))
  expect_equal(label_ids(list(1, B = 2, 3)), c("", "B", ""))
  expect_equal(label_ids(list(1, 2, C = 3)), c("", "", "C"))
  expect_equal(label_ids(list(1, 2, 3)), c("", "", ""))
})
