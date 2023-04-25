.onLoad <- function(libname, pkgname) {
    sysfonts::font_add(
        "GT Flexa",
        system.file(
            "extdata", "GT-Flexa-Standard-Regular.ttf",
            package = "bptheme"
        )
    )
    sysfonts::font_add(
        "Arial",
        system.file(
            "extdata", "arial.ttf",
            package = "bptheme"
        )
    )
    sysfonts::font_add(
        "Consolas",
        system.file(
            "extdata", "consola.ttf",
            package = "bptheme"
        )
    )
    showtext::showtext_auto()
}
