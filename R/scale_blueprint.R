#' Blueprint colour scales based on the corporate style guide
#'
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
#' @family colour scales
#' @rdname scale_blueprint
#' @export
#'
scale_colour_blueprint_d <- function(..., scale_name = "blueprint_d", direction = 1,
                                     palette = primary_brand_colours, aesthetics = "colour",
                                     primary = palette[1], other = palette[2]) {
  discrete_scale(
    aesthetics,
    scale_name,
    blueprint_pal(direction = direction, palette = palette, primary = primary, other = other),
    ...
  )
}

#' @export
#' @rdname scale_blueprint
scale_fill_blueprint_d <- function(..., scale_name = "blueprint_d", direction = 1,
                                   palette = primary_brand_colours, aesthetics = "fill",
                                   primary = palette[1], other = palette[2]) {
  discrete_scale(
    aesthetics,
    scale_name,
    blueprint_pal(direction = direction, palette = palette, primary = primary, other = other),
    ...
  )
}

#' @export
#' @rdname scale_blueprint
scale_colour_blueprint_c <- function(...,
                                     direction = 1, values = NULL,
                                     space = "Lab", na.value = "grey50",
                                     guide = "colourbar", aesthetics = "colour",
                                     palette = primary_brand_colours) {

  # adjust the primary_brand_colours palette if selected, so it scales better
  if(palette[1] == "#000000" & palette[2] == "#0000FF" & palette[3] == "#E6E6E6" & palette[4] == "#FFFFFF"){
    palette[6] <-  palette[4]
    palette[5] <-  palette[3]
    palette[4] <- "#87CEFA"
    palette[3] <-  "#007FFF"
  }

  continuous_scale(
    aesthetics,
    "blueprint_pal",
    gradient_n_pal(
      blueprint_pal(palette = palette, direction = direction)(4),
      values,
      space),
    na.value = na.value,
    guide = guide,
    ...
  )
}

#' @export
#' @rdname scale_blueprint
scale_fill_blueprint_c <- function(...,
                                   direction = 1, values = NULL,
                                   space = "Lab", na.value = "grey50",
                                   guide = "colourbar", aesthetics = "fill",
                                   palette = primary_brand_colours, primary = palette[1],
                                   other = palette[2]) {

  # adjust the primary_brand_colours palette if necessary
  if(palette[4] == "#FFFFFF"){
    palette[6] <-  palette[4]
    palette[5] <-  palette[3]
    palette[4] <- "#87CEFA"
    palette[3] <-  "#007FFF"
  }

  continuous_scale(
    aesthetics,
    "blueprint_pal",
    gradient_n_pal(
      blueprint_pal(palette = palette, direction = direction)(4),
      values,
      space),
    na.value = na.value,
    guide = guide,
    ...
  )
}


