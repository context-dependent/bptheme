#' Theme a ggplot according to Blueprint-ADE legacy corporate standards
#'
#' @param base_family
#' @param base_size
#' @param plot_title_family
#' @param plot_title_size
#' @param plot_title_face
#' @param plot_title_margin
#' @param subtitle_family
#' @param subtitle_size
#' @param subtitle_face
#' @param subtitle_margin
#' @param subtitle_color
#' @param strip_text_family
#' @param strip_text_size
#' @param strip_text_face
#' @param caption_family
#' @param caption_size
#' @param caption_face
#' @param caption_margin
#' @param axis_text_size
#' @param axis_title_family
#' @param axis_title_size
#' @param axis_title_face
#' @param axis_title_just
#' @param plot_margin
#' @param grid_col
#' @param grid
#' @param axis_col
#' @param axis
#' @param ticks
#'
#' @return
#' @export
#'
#' @examples
theme_blueprint <- function(base_family="Segoe UI Semilight", base_size = 11.5,
                        plot_title_family="Segoe UI Semilight", plot_title_size = 18,
                        plot_title_face = "plain",
                        plot_title_margin = 10,
                        plot_title_position = "plot",
                        subtitle_family="Consolas", subtitle_size = 12,
                        subtitle_face = "plain", subtitle_margin = 15,
                        subtitle_color = "grey60",
                        strip_text_family = base_family, strip_text_size = 12,
                        strip_text_face = "plain",
                        caption_family = base_family, caption_size = 9,
                        caption_face = "italic", caption_margin = 10,
                        axis_text_size = base_size,
                        axis_title_family = base_family, axis_title_size = base_size,
                        axis_title_face = "plain", axis_title_just = "rt",
                        plot_margin = margin(30, 30, 30, 30),
                        grid_col = "grey50", grid = TRUE,
                        axis_col = "grey30", axis = TRUE, ticks = FALSE) {

  load_fonts()

  ret <- ggplot2::theme_minimal(
    base_family = base_family,
    base_size = base_size
  )

  ret <- ret + theme(
    legend.background = element_blank()
  )

  ret <- ret + theme(legend.key=element_blank())
  ret <- ret + theme(legend.position = "bottom")

  # Grid
  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(
      panel.grid = element_line(
        color = grid_col,
        size  = 0.1
      )
    )

    ret <- ret + theme(
      panel.grid.major = element_line(
        color = grid_col,
        size  = 0.2
      )
    )

    ret <- ret + theme(
      panel.grid.minor = element_line(
        linetype = 2,
        color    = grid_col,
        size     = 0.15
      )
    )

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }


  # Axis
  if (inherits(axis, "character") | axis == TRUE) {

    ret <- ret + theme(
      axis.line = element_line(
        color = "#2b2b2b",
        size  = 0.15
      )
    )

    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(
          axis.line.x = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.line.x = element_line(
            color = axis_col,
            size  = 0.15
          )
        )
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(
          axis.line.y = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.line.y = element_line(
            color = axis_col,
            size  = 0.15
          )
        )
      }
    } else {
      ret <- ret + theme(
        axis.line.x = element_line(
          color  = axis_col,
          size   = 0.15
        )
      )

      ret <- ret + theme(
        axis.line.y = element_line(
          color  = axis_col,
          size   = 0.15
        )
      )
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  xj <- switch(
    tolower(substr(axis_title_just, 1, 1)),
    b=0, l=0, m=0.5, c=0.5, r=1, t=1
  )

  yj <- switch(
    tolower(substr(axis_title_just, 2, 2)),
    b=0, l=0, m=0.5, c=0.5, r=1, t=1
  )

  # Axis
  ret <- ret + theme(
    axis.text.x = element_text(
      size = axis_text_size,
      margin = margin(t=0)
    )
  )

  ret <- ret + theme(
    axis.text.y = element_text(
      size = axis_text_size,
      margin = margin(r=0)
    )
  )

  ret <- ret + theme(
    axis.title = element_text(
      size = axis_title_size,
      family = axis_title_family
    )
  )

  ret <- ret + theme(
    axis.title.x = element_text(
      hjust  = xj,
      size   = axis_title_size,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  ret <- ret + theme(
    axis.title.y = element_text(
      hjust  = yj,
      size   = axis_title_size,
      angle  = 90,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  ret <- ret + theme(
    axis.title.y.right = element_text(
      hjust  = yj,
      size   = axis_title_size,
      angle  = 90,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  # Facets
  ret <- ret + theme(
    strip.text = element_text(
      hjust  = 0,
      size   = strip_text_size,
      family = strip_text_family,
      face   = strip_text_face
    )
  )

  ret <- ret + theme(
    panel.spacing = grid::unit(0.5, "lines")
  )

  # Labels
  ret <- ret + theme(
    plot.title = element_text(
      hjust  = 0,
      size   = plot_title_size,
      margin = margin(b=plot_title_margin),
      family = plot_title_family,
      face   = plot_title_face
    )
  )

  ret <- ret + theme(
    plot.subtitle = element_text(
      hjust  = 0,
      size   = subtitle_size,
      margin = margin(b=subtitle_margin),
      family = subtitle_family,
      face   = subtitle_face,
      color  = subtitle_color
    )
  )

  ret <- ret + theme(
    plot.caption = element_text(
      hjust  = 1,
      size   = caption_size,
      margin = margin(t=caption_margin),
      family = caption_family,
      face   = caption_face
    )
  )

  ret <- ret + theme(
    plot.margin = plot_margin,
    plot.title.position = plot_title_position
  )

  ret

}

#' Theme a ggplot according to Blueprint-ADE legacy corporate standards
#'
#' @param base_family
#' @param base_size
#' @param plot_title_family
#' @param plot_title_size
#' @param plot_title_face
#' @param plot_title_margin
#' @param subtitle_family
#' @param subtitle_size
#' @param subtitle_face
#' @param subtitle_margin
#' @param subtitle_color
#' @param strip_text_family
#' @param strip_text_size
#' @param strip_text_face
#' @param caption_family
#' @param caption_size
#' @param caption_face
#' @param caption_margin
#' @param axis_text_size
#' @param axis_title_family
#' @param axis_title_size
#' @param axis_title_face
#' @param axis_title_just
#' @param plot_margin
#' @param grid_col
#' @param grid
#' @param axis_col
#' @param axis
#' @param ticks
#'
#' @return
#' @export
#'
#' @examples
theme_blueprint_2021 <- function(base_family="Arial", base_size = 11.5,
                            plot_title_family="Arial", plot_title_size = 18,
                            plot_title_face = "plain",
                            plot_title_margin = 10,
                            plot_title_position = "plot",
                            plot_background_colour = "#E6E6E6",
                            subtitle_family="Consolas", subtitle_size = 12,
                            subtitle_face = "plain", subtitle_margin = 15,
                            subtitle_color = "grey60",
                            strip_text_family = base_family, strip_text_size = 12,
                            strip_text_face = "plain",
                            caption_family = base_family, caption_size = 9,
                            caption_face = "italic", caption_margin = 10,
                            axis_text_size = base_size,
                            axis_title_family = base_family, axis_title_size = base_size,
                            axis_title_face = "plain", axis_title_just = "rt",
                            plot_margin = margin(30, 30, 30, 30),
                            grid_col = "grey50", grid = TRUE,
                            axis_col = "grey30", axis = TRUE, ticks = FALSE) {

  load_fonts()

  ret <- ggplot2::theme_minimal(
    base_family = base_family,
    base_size = base_size
  )

  ret <- ret + theme(
    legend.background = element_blank(),
    plot.background = element_rect(fill = plot_background_colour, colour = plot_background_colour)
  )

  ret <- ret + theme(legend.key=element_blank())
  ret <- ret + theme(legend.position = "bottom")

  # Grid
  if (inherits(grid, "character") | grid == TRUE) {

    ret <- ret + theme(
      panel.grid = element_line(
        color = grid_col,
        size  = 0.1
      )
    )

    ret <- ret + theme(
      panel.grid.major = element_line(
        color = grid_col,
        size  = 0.2
      )
    )

    ret <- ret + theme(
      panel.grid.minor = element_line(
        linetype = 2,
        color    = grid_col,
        size     = 0.15
      )
    )

    if (inherits(grid, "character")) {
      if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
      if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
      if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
      if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
    }

  } else {
    ret <- ret + theme(panel.grid=element_blank())
  }


  # Axis
  if (inherits(axis, "character") | axis == TRUE) {

    ret <- ret + theme(
      axis.line = element_line(
        color = "#2b2b2b",
        size  = 0.15
      )
    )

    if (inherits(axis, "character")) {
      axis <- tolower(axis)
      if (regexpr("x", axis)[1] < 0) {
        ret <- ret + theme(
          axis.line.x = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.line.x = element_line(
            color = axis_col,
            size  = 0.15
          )
        )
      }
      if (regexpr("y", axis)[1] < 0) {
        ret <- ret + theme(
          axis.line.y = element_blank()
        )
      } else {
        ret <- ret + theme(
          axis.line.y = element_line(
            color = axis_col,
            size  = 0.15
          )
        )
      }
    } else {
      ret <- ret + theme(
        axis.line.x = element_line(
          color  = axis_col,
          size   = 0.15
        )
      )

      ret <- ret + theme(
        axis.line.y = element_line(
          color  = axis_col,
          size   = 0.15
        )
      )
    }
  } else {
    ret <- ret + theme(axis.line=element_blank())
  }

  if (!ticks) {
    ret <- ret + theme(axis.ticks = element_blank())
    ret <- ret + theme(axis.ticks.x = element_blank())
    ret <- ret + theme(axis.ticks.y = element_blank())
  } else {
    ret <- ret + theme(axis.ticks = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.x = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.y = element_line(size=0.15))
    ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
  }

  xj <- switch(
    tolower(substr(axis_title_just, 1, 1)),
    b=0, l=0, m=0.5, c=0.5, r=1, t=1
  )

  yj <- switch(
    tolower(substr(axis_title_just, 2, 2)),
    b=0, l=0, m=0.5, c=0.5, r=1, t=1
  )

  # Axis
  ret <- ret + theme(
    axis.text.x = element_text(
      size = axis_text_size,
      margin = margin(t=0)
    )
  )

  ret <- ret + theme(
    axis.text.y = element_text(
      size = axis_text_size,
      margin = margin(r=0)
    )
  )

  ret <- ret + theme(
    axis.title = element_text(
      size = axis_title_size,
      family = axis_title_family
    )
  )

  ret <- ret + theme(
    axis.title.x = element_text(
      hjust  = xj,
      size   = axis_title_size,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  ret <- ret + theme(
    axis.title.y = element_text(
      hjust  = yj,
      size   = axis_title_size,
      angle  = 90,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  ret <- ret + theme(
    axis.title.y.right = element_text(
      hjust  = yj,
      size   = axis_title_size,
      angle  = 90,
      family = axis_title_family,
      face   = axis_title_face
    )
  )

  # Facets
  ret <- ret + theme(
    strip.text = element_text(
      hjust  = 0,
      size   = strip_text_size,
      family = strip_text_family,
      face   = strip_text_face
    )
  )

  ret <- ret + theme(
    panel.spacing = grid::unit(0.5, "lines")
  )

  # Labels
  ret <- ret + theme(
    plot.title = element_text(
      hjust  = 0,
      size   = plot_title_size,
      margin = margin(b=plot_title_margin),
      family = plot_title_family,
      face   = plot_title_face
    )
  )

  ret <- ret + theme(
    plot.subtitle = element_text(
      hjust  = 0,
      size   = subtitle_size,
      margin = margin(b=subtitle_margin),
      family = subtitle_family,
      face   = subtitle_face,
      color  = subtitle_color
    )
  )

  ret <- ret + theme(
    plot.caption = element_text(
      hjust  = 1,
      size   = caption_size,
      margin = margin(t=caption_margin),
      family = caption_family,
      face   = caption_face
    )
  )

  ret <- ret + theme(
    plot.margin = plot_margin,
    plot.title.position = plot_title_position
  )

  if("GT Flexa" %in% extrafont::fonts()){
    ret <- ret + theme(plot.title = element_text(size = plot_title_size, family = "GT Flexa"))
  }else{
    ret <- ret + theme(plot.title = element_text(size = plot_title_size, family = "Ariel"))
  }

  ret

}

#' Update matching font defaults for text geoms
#'
#' Updates [ggplot2::geom_label] and [ggplot2::geom_text] font defaults
#'
#' @param family,face,size,color font family name, face, size and color
#' @export
update_geom_font_defaults <- function(family="Arial", face="plain", size=3.5,
                                      color = "#2b2b2b") {
  update_geom_defaults("text", list(family=family, face=face, size=size, color=color))
  update_geom_defaults("label", list(family=family, face=face, size=size, color=color))

}

#' @rdname SegoeUISemiLight
#' @md
#' @title Segoe UI Semilight font name R variable aliases
#' @description `font_an` == "`Segoe UI Semilight`"
#' @format length 1 character vector
#' @export
font_an <- "Segoe UI Semilight"

#' @rdname Arial
#' @md
#' @title Arial font name R variable aliases
#' @description `font_an` == "`Arial`"
#' @format length 1 character vector
#' @export
font_an <- "Arial"

#' Fill continuous or discrete mappings with Blueprint palettes
#'
#' @param discrete
#' @param palette discrete palette to be used
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
scale_fill_blueprint <- function(discrete = FALSE, palette = "default", ...) {

  if(!discrete) {
    res <- viridis::scale_fill_viridis(option = "cividis", ...)
  } else {

    if(palette == "default") {
      discrete_palette <- blueprint_discrete_palette()
    } else if(palette == "bold") {
      discrete_palette <- blueprint_discrete_palette_bold()
    } else if(palette == "blues") {
      discrete_palette <- blueprint_discrete_palette_blues()
    } else if(palette == "multi") {
      discrete_palette <- blueprint_discrete_palette_multi()
    } else {
      stop("Invalid palette option selected")
    }

    res <- scale_fill_manual(values = discrete_palette$hex_code, ...)
  }

  res
}



#' Make it bolder
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
scale_fill_blueprint_bold <- function(...) {

  res <- scale_fill_manual(values = blueprint_discrete_palette_bold()$hex_code, ...)

  res

}

#blueprint_discrete_palette_blues <- function() {
#  tibble::tribble(
#    ~ name,   ~ r, ~ g,  ~ b, ~ hex_code,
#    "blue_0",   0,   0,  255,  "#0000FF",
#    "blue_1",   0, 127,  255,  "#007FFF",
#    "blue_2", 135, 206,  250,  "#87CEFA",
#    "blue_3", 207, 248,  255,  "#CFF8FF",
#    "blue_4", 240, 255,  255,  "#F0FFFF",
#    "white" , 255, 255,  255,  "#FFFFFF"
#  )
#}
#
#blueprint_discrete_palette_multi <- function() {
#  tibble::tribble(
#     ~ name,   ~ r, ~ g,  ~ b, ~ hex_code,
#     "blue",   0,   0,  255,  "#0000FF",
#    "coral", 255,  69,    0,  "#FF4500",
#    "green",   0, 207,    0,  "#00CF97"
#  )
#}
#
#
##' Return Blueprint discrete palette
##'
##' @return
##' @export
##'
##' @examples
#blueprint_discrete_palette <- function() {
#
#  tibble::tribble(
#    ~ name,   ~ r, ~ g,  ~ b, ~ hex_code,
#    "warm_1",  255, 235, 130,  "#FFEB82",
#    "cool_1",  210, 230, 245,  "#D2E6F5",
#    "green_1", 220, 230, 130,  "#DCE682",
#    "warm_2",  250, 190, 120,  "#FABE78",
#    "cool_2",  155, 185, 220,  "#9BB9DC",
#    "green_2", 175, 190, 130,  "#AFBE82",
#    "warm_3",  220, 150, 110,  "#DC966E"
#  )
#
#}
#
#
##' Return Blueprint discrete palette bold
##'
##' @return
##' @export
##'
##' @examples
#blueprint_discrete_palette_bold <- function() {
#
#  tibble::tribble(
#    ~ name,        ~ r, ~ g,  ~ b, ~ hex_code,
#    "dark_slate",   75, 105,  145,  "#4B6991",
#    "tomato",      225, 135,   25,  "#E18719",
#    "light_green", 193, 213,  103,  "#C1D567",
#    "dark_grey",   127, 127,  127,  "#7F7F7F"
#  )
#
#}
#
load_fonts <- function() {

  if(!fonts_are_loaded()) {
    extrafont::font_import(pattern = "segoeuisl|consola.ttf|rial|GT Flexa")
  }

  extrafont::loadfonts(device = "pdf", quiet = TRUE)
  extrafont::loadfonts(device = "win", quiet = TRUE)
  extrafont::loadfonts(device = "postscript", quiet = TRUE)
}

fonts_are_loaded <- function() {
  fonts <- extrafont::fonts()
  res <- "Segoe UI Semilight" %in% fonts & "Consolas" %in% fonts & "Arial" %in% fonts  & "GT Flexa" %in% fonts

  res
}



#
#
#
# bdp_2 <- blueprint_discrete_palette %>%
#   dplyr::group_by(name) %>%
#   tidyr::nest() %>%
#   dplyr::mutate(
#     hex = data %>%
#       map_chr(
#       ~ rgb(.x$r, .x$g, .x$b, maxColorValue=255)
#       )
#   )
#
#
# rgb_vec <- function(x) {
#
#   names(x) <- c("red", "green", "blue")
#
#   rgb(!!!x, maxColorValue = 255)
#
# }



