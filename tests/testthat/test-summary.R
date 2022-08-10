test_that("return value is a data.frame", {
  expect_vector(show_pride(),
                ptype = data.frame(
                  palettes = character(),
                  lengths = integer()
                ))
})
