
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
#>  [1] -1.213815 -1.227946 -1.330441 -1.328878 -1.140979 -1.452013 -1.348810
#>  [8] -1.456819 -1.279758 -1.556311 -1.172174 -1.295883 -1.386152 -1.470135
#> [15] -1.418711 -1.379912 -1.640547 -1.230693 -1.318454 -1.609977 -1.282903
#> [22] -1.532473 -1.484949 -1.692800 -1.404823 -1.366585 -1.226226 -1.265016
#> [29] -1.417031 -1.205170 -1.442003 -1.491469 -1.489771 -1.554533 -1.181190
#> [36] -1.407053 -1.304942 -1.338871 -1.232894 -1.329558 -1.258883 -1.560488
#> [43] -1.487141 -1.400914 -1.319881 -1.330845 -1.328302 -1.422391 -1.433036
#> [50] -1.573886

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = 0.03965
#>  b         = -0.09245    -0.01122
#>  pi        = 0.03356 0.96644
#>  sigma2    = 0.8412
#>  gamma2    = 5.149e-05
#> 
#>  ---
#>  Log-likelihood =  -76.73 
#>  Entropy        =  14.095 
#>  AIC            =  165.46 
#>  BIC            =  176.93 
#>  ICL            =  191.03
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
