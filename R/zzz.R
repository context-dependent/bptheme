.onLoad <- function(libname, pkgname) {
    sysfonts::font_add("GT Flexa", "fonts/GT-Flexa-Standard-Regular-Italic.ttf")
    sysfonts::font_add("Arial", "fonts/arial.ttf")
    sysfonts::font_add("Consolas", "fonts/consola.ttf")
    showtext::showtext_auto()
}
