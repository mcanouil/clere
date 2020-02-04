
<!-- README.md is generated from README.Rmd. Please edit that file -->

# clere: Simultaneous Variables Clustering and Regression

<!-- badges: start -->

[![GitHub
tag](https://img.shields.io/github/tag/mcanouil/clere.svg?label=latest%20tag&include_prereleases)](https://github.com/mcanouil/clere)
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
#>  [1] -2.248074 -1.667946 -2.564603 -2.322686 -2.146800 -2.731106 -1.879365
#>  [8] -1.723753 -1.954611 -2.545467 -2.205097 -2.140736 -2.521094 -2.202527
#> [15] -2.223530 -2.223775 -1.855354 -2.534526 -2.421933 -2.689368 -1.958564
#> [22] -2.292591 -2.582824 -2.047417 -2.382838 -2.472853 -1.986692 -1.616346
#> [29] -1.862622 -2.169925 -2.015309 -2.823941 -2.213763 -1.892718 -1.795760
#> [36] -2.608715 -2.290566 -1.883511 -2.094326 -2.782703 -2.221372 -2.210142
#> [43] -2.091592 -1.885056 -2.232634 -1.910852 -2.505023 -2.362700 -2.378800
#> [50] -2.094525

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = -0.1163
#>  b         = -0.03096     0.13806
#>  pi        = 0.9411  0.0589
#>  sigma2    = 0.7122
#>  gamma2    = 5.72e-05
#> 
#>  ---
#>  Log-likelihood =  -79.46 
#>  Entropy        =  18.009 
#>  AIC            =  170.92 
#>  BIC            =  182.39 
#>  ICL            =  200.4
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
