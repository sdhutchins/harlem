# Harlem Renaissance-inspired color palettes

#' A list of Harlem Renaissance-inspired palettes
#'
#' @export
harlem_palettes <- list(
  LawrenceStreetScene = c("#C13E20", "#3E5D33", "#D7AA50", "#282828", "#E6E6E6"),
  BeardenConjurWoman = c("#6da0c5", "#778889", "#af8a67", "#ffe1a4", "#4b3328"),
  DouglasAspects = c("#0D0D0D", "#4A4A4A", "#919191", "#B5BDC4", "#FFFFFF"),
  MotleyBlues = c("#8F1307", "#1F231C", "#BD8955", "#461303", "#6D1A08"),
  JohnsonHarlem = c("#6246B3", "#A78550", "#2C2C2C", "#F3E1D1", "#ECECEC"),
  SargentOctoroonGirl = c("#965341", "#D5B185", "#383838", "#A2A2A2", "#D1C4BE"),
  DelaneySelfPortrait = c("#AF6458", "#1E1D33", "#F2E5BC", "#7A9B76", "#403233"),
  JonesLaBaker = c("#AE0E36", "#4E4F97", "#FCD0A4", "#242628", "#C3BFB7"),
  HaydenFetiche = c("#4E443C", "#9B6E4A", "#D9A44C", "#24221D", "#8E8777"),
  MotleyNightlife = c("#5c1b2b", "#71536d", "#9c4860", "#276d74", "#3d3356"),
  JonesAscentEthiopia = c("#0a468c", "#0c77de", "#69bab1", "#f5d42c", "#203a1d"),
  CharlesWhiteSoldier = c("#3f5e68", "#9e3d32", "#f3c442", "#252b2b", "#5b302f"),
  DouglasSongTowers = c("#925c5c", "#ccc47d", "#fde6a2", "#b16755", "#3d2b1f"),
  JohnsonGoingChurch = c("#F7D400", "#1F2F96", "#EBC2BE", "#481B15", "#638505"),
  LoisMailouJones = c("#C92C2C", "#003F3B", "#F4C1A0", "#B77556", "#462C21"),
  WoodruffAmistad = c("#1A1A1A", "#FFFFFF", "#B5A575", "#717171", "#A39E91")
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
