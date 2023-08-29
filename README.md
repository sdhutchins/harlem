# harlem

<!-- badges: start -->
[![R build status](https://github.com/your_username/harlem/workflows/R-CMD-check/badge.svg)](https://github.com/sdhutchins/harlem/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
<!-- badges: end -->

The goal of `harlem` is to provide a collection of color palettes inspired by iconic works from Harlem Renaissance artists. These palettes are designed to bring artistic flair to your data visualizations in R.

## Installation

You can install the development version of `harlem` from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("sdhutchins/harlem")
```

## Example

This is a basic example demonstrating how to apply a harlem palette to a ggplot2 plot:

```r
# ggplot2 library
library(ggplot2)
 
# Let's use the diamonds dataset
data(diamonds)
head(diamonds)

# basic example code
palette <- harlem_palettes$MotleyBlues
ggplot(data=diamonds,aes(x=price, group=cut, fill=cut)) + 
  geom_density(adjust=1.5, alpha=.8) +
  scale_fill_manual(values = palette) +
  theme_minimal()
```
![Alternative Text](motley_blues_density.png)

## List of Palettes

You can view the list of available palettes with:
```r
names(harlem_palettes)
```

## View Palettes as a Plot in R

```r
print_palette(harlem_palettes$MotleyBlues)
```

## Contributing

If you would like to contribute to this package, please see the CONTRIBUTING.md guidelines.


