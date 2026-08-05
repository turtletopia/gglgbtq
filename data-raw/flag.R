library(ggplot2)
library(grid)

make_flag_grobs <- function(palette, xmax, xmin, ymax, ymin, alpha = 1) {
  UseMethod("make_flag_grobs")
}

make_flag_grobs.lgbtq_palette_hflag <- function(palette, xmax, xmin, ymax, ymin, alpha = 1) {
  width <- xmax - xmin
  stripe_height <- (ymax - ymin) / length(palette)

  stripes <- lapply(seq_along(palette), function(index) {
    grid::rectGrob(
      x = .5,
      y = 1 - (index - 0.5) / length(palette),
      width = 1,
      height = 1 / length(palette),
      gp = grid::gpar(
        fill = palette[[index]],
        col = NA,
        alpha = alpha
      )
    )
  })

  grid::grobTree(
    do.call(grid::gList, stripes),
    vp = grid::viewport(
      x = (xmin + xmax) / 2,
      y = (ymin + ymax) / 2,
      width = xmax - xmin,
      height = ymax - ymin,
      angle = 90
    )
  )
}

make_flag_grobs.lgbtq_palette_hflag_symmetrical <- function(palette, xmax, xmin, ymax, ymin, alpha = 1) {
  make_flag_grobs.lgbtq_palette_hflag(
    c(palette, rev(palette)[-1]),
    xmax, xmin, ymax, ymin,
    alpha = alpha
  )
}

make_flag_grobs.lgbtq_palette_hflag_outer <- function(palette, xmax, xmin, ymax, ymin, alpha = 1) {
  make_flag_grobs.lgbtq_palette_hflag(
    c(palette[1], palette, palette[length(palette)]),
    xmax, xmin, ymax, ymin,
    alpha = alpha
  )
}

GeomLGBTQFlag <- ggproto(
  "GeomLGBTQFlag",
  Geom,

  required_aes = c("xmin", "xmax", "ymin", "ymax", "flag"),
  default_aes = aes(
    flag = "rainbow",
    alpha = 1
  ),

  draw_key = ggplot2::draw_key_rect,

  draw_panel = function(data, panel_params, coord) {
    coords <- coord$transform(data, panel_params)

    grobs <- lapply(seq_len(nrow(coords)), function(i) {
      row <- coords[i, ]

      make_flag_grobs(
        lgbthue::palette_lgbtq(row$flag),
        row$xmax, row$xmin, row$ymax, row$ymin,
        alpha = row$alpha
      )
    })

    do.call(grid::grobTree, grobs)
  }
)

geom_lgbtq_flag <- function(mapping = NULL,
                            data = NULL,
                            stat = "identity",
                            position = "identity",
                            ...,
                            # colours = c("black", "red", "gold"),
                            na.rm = FALSE,
                            inherit.aes = TRUE) {

  layer(
    geom = GeomLGBTQFlag,
    mapping = mapping,
    data = data,
    stat = stat,
    position = position,
    inherit.aes = inherit.aes,
    params = list(
      # colours = colours,
      na.rm = na.rm,
      ...
    )
  )
}

tibble::tibble(
  xmin = c(0, .8, .1, 1),
  xmax = c(.5, 1.3, .4, 1.5),
  ymin = c(0, .7, .5, .1),
  ymax = c(.3, 1, .7, .4),
  flag = c("trans", "bi", "rainbow", "ace")
) |>
  ggplot(aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax, flag = flag)) +
  geom_lgbtq_flag() +
  # coord_flip() +
  gglgbtq::theme_lgbtq("asexual")

?ggplot2::geom_raster
