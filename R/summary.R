#' List available palettes
#'
#' @description Shows the names of available LGBTQ palettes and their metadata.
#'
#' @return A `data.frame` with palette names and numbers of colors.
#'
#' @examples
#' show_pride()
#'
#' @export
show_pride <- function() {
  data.frame(
    palettes = names(pride_data),
    lengths = vapply(pride_data, function(p) length(p[["colors"]]),
                     integer(1), USE.NAMES = FALSE),
    stringsAsFactors = FALSE
  )
}
