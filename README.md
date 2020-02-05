
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
Clustering and Sparsity (PACS) methodology (see Sharma et al (2013) doi:
[10.1080/15533174.2012.707849](https://doi.org/10.1080/15533174.2012.707849)).

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
model
#>  ~~~ Class: Clere ~~~
#>  ~ y : [50] -0.3336  1.9559 -0.4597  0.8133  0.7253 -0.1038
#>  ~ x : [50x100]
#>                  1        2        3        4        5        .    
#>         1      0.39614 -1.16769  0.05367  0.48763  0.23821 ........
#>         2      0.93756  2.95580 -0.20508  0.81363  1.12988 ........
#>         3     -0.11438  0.56023 -0.34664 -0.28639  0.60098 ........
#>         4     -0.20134 -0.36741 -0.73135 -0.87668 -0.39190 ........
#>         5     -2.40484  0.08290 -0.38098 -0.09767  0.52053 ........
#>         .     ........ ........ ........ ........ ........ ........
#> 
#>  ~ n : 50
#>  ~ p : 100
#>  ~ g : 2
#>  ~ nItMC : 50
#>  ~ nItEM : 1000
#>  ~ nBurn : 200
#>  ~ dp : 5
#>  ~ nsamp : 200
#>  ~ sparse : FALSE
#>  ~ analysis : "fit"
#>  ~ algorithm : "SEM"
#>  ~ initialized : FALSE
#>  ~ maxit : 500
#>  ~ tol : 0.001
#>  ~ seed : 81
#>  ~ b : [2] -0.05151  0.17184
#>  ~ pi : [2] 0.746 0.254
#>  ~ sigma2 : 0.1306
#>  ~ gamma2 : 1.042e-05
#>  ~ intercept : 0.4656
#>  ~ likelihood : -73.42
#>  ~ entropy : 24.26
#>  ~ P : [100x2]
#>              Group 1 Group 2
#>         1     0.415   0.585 
#>         2     0.325   0.675 
#>         3     1.000   0.000 
#>         4     0.105   0.895 
#>         5     0.985   0.015 
#>         .    ....... .......
#> 
#>  ~ theta : [1000x8]
#>                intercept    b1        b2        pi1       pi2        .    
#>          1      0.22346  -0.02009   0.03604   0.59000   0.41000  .........
#>          2      0.35753  -0.03047   0.05062   0.57000   0.43000  .........
#>          3      0.11399  -0.04822   0.07395   0.57000   0.43000  .........
#>          4      0.11486  -0.07252   0.07369   0.60000   0.40000  .........
#>          5      0.10042  -0.06840   0.08196   0.54000   0.46000  .........
#>          .     ......... ......... ......... ......... ......... .........
#> 
#>  ~ Zw : [100x200]
#>        1 2 3 4 5 .
#>      1 0 0 0 1 1 .
#>      2 1 1 1 1 1 .
#>      3 0 0 0 0 0 .
#>      4 1 1 1 1 1 .
#>      5 0 0 0 0 0 .
#>      . . . . . . .
#> 
#>  ~ Bw : [100x200]
#>                  1        2        3        4        5        .    
#>         1     -0.04841 -0.04957 -0.04973  0.16781  0.17157 ........
#>         2      0.16940  0.17279  0.17848  0.17545  0.17382 ........
#>         3     -0.05062 -0.05078 -0.05420 -0.04648 -0.05101 ........
#>         4      0.16933  0.17199  0.16666  0.17152  0.17624 ........
#>         5     -0.05330 -0.05258 -0.04731 -0.04759 -0.05270 ........
#>         .     ........ ........ ........ ........ ........ ........
#> 
#>  ~ Z0 : NA
#>  ~ message : NA

plot(model)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

clus <- clusters(model, threshold = NULL)
clus
#>   [1] 2 2 1 2 1 1 1 1 1 1 1 1 2 1 1 1 1 1 2 1 1 1 1 2 1 2 1 1 1 1 1 1 1 1 1 1 1
#>  [38] 1 2 1 1 1 2 2 1 1 1 2 2 1 2 1 1 1 1 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 1 2 2 1
#>  [75] 1 1 1 1 1 1 2 1 1 1 2 1 1 1 1 2 1 1 1 1 1 1 1 2 2 1

predict(model, newx = x + 1)
#>  [1]  0.09077594  2.04132965 -0.21957010  0.81452465  0.84774159  0.21780387
#>  [7]  1.17637384 -0.87139348  1.68407410 -0.60700875  0.27443673  1.45859553
#> [13] -1.12213954  0.68661041  1.69606751  0.74215959  1.53062521 -0.02248758
#> [19] -0.68499642  1.22286175  1.52168997 -0.41359794  0.24464235 -0.46807391
#> [25]  1.03440764  1.11523052  0.41186247  0.85244419  0.60270457  0.65581423
#> [31]  1.20114563  0.76656145  0.02285821  0.92562500 -0.64727590 -0.06531115
#> [37]  0.36077909  1.10252096  1.04616273 -0.12858223 -0.81874774  0.38708646
#> [43] -0.04539374 -0.59850172  1.30350431 -0.61750081  0.68725940  0.22774186
#> [49]  0.63673263  1.19178592

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = 0.4656
#>  b         = -0.05151     0.17184
#>  pi        = 0.746   0.254
#>  sigma2    = 0.1306
#>  gamma2    = 1.042e-05
#> 
#>  ---
#>  Log-likelihood =  -73.42 
#>  Entropy        =  24.255 
#>  AIC            =  158.84 
#>  BIC            =  170.32 
#>  ICL            =  194.57
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
