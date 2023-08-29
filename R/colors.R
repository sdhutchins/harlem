# Harlem Renaissance-inspired color palettes

#' A list of Harlem Renaissance-inspired palettes
#'
#' @export
harlem_palettes <- list(
  LawrenceStreetScene = c("#D7AA50", "#C13E20", "#3E5D33", "#E6E6E6", "#282828"),
  BeardenConjurWoman = c("#573D29", "#AAB7C4", "#363030", "#98867C", "#CDB7A0"),
  DouglasAspects = c("#0D0D0D", "#FFFFFF", "#B5BDC4", "#919191", "#4A4A4A"),
  MotleyBlues = c("#1F231C", "#BD8955", "#461303", "#6D1A08", "#8F1307"),
  JohnsonHarlem = c("#6246B3", "#F3E1D1", "#2C2C2C", "#A78550", "#ECECEC"),
  SargentOctoroonGirl = c("#965341", "#D5B185", "#383838", "#A2A2A2", "#D1C4BE"),
  DelaneySelfPortrait = c("#AF6458", "#403233", "#7A9B76", "#F2E5BC", "#1E1D33"),
  JonesLaBaker = c("#AE0E36", "#FCD0A4", "#242628", "#C3BFB7", "#4E4F97"),
  HaydenFetiche = c("#4E443C", "#9B6E4A", "#D9A44C", "#24221D", "#8E8777"),
  WoodruffAmistad = c("#1A1A1A", "#B5A575", "#717171", "#FFFFFF", "#A39E91")
)


#' Harlem Renaissance Palette Generator
#'
#' Generates color palettes inspired by artworks from the Harlem Renaissance era.
#'
#' @param n Integer. Number of colors desired. If omitted, uses all available colors from the chosen palette.
#' @param name Character string. Name of the desired palette. Available choices are included in the package documentation.
#' @param type Character string. Either "continuous" or "discrete". Use "continuous" to interpolate between colors.
#' @importFrom graphics rect par image text
#' @return A vector of colors.
#' @export
#' @keywords colors
#' @examples
#' harlem_palette("LawrenceStreetScene")
#' harlem_palette("BeardenConjurWoman", 5)
#' harlem_palette("MotleyBlues", type = "continuous")
harlem_palette <- function(name = "LawrenceStreetScene", n = NULL, type = c("discrete", "continuous")) {
  # Validate the type of palette
  type <- match.arg(type)

  # Check if the palette list 'harlem_palettes' exists in the environment
  if (!exists("harlem_palettes")) {
    stop("Palette list 'harlem_palettes' not found.")
  }

  # Fetch the palette
  pal <- harlem_palettes[[name]]

  # Validate the palette name
  if (is.null(pal)) {
    stop(paste("Palette", name, "not found."))
  }

  # Validate the number of colors requested
  if (!is.null(n)) {
    if (!is.numeric(n) || n < 1) {
      stop("Number of colors should be a positive integer.")
    }
    n <- as.integer(n)  # Convert to integer

    if (type == "discrete" && n > length(pal)) {
      stop("Number of requested colors exceeds available colors in the palette.")
    }
  } else {
    n <- length(pal)
  }

  # Generate the output color palette
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[seq_len(n)]
  )

  # Add meta-data and return
  structure(out, class = "palette", name = name)
}


#' Print the Palette Colors
#'
#' This function displays the color palette visually as an image plot.
#' The palette name, if it exists, will be displayed as a label on the plot.
#'
#' @param x A color palette represented as a vector of color hex codes.
#' @param ... Additional arguments to be passed to the underlying `image` and `text` functions.
#'
#' @return A plot displaying the color palette.
#'
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @export
#' @examples
#' my_palette <- c("#D7AA50", "#C13E20", "#3E5D33", "#E6E6E6")
#' attr(my_palette, "name") <- "Example Palette"
#' print_palette(my_palette)
print_palette <- function(x, ...) {
  n <- length(x)
  old_par <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old_par))

  image(1:n, 1, as.matrix(1:n), col = x, ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
