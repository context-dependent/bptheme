#' Flexible theme with sensible defaults for Blueprint-branded
#' plots
#'
#' @param base_family
#'   Character String indicating the default font family for text on the plot.
#' @param base_size
#'   Number indicating the default point size for text on the plot.
#' @param plot_title_family
#'   Character String indicating the font family for the plot's title.
#' @param plot_title_size
#'   Number indicating the point size for the plot's title.
#' @param plot_title_face
#'   Character String specifying the font face (e.g. "bold", "semibold")
#'   for the plot's title.
#' @param plot_title_margin
#'   Number indicating the pixel size of the margin around the plot's title.
#' @param subtitle_family
#'   Character String indicating the font family for the plot's subtitle.
#' @param subtitle_size
#'   Number indicating the point size of the plot's subtitle.
#' @param subtitle_face
#'   Character String specifying the font face (e.g. "bold", "semibold")
#'   for the plot's subtitle.
#' @param subtitle_margin
#'   Number indicating the pixel size of the margin around the plot's subtitle.
#' @param subtitle_color
#'   Character String specifying the color for the plot's subtitle.
#' @param strip_text_family
#'   Character String indicating the font family for the plot's facet labels.
#' @param strip_text_size
#'   Number indicating the point size for the plot's facet labels.
#' @param strip_text_face
#'   Character String specifying the font face (e.g. "bold", "semibold")
#'   for the plot's facet labels.
#' @param caption_family
#'   Character String indicating the font family for the plot's caption.
#' @param caption_size
#'   Number indicating the point size for the plot's caption.
#' @param caption_face
#'   Character String specifying the font face (e.g. "bold", "semibold")
#'   for the plot's caption.
#' @param caption_margin
#'   Number indicating the pixel size of the margin around the plot's caption.
#' @param axis_text_size
#'   Number indicating the point size for the plot's axis text.
#' @param axis_title_family
#'   Character String indicating the font family for the plot's axis title(s).
#' @param axis_title_size
#'   Number indicating the point size for the plot's axis title(s).
#' @param axis_title_face
#'   Character String specifying the font face (e.g. "bold", "semibold")
#'   for the plot's title.
#' @param axis_title_just
#'   Two-Character String indicating justification for the plots axis title(s).
#'   The first character controls x axis, while the second controls y.
#'   Each character can be one of the following:
#'   \itemize{
#'     \item "r" right justify the axis title
#'     \item "l" left justify the axis title
#'     \item "c" center justify the axis title
#'     \item "t" top justify the axis title if it is vertically oriented
#'     \item "b" bottom justify the axis title if it is vertically oriented
#'     \item "m" middle justify the axis title if it is vertically oriented
#'   }
#' @param plot_margin
#'   Number indicating the margin in pixels around the plot's content
#' @param grid_col
#'   Character String specifying the colour of the grid
#' @param grid
#'   Character String (up to 4 characters from "XxYy") or Logical alias
#'   which toggles major and minor gridlines.
#'
#'   Behavior depends on which characters among "XxYy" are in the string:
#'   \itemize{
#'     \item "X" include major vertical gridlines
#'     \item "x" include minor vertical gridlines
#'     \item "Y" include major horizontal gridlines
#'     \item "y" include minor horizontal gridlines
#'   }
#'
#'   Logical aliases:
#'   \itemize{
#'     \item TRUE is "XxYy"
#'     \item FALSE is ""
#'   }
#' @param axis_col
#'   Character String indicating the colour of the axis lines
#' @param axis
#'   Character String (up to 2 from "xy") or Logical alias
#'   which toggles axis lines.
#'
#'   One of:
#'   \itemize{
#'     \item "xy" or TRUE draw both x and y axis lines
#'     \item "x" draw x axis line but not y
#'     \item "y" draw y axis line but not x
#'     \item "" or FALSE don't draw axis lines
#'   }
#' @param ticks
#'   Logical if TRUE, draw ticks for each break in the x and y axes.
#' @param legend_position
#'   Character String indicating the position of the legend.
#'   Passed directly to \code{ggplot2::theme(legend.position)}
#'
#'   One of:
#'   \itemize{
#'     \item "r" position the legend on the right
#'     \item "b" position the legend on the bottom
#'   }
#'
#' @return
#'   \code{theme_blueprint} returns a ggplot2 theme object
#'
#' @export
theme_blueprint <- function(
    base_family = "Arial", base_size = 11.5,
    plot_title_family = "GT Flexa", plot_title_size = 18,
    plot_title_face = "plain",
    plot_title_margin = 10,
    plot_title_position = "plot",
    plot_background_color = "#E6E6E6",
    subtitle_family = "Consolas", subtitle_size = 12,
    subtitle_face = "plain", subtitle_margin = 15,
    subtitle_color = "grey60",
    strip_text_family = base_family, strip_text_size = 12,
    strip_text_face = "plain",
    caption_family = base_family, caption_size = 9,
    caption_face = "italic", caption_margin = 10,
    axis_text_size = base_size,
    axis_title_family = base_family, axis_title_size = base_size,
    axis_title_face = "plain", axis_title_just = "rt",
    plot_margin = ggplot2::margin(30, 30, 30, 30),
    grid_col = "grey50", grid = TRUE,
    axis_col = "grey30", axis = TRUE, ticks = FALSE,
    legend_position = "b") {
    ret <- base_theme(base_family, base_size, plot_background_color)
    ret <- ret + style_grid(grid, grid_col)
    ret <- ret + style_axes(
        axis,
        axis_text_size,
        axis_title_family,
        axis_title_size,
        axis_title_face,
        axis_title_just,
        axis_col,
        ticks
    )
    ret <- ret + style_labels(
        plot_title_family,
        plot_title_size,
        plot_title_face,
        plot_title_margin,
        plot_title_position,
        subtitle_family,
        subtitle_size,
        subtitle_face,
        subtitle_margin,
        subtitle_color,
        strip_text_family,
        strip_text_size,
        strip_text_face,
        caption_family,
        caption_size,
        caption_face,
        caption_margin,
        plot_margin
    )

    ret
}

