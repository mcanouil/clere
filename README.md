
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clere: Simultaneous Variables Clustering and Regression

<!-- badges: start -->

[![GitHub
tag](https://img.shields.io/github/tag/mcanouil/clere.svg?label=latest%20tag&include_prereleases)](https://github.com/mcanouil/clere)
<!--[![R build status](https://github.com/mcanouil/clere/workflows/R-CMD-check/badge.svg)](https://github.com/mcanouil/clere) -->
[![Travis build
status](https://travis-ci.org/mcanouil/clere.svg?branch=master)](https://travis-ci.org/mcanouil/clere)
[![Codecov test
coverage](https://codecov.io/gh/mcanouil/clere/branch/master/graph/badge.svg)](https://codecov.io/gh/mcanouil/clere?branch=master)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version-ago/clere)](https://cran.r-project.org/package=clere)
[![cran
checks\_worst](https://cranchecks.info/badges/worst/clere)](https://cran.r-project.org/web/checks/check_results_clere.html)
[![CRAN\_Download\_total](https://cranlogs.r-pkg.org/badges/clere)](https://cran.r-project.org/package=clere)
<!-- badges: end -->

Implements an empirical Bayes approach for simultaneous variable
clustering and regression. This version also (re)implements in C++ an R
script proposed by Howard Bondell that fits the Pairwise Absolute
Clustering and Sparsity (PACS) methodology (see Sharma et al (2013)
<DOI:10.1080/15533174.2012.707849>).

## Installation

You can install the released version of clere from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("clere")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("mcanouil/clere")
```

## Example

``` r
library(clere)

x <- matrix(rnorm(50 * 100), nrow = 50, ncol = 100)
y <- rnorm(50)

model <- fitClere(y = y, x = x, g = 2, plotit = FALSE)

plot(model)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

clus <- clusters(model, threshold = NULL)

predict(model, newx = x + 1)
#>  [1] -0.226990413 -0.367355140 -0.255667160  0.032419788 -0.316026392
#>  [6] -0.265532735  0.286586265 -0.275551425 -0.036831906 -0.554448668
#> [11] -0.408768005 -0.561727492 -0.370542067 -0.470894274 -0.432943391
#> [16] -0.335287950 -0.174588139 -0.029232672  0.005610423 -0.611206791
#> [21] -0.275466486 -0.259589627 -0.332600587  0.167858025 -0.217049025
#> [26] -0.071923552 -0.627631370  0.154203353 -0.183276763 -0.300908075
#> [31] -0.036355831 -0.082530340 -0.049487919 -0.577106038  0.030149007
#> [36] -0.240568778 -0.796652931  0.023857951 -0.617659793 -0.261742827
#> [41] -0.158292778  0.043607008 -0.175046771 -0.161962684 -0.563037866
#> [46] -0.303082397 -0.278208154  0.022775518 -0.263151084 -0.540273887

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = 0.1519
#>  b         = -0.01392     0.17814
#>  pi        = 0.94764 0.05236
#>  sigma2    = 0.5235
#>  gamma2    = 2.802e-05
#> 
#>  ---
#>  Log-likelihood =  -71.29 
#>  Entropy        =  13.484 
#>  AIC            =  154.58 
#>  BIC            =  166.05 
#>  ICL            =  179.53
```

## Citing clere

<p>

Yengo L, Jacques J, Biernacki C, Canouil M (2016). “Variable Clustering
in High-Dimensional Linear Regression: The R Package clere.” <em>The R
Journal</em>, <b>8</b>(1), 92–106. doi:
<a href="https://doi.org/10.32614/RJ-2016-006">10.32614/RJ-2016-006</a>.

</p>

    @Article{,
      title = {{Variable Clustering in High-Dimensional Linear Regression: The R Package clere}},
      author = {Loïc Yengo and Julien Jacques and Christophe Biernacki and Mickael Canouil},
      journal = {The R Journal},
      year = {2016},
      month = {apr},
      doi = {10.32614/RJ-2016-006},
      pages = {92--106},
      volume = {8},
      number = {1},
    }

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
on [github](https://github.com/mcanouil/NACHO/issues).  
For questions and other discussion, please contact the package
maintainer.

-----

Please note that this project is released with a [Contributor Code of
Conduct](https://github.com/mcanouil/NACHO/blob/master/.github/CODE_OF_CONDUCT.md).  
By participating in this project you agree to abide by its terms.
