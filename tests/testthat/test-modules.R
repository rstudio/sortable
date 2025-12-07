test_that("ids and modules are consistent", {
  expect_false(is_modules_enabled())
  expect_equal(as_rank_list_id("one"), "rank-list-one")

  enable_modules()
  expect_true(is_modules_enabled())
  expect_equal(as_rank_list_id("one"), "one-rank-list")

  enable_modules(FALSE)
  expect_false(is_modules_enabled())
  expect_equal(as_rank_list_id("one"), "rank-list-one")
})