#' @rdname theme_blueprint
base_theme <- function(base_family, base_size, plot_background_color) {
    ggplot2::theme_minimal(
        base_family = base_family,
        base_size = base_size
    ) +
        ggplot2::theme(
            plot.background = ggplot2::element_rect(
                fill = plot_background_color,
                colour = plot_background_color
            ),
            panel.spacing = grid::unit(0.5, "lines"),
            legend.background = ggplot2::element_blank()
        )
}

#' @rdname theme_blueprint
style_labels <- function(
    plot_title_family,
    plot_title_size,
    plot_title_face,
    plot_title_margin,
    plot_title_position,
    subtitle_family,
    subtitle_size,
    subtitle_face,
    subtitle_margin,
    subtitle_color,
    strip_text_family,
    strip_text_size,
    strip_text_face,
    caption_family,
    caption_size,
    caption_face,
    caption_margin,
    plot_margin,
    legend_position) {
    # Facets
    ret <- ggplot2::theme(
        strip.text = ggplot2::element_text(
            hjust  = 0,
            size   = strip_text_size,
            family = strip_text_family,
            face   = strip_text_face
        ),
        strip.text.y = ggplot2::element_text(
            angle = 0
        ),
        strip.text.y.left = ggplot2::element_text(
            angle = 0
        )
    )

    # Labels
    ret <- ret + ggplot2::theme(
        plot.title = ggplot2::element_text(
            hjust  = 0,
            size   = plot_title_size,
            margin = ggplot2::margin(b = plot_title_margin),
            family = plot_title_family,
            face   = plot_title_face
        ),
        plot.subtitle = ggplot2::element_text(
            hjust  = 0,
            size   = subtitle_size,
            margin = ggplot2::margin(b = subtitle_margin),
            family = subtitle_family,
            face   = subtitle_face,
            color  = subtitle_color
        ),
        plot.caption = ggplot2::element_text(
            hjust  = 1,
            size   = caption_size,
            margin = ggplot2::margin(t = caption_margin),
            family = caption_family,
            face   = caption_face
        ),
        plot.margin = plot_margin,
        plot.title.position = plot_title_position,
        legend.key = ggplot2::element_blank(),
        legend.position = "bottom"
    )

    ret
}

