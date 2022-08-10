test_that("LGBTQ themes are of `theme` class", {
  for (name in names(pride_data)) {
    theme <- theme_lgbtq(name)
    expect_s3_class(theme, "theme")
  }
})
