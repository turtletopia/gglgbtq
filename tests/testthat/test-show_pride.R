test_that("return value is a tibble", {
  expect_vector(
    show_pride(),
    ptype = tibble::tibble(
      palettes = character(),
      lengths = integer()
    )
  )
})