#' @rdname theme_blueprint
style_axes <- function(
    axis,
    axis_text_size,
    axis_title_family,
    axis_title_size,
    axis_title_face,
    axis_title_just,
    axis_col, ticks) {
    # Axis

    ret <- ggplot2::theme(axis.line = ggplot2::element_blank())
    axis_line <- ggplot2::element_line(linewidth = 0.15, color = axis_col)

    if (axis == TRUE) {
        ret <- ret + ggplot2::theme(
            axis.line.x = axis_line,
            axis.line.y = axis_line
        )
    } else if (inherits(axis, "character")) {
        if (grepl("x", axis)) {
            ret <- ret + ggplot2::theme(axis.line.x = axis_line)
        }
        if (grepl("y", axis)) {
            ret <- ret + ggplot2::theme(axis.line.y = axis_line)
        }
    }

    if (!ticks) {
        ret <- ret + ggplot2::theme(axis.ticks = ggplot2::element_blank())
        ret <- ret + ggplot2::theme(axis.ticks.x = ggplot2::element_blank())
        ret <- ret + ggplot2::theme(axis.ticks.y = ggplot2::element_blank())
    } else {
        ret <- ret + ggplot2::theme(axis.ticks = axis_line)
        ret <- ret + ggplot2::theme(axis.ticks.x = axis_line)
        ret <- ret + ggplot2::theme(axis.ticks.y = axis_line)
        ret <- ret + ggplot2::theme(axis.ticks.length = grid::unit(5, "pt"))
    }

    xj <- switch(tolower(substr(axis_title_just, 1, 1)),
        b = 0,
        l = 0,
        m = 0.5,
        c = 0.5,
        r = 1,
        t = 1
    )

    yj <- switch(tolower(substr(axis_title_just, 2, 2)),
        b = 0,
        l = 0,
        m = 0.5,
        c = 0.5,
        r = 1,
        t = 1
    )

    # Axis
    ret <- ret + ggplot2::theme(
        axis.text.x = ggplot2::element_text(
            size = axis_text_size,
            margin = ggplot2::margin(t = 0)
        ),
        axis.text.y = ggplot2::element_text(
            size = axis_text_size,
            margin = ggplot2::margin(r = 0)
        ),
        axis.title = ggplot2::element_text(
            size = axis_title_size,
            family = axis_title_family
        ),
        axis.title.x = ggplot2::element_text(
            hjust  = xj,
            size   = axis_title_size,
            family = axis_title_family,
            face   = axis_title_face
        ),
        axis.title.y = ggplot2::element_text(
            hjust  = yj,
            size   = axis_title_size,
            angle  = 0,
            family = axis_title_family,
            face   = axis_title_face
        ),
        axis.title.y.right = ggplot2::element_text(
            hjust  = yj,
            size   = axis_title_size,
            angle  = 0,
            family = axis_title_family,
            face   = axis_title_face
        )
    )

    ret
}

#' @rdname theme_blueprint
style_grid <- function(grid, grid_col) {
    minor <- ggplot2::element_line(
        linetype = 2,
        color = grid_col,
        linewidth = 0.15
    )
    major <- ggplot2::element_line(
        color = grid_col,
        linewidth  = 0.2
    )

    ret <- ggplot2::theme()

    if (grid == TRUE) {
        ret <- ret + ggplot2::theme(
            panel.grid.major = major,
            panel.grid.minor = minor
        )
    } else if (grid == FALSE) {
        ret <- ret + ggplot2::theme(
            panel.grid = ggplot2::element_blank()
        )
    } else if (inherits(grid, "character")) {
        g <- strsplit(grid, "")[[1]]
        if ("x" %in% g) ret <- ret + ggplot2::theme(panel.grid.minor.x = minor)
        if ("X" %in% g) ret <- ret + ggplot2::theme(panel.grid.major.x = major)
        if ("y" %in% g) ret <- ret + ggplot2::theme(panel.grid.minor.y = minor)
        if ("Y" %in% g) ret <- ret + ggplot2::theme(panel.grid.major.y = major)
    }

    ret
}

#' @rdname theme_blueprint
#' @aliases theme_blueprint
theme_blueprint_2021 <- theme_blueprint
