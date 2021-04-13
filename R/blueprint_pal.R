#' The blueprint_pal() function, to return a vector of colours to be fed to discrete_scale() or continuous_scale()

#' @param ... Other arguments passed on to discrete_scale(), continuous_scale(), or binned_scale to control name, limits, breaks, labels and so forth.
#' @param scale_name A string to serve as the label of the colour scale as displayed on the plot.
#' @param direction Sets the order of colors in the scale. If 1, the default, colors are ordered from darkest to lightest. If -1, the order of colors is reversed.
#' @param palette The approved Blueprint palette of choice. See 'blueprint_palettes'.
#' @param aesthetics Character string or vector of character strings listing the name(s) of the aesthetic(s) that this scale works with. This can be useful, for example, to apply colour settings to the colour and fill aesthetics at the same time, via aesthetics = c("colour", "fill").
#' @param primary Lets you manually specify the colour of the first level of a two-level palette. Default is the first colour in the chosen palette.
#' @param other Lets you manually specify the colour of the second level of two-level palette. Default is the second colour in the chosen palette.
#' @param space Required by continuous_scale.
#' @param na.value Required by continuous_scale.
#' @param guide Required by continuous_scale.
#' @param values Required by continuous_scale.
#' @export

blueprint_pal <- function(
  palette = primary_brand_colours,
  primary = palette[1],
  other = palette[2],
  direction = 1,
  ...)
  {

  function(n) {
    if (length(palette) < n)
      warning("selected palette contains fewer than n colours: are you trying to deviate from corporate branding practices?!")

    if (n == 2) {
      colour_list <- c(primary, other)
    } else {
      colour_list <- palette[1:length(palette)]
    }

    colour_list <- unname(unlist(colour_list))

     if (direction == -1) {
      rev(colour_list)
    } else {
      colour_list
    }
  }
}


