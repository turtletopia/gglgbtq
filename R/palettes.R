#' @export
palette_lgbtq <- function(name) {
  if (!name %in% names(pride_data)) {
    stop("Palette doesn't exist!", call. = FALSE)
  }

  structure(
    extract_colors(name),
    class = "lgbtq_palette",
    name = name
  )
}

#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @export
print.lgbtq_palette <- function(x, font_size = 2.5, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(seq_len(n), 1, as.matrix(seq_len(n)), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name", exact = TRUE),
       cex = font_size, family = "sans")
}
