
<!-- README.md is generated from README.Rmd. Please edit that file -->

# distplyr

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/vincenzocoia/distplyr.svg?branch=master)](https://travis-ci.org/vincenzocoia/distplyr)
[![Codecov test
coverage](https://codecov.io/gh/vincenzocoia/distplyr/branch/master/graph/badge.svg)](https://codecov.io/gh/vincenzocoia/distplyr?branch=master)
<!-- badges: end -->

The goal of distplyr is to provide a unified interface for manipulating
distributions. The name is inspired by the `dplyr` package.

The need for this package arose as I was trying to implement
distributional forecasting models. I found that I was home-baking
functions like a cdf or quantile function, and spent far too much energy
managing and distinguishing between distribution quantities throughout
the analysis. This package bundles these all together in a single
“distribution” object.

The
[`distributions3`](https://cran.r-project.org/web/packages/distributions3/index.html)
package is close to what I’ve been looking for, but I wanted to be able
to work with any distribution, including non-parametric or
semi-parametric ones, and I think in order to do that with
`distributions3`, you’d have to contribute to the package.

## Installation
