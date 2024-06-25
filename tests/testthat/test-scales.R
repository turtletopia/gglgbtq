test_that("LGBTQ scales function as shorthands", {
  # scale_fill_lgbtq
  vdiffr::expect_doppelganger("Scale fill", {
    ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, fill = Species)) +
      ggplot2::geom_histogram(binwidth = 0.25) +
      ggplot2::scale_fill_manual(values = palette_lgbtq("transgender"))
  })
  vdiffr::expect_doppelganger("Scale fill", {
    ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, fill = Species)) +
      ggplot2::geom_histogram(binwidth = 0.25) +
      scale_fill_lgbtq("transgender")
  })

  # scale_colo(u)r_lgbtq
  vdiffr::expect_doppelganger("Scale color", {
    ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
      ggplot2::geom_point() +
      ggplot2::scale_color_manual(values = palette_lgbtq("transgender"))
  })
  vdiffr::expect_doppelganger("Scale color", {
    ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
      ggplot2::geom_point() +
      scale_color_lgbtq("transgender")
  })
  vdiffr::expect_doppelganger("Scale color", {
    ggplot2::ggplot(iris, ggplot2::aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) +
      ggplot2::geom_point() +
      scale_colour_lgbtq("transgender")
  })
})
