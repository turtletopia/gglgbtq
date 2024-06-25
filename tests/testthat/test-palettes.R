test_that("returns a palette", {
  for (name in names(pride_data)) {
    palette <- palette_lgbtq(name)
    expect_s3_class(palette, "lgbtq_palette")
  }
})

test_that("all elements are RGB color codes", {
  for (name in names(pride_data)) {
    palette <- palette_lgbtq(name)
    expect_match(palette, "#[ABCDEF0-9]{6}", perl = TRUE, ignore.case = TRUE)
  }
})

test_that("palettes have single-string names", {
  for (name in names(pride_data)) {
    palette <- palette_lgbtq(name)
    expect_vector(
      attr(palette, "name", exact = TRUE),
      ptype = character(),
      size = 1
    )
  }
})
