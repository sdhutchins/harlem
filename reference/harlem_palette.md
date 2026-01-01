# Harlem Renaissance Palette Generator

Generates color palettes inspired by artworks from the Harlem
Renaissance era.

## Usage

``` r
harlem_palette(
  name = "LawrenceStreetScene",
  n = NULL,
  type = c("discrete", "continuous")
)
```

## Arguments

- name:

  Character string. Name of the desired palette. Available choices are
  included in the package documentation.

- n:

  Integer. Number of colors desired. If omitted, uses all available
  colors from the chosen palette.

- type:

  Character string. Either "continuous" or "discrete". Use "continuous"
  to interpolate between colors.

## Value

A vector of colors.

## Examples

``` r
harlem_palette("LawrenceStreetScene")
#> [1] "#C13E20" "#3E5D33" "#D7AA50" "#282828" "#E6E6E6"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "LawrenceStreetScene"
harlem_palette("BeardenConjurWoman", 5)
#> [1] "#6da0c5" "#778889" "#af8a67" "#ffe1a4" "#4b3328"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "BeardenConjurWoman"
harlem_palette("MotleyBlues", type = "continuous")
#> [1] "#8F1307" "#1F231C" "#BD8955" "#461303" "#6D1A08"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "MotleyBlues"
```
