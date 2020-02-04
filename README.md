
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clere: Simultaneous Variables Clustering and Regression

<!-- badges: start -->

[![GitHub
tag](https://img.shields.io/github/tag/mcanouil/clere.svg?label=latest%20tag&include_prereleases)](https://github.com/mcanouil/clere)
[![R build
status](https://github.com/mcanouil/clere/workflows/R-CMD-check/badge.svg)](https://github.com/mcanouil/clere)
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
#>  [1] -3.501980 -1.699138 -4.619550 -2.102758 -1.753919 -4.393094 -2.614821
#>  [8] -2.618966 -3.933125 -1.980519 -4.387494 -2.973524 -4.005806 -2.819260
#> [15] -2.253391 -4.016181 -2.455481 -3.894750 -4.018168 -4.029855 -2.525494
#> [22] -2.498723 -3.182775 -2.131561 -1.612136 -3.979089 -2.794353 -3.374162
#> [29] -1.929009 -2.865094 -4.072946 -2.451257 -2.880981 -2.768981 -2.268048
#> [36] -3.367803 -1.748778 -3.299796 -4.075015 -3.300202 -3.880374 -3.918892
#> [43] -3.974625 -3.265054 -2.423363 -3.047545 -2.998175 -3.813282 -3.881496
#> [50] -1.684593

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2013) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = -0.04704
#>  b         =  0.009018   -0.342986
#>  pi        = 0.8955  0.1045
#>  sigma2    = 0.3456
#>  gamma2    = 1.609e-05
#> 
#>  ---
#>  Log-likelihood =  -75.93 
#>  Entropy        =  4.3109 
#>  AIC            =  163.86 
#>  BIC            =  175.33 
#>  ICL            =  179.65
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
      address = {Oxford, England},
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
