extract_theme <- function(palette) {
  switch(
    palette,
    "androsexual" = ,
    "gynesexual" = ,
    "intersex" = ,
    "pansexual" = ,
    "philadelphia" = ,
    "rainbow" = theme_lgbtq_white,
    "agender" = theme_agender,
    "demiboy" = theme_demiboy,
    "demigirl" = theme_demigirl,
    "bigender" = ,
    "bisexual" = ,
    "helian" = ,
    "lunarian" = ,
    "solarian" = ,
    "stellarian" = theme_ggplot2,
    theme_lgbtq_default
  )
}
