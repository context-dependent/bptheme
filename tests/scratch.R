devtools::load_all()

d <- palmerpenguins::penguins

withr::with_package("ggplot2", {
    p <- d |>
        ggplot(aes(bill_length_mm, bill_depth_mm)) +
        geom_point(aes(fill = species), shape = 21, size = 3) +
        labs(
            title = "Penguin Face Analytics",
            subtitle = "Bill Depth ~ Bill Length + Species",
            x = "Bill Length (mm)",
            y = "Bill Depth (mm)",
            fill = "Species"
        ) +
        theme_blueprint()

    p
})
