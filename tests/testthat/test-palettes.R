library(testthat)
library(harlem) # Assuming your package is called harlem and is loaded

test_that("harlem palettes have correct number of colors", {
  for (palette_name in names(harlem_palettes)) {
    palette <- harlem_palettes[[palette_name]]
    expect_true(length(palette) >= 5,
                info = paste("Palette", palette_name, "has fewer than 5 colors"))
  }
})

test_that("harlem palettes contain valid hex colors", {
  is_valid_hex <- function(color) {
    grepl("^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$", color)
  }

  for (palette_name in names(harlem_palettes)) {
    palette <- harlem_palettes[[palette_name]]
    expect_true(all(sapply(palette, is_valid_hex)),
                info = paste("Palette", palette_name, "contains invalid hex colors"))
  }
})
