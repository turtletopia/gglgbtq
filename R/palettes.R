#' Get one of LGBTQ palettes
#'
#' @description Returns a palette object with colors based on a specified LGBTQ
#' flag. Note: the number of colors vary between palettes!
#'
#' @template name
#'
#' @eval roxygen_available_palettes()
#'
#' @return An `lgbtq_palette` object containing a vector of RGB color codes as
#' strings.
#'
#' @examples
#' palette_lgbtq("bisexual")
#'
#' library(ggplot2)
#' ggplot(data.frame(x = 1:10, y = 15:6,
#'                   group = rep(c("a", "b"), each = 5)),
#'        aes(x = x, y = y, color = group)) +
#'   geom_point(size = 4) +
#'   scale_color_manual(values = palette_lgbtq("intersex"))
#'
#' @export
palette_lgbtq <- function(name) {
  if (!name %in% names(pride_data)) {
    stop("Palette doesn't exist!", call. = FALSE)
  }

  structure(
    pride_data[[name]][["colors"]],
    class = "lgbtq_palette",
    name = name
  )
}

#' @export
print.lgbtq_palette <- function(x, ...,
                                background = getOption("gglgbtq_bg"),
                                font_size = getOption("gglgbtq_font_size")) {
  old <- graphics::par(
    mar = c(.2, .2, .2, .2),
    bg = "white"
  )
  on.exit(graphics::par(old))

  graphics::par(bg = background)

  n <- length(x)
  graphics::image(seq_len(n), 1, as.matrix(seq_len(n)), col = x,
                  ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  graphics::rect(
    xleft = 0, ybottom = 0.9, xright = n + 1, ytop = 1.1,
    col = grDevices::rgb(.95, .95, .95, 0.8), border = NA
  )
  graphics::text(
    x = (n + 1) / 2, y = 1,
    labels = attr(x, "name", exact = TRUE), cex = font_size, family = "sans"
  )
}
