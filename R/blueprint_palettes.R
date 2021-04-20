#' Various palettes drawn from the Blueprint corporate style guide.
#'
#' @format Five lists containing the hexcodes of palettes drawn from the style guide.
#' \describe{
#'   \item{primary_brand_colours}{Black, Blue, Grey, and White}
#'   \item{blueprint_blues}{}
#'   \item{blueprint_greys}{}
#'   \item{blueprint_corals}{}
#'   \item{blueprint_greens}{}
#'   \item{blueprint_discrete_palette_blues}{}
#'   \item{blueprint_discrete_palette_multi}{}
#'   \item{blueprint_discrete_palette}{}
#'   \item{blueprint_discrete_palette_bold}{}
#' }
#' @source see the Blueprint style guide

primary_brand_colours <- list(
  "black"   = "#000000",
  "blue"    = "#0000FF",
  "grey" = "#E6E6E6",
  "white"  = "#FFFFFF"
  )
usethis::use_data(primary_brand_colours)

blueprint_blues <- list(
  "blue"  = "#0000FF",
  "blue2" = "#007FFF",
  "blue3" = "#87CEFA",
  "blue4"= "#CFF8FF",
  "blue5" = "#F0FFFF")
usethis::use_data(blueprint_blues)

blueprint_greys <- list(
  "black"  = "#000000",
  "grey2" = "#333333",
  "grey2" = "#666666",
  "grey3"= "#999999",
  "grey4" = "#CCCCCC"
  )
usethis::use_data(blueprint_greys)

blueprint_corals <- list(
  "coral"  = "#FF4500",
  "coral2" = "#FF8674",
  "coral3" = "#F5CABF",
  "coral4"= "#FEF6F4"
  )
usethis::use_data(blueprint_corals)

blueprint_greens <- list(
  "green"  = "#00CF97",
  "green2" = "#5AF5AC",
  "green3" = "#BBFFDA",
  "green4"= "#B1FFED"
  )
usethis::use_data(blueprint_greens)

blueprint_discrete_palette_blues <- list(
  "blue_0" = "#0000FF",
  "blue_1" =  "#007FFF",
  "blue_2" =  "#87CEFA",
  "blue_3" =  "#CFF8FF",
  "blue_4" =  "#F0FFFF",
  "white" = "#FFFFFF"
  )
usethis::use_data(blueprint_discrete_palette_blues)

blueprint_discrete_palette_multi <- list(
      "blue" = "#0000FF",
      "coral" = "#FF4500",
      "green" =  "#00CF97"
    )
usethis::use_data(blueprint_discrete_palette_multi)


blueprint_discrete_palette <- list(
  "warm_1" = "#FFEB82",
  "cool_1" = "#D2E6F5",
  "green_1" = "#DCE682",
  "warm_2" = "#FABE78",
  "cool_2" = "#9BB9DC",
  "green_2" = "#AFBE82",
  "warm_3" ="#DC966E"
)
usethis::use_data(blueprint_discrete_palette)

blueprint_discrete_palette_bold <- list(
  "dark_slate" = "#4B6991",
  "tomato" = "#E18719",
  "light_green" = "#C1D567",
  "dark_grey" = "#7F7F7F"
)
usethis::use_data(blueprint_discrete_palette_bold)

usethis::use_data_raw("blueprint_palettes")

