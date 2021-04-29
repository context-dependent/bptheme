#' display_blueprint_all
#'
#' This function displays all of the Blueprint palettes
#' drawn from the official corporate style guide
#'
#' @export
#'
display_blueprint_palettes <- function(){

  reformat_palette <- function(palette) {
    palette <- tibble::as_tibble(palette)
    palette <- tidyr::pivot_longer(palette, everything())
  }

  palette_names <- rev(
    c(
      "primary_brand_colours",
      "blueprint_blues",
      "blueprint_greys",
      "blueprint_corals",
      "blueprint_greens",
      "blueprint_discrete_palette_multi",
      "blueprint_discrete_palette",
      "blueprint_discrete_palette_bold",
      "blueprint_discrete_palette_rbg"
    )
  )

  palette_list <-
    rev(
      list(
        tidyr::nest(reformat_palette(primary_brand_colours), data = everything()),
        tidyr::nest(reformat_palette(blueprint_blues), data = everything()),
        tidyr::nest(reformat_palette(blueprint_greys), data = everything()),
        tidyr::nest(reformat_palette(blueprint_corals), data = everything()),
        tidyr::nest(reformat_palette(blueprint_greens), data = everything()),
        tidyr::nest(reformat_palette(blueprint_discrete_palette_multi), data = everything()),
        tidyr::nest(reformat_palette(blueprint_discrete_palette), data = everything()),
        tidyr::nest(reformat_palette(blueprint_discrete_palette_bold), data = everything()),
        tidyr::nest(reformat_palette(blueprint_discrete_palette_rbg), data = everything())
      )
    )

  for (i in 1:2) {                                    # this for-loop solves an issue where the visual only renders correctly the second time you call the function
    number_of_palettes <- length(palette_names)
    ylim <- c(0, number_of_palettes)

    length(tidyr::unnest(palette_list[1][[1]], cols = c(1)))

    plot(
      1,
      1,
      xlim = c(0, 7),
      ylim = ylim,
      type = "n",
      axes = FALSE,
      bty = "n",
      xlab = "",
      ylab = ""
    )

    par(mar = c(1, 12, 1, 1))

    for (i in 1:number_of_palettes) {
      nj <- tidyr::unnest(palette_list[i][[1]], cols = c(1))

      rect(
        xleft = 1:nrow(nj) - 1,
        ybottom = i - 1,
        xright = 1:nrow(nj),
        ytop = i - 0.2,
        col = nj$value,
        border = "light grey"
      )

      text(
        rep(-0.1, number_of_palettes),
        (1:number_of_palettes) - 0.6,
        labels = palette_names,
        xpd = TRUE,
        adj = 1
      )
    }
  }
}
