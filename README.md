
# gglgbtq

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/gglgbtq)](https://CRAN.R-project.org/package=gglgbtq)
[![R-CMD-check](https://github.com/turtletopia/gglgbtq/workflows/R-CMD-check/badge.svg)](https://github.com/turtletopia/gglgbtq/actions)
[![Codecov test
coverage](https://codecov.io/gh/turtletopia/gglgbtq/branch/master/graph/badge.svg)](https://codecov.io/gh/turtletopia/gglgbtq?branch=master)
<!-- badges: end -->

gglgbtq provides multiple palettes based on flags in LGBTQ community.
These palettes are accompanied by ggplot2 themes that maximize
readability of each palette (especially of the white strip that is
present in most flags).

## Installation

``` r
# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("turtletopia/gglgbtq")
```

## User guide

To list all available palettes, call:

``` r
# Showing only the first 6 palettes (to avoid cluttering this README)
head(show_pride())
##       palettes lengths
## 1      rainbow       6
## 2 philadelphia       8
## 3     progress      11
## 4     bisexual       3
## 5      asexual       4
## 6  transgender       3
```

The most common use case is to use palettes with ggplot2:

``` r
library(ggplot2)

data <- data.frame(
  group = rep(c("yes", "no", "maybe"), each = 3),
  x = rep(seq_len(3), times = 3),
  y = runif(3 * 3) + .5
)

ggplot(data, aes(x = x, y = y, fill = as.factor(group))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = palette_lgbtq("pansexual"))
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

Use matching `theme_lgbtq()` to make colors stand out the most:

``` r
ggplot(data, aes(x = x, y = y, fill = as.factor(group))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = palette_lgbtq("pansexual")) +
  theme_lgbtq("pansexual")
```

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

`theme_lgbtq()` passes additional parameters to `ggplot2::theme()`, so
it’s fully customizable:

``` r
ggplot(data, aes(x = x, y = y, fill = as.factor(group))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = palette_lgbtq("pansexual")) +
  theme_lgbtq("pansexual", legend.position = "left")
```

![](README_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

## Gallery

Only a few most common palettes are included below. For the complete
list, see [palette gallery
vignette](https://turtletopia.github.io/gglgbtq/articles/gallery.html).

``` r
palette_lgbtq("rainbow")
```

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

``` r
palette_lgbtq("philadelphia")
```

![](README_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->

``` r
palette_lgbtq("progress")
```

![](README_files/figure-gfm/unnamed-chunk-7-3.png)<!-- -->

``` r
palette_lgbtq("lesbian")
```

![](README_files/figure-gfm/unnamed-chunk-7-4.png)<!-- -->

``` r
# In its original meaning of "gay men"
palette_lgbtq("gay")
```

![](README_files/figure-gfm/unnamed-chunk-7-5.png)<!-- -->

``` r
palette_lgbtq("bisexual")
```

![](README_files/figure-gfm/unnamed-chunk-7-6.png)<!-- -->

``` r
# Background added to avoid the "disappearance" of the white stripe
print(palette_lgbtq("transgender"), background = "gray92")
```

![](README_files/figure-gfm/unnamed-chunk-7-7.png)<!-- -->

``` r
palette_lgbtq("asexual")
```

![](README_files/figure-gfm/unnamed-chunk-7-8.png)<!-- -->

``` r
palette_lgbtq("nonbinary")
```

![](README_files/figure-gfm/unnamed-chunk-7-9.png)<!-- -->

``` r
palette_lgbtq("intersex")
```

![](README_files/figure-gfm/unnamed-chunk-7-10.png)<!-- -->

## End notes

I believe in equal rights and treatment for everybody, regardless of
their sexuality, gender identity, skin tone, nationality, and other
features beyond human control. Thus, I do not allow gglgbtq to be used
in any project that promotes hate based on the aforementioned factors.
