test_that("theme_blueprint works", {
  d <- tibble::tibble(
    cat = rep(LETTERS[1:4], 50),
    x = rnorm(200, c(0, 1, 2, -1)),
    y = rnorm(200, c(2, -1, 4, 2))
  )
  withr::with_package("ggplot2", {
    p <- d |>
      ggplot(aes(x, y)) +
      geom_point(aes(fill = cat), shape = 21) +
      theme_blueprint()
  })
})
