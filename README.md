
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
model
#>  ~~~ Class: Clere ~~~
#>  ~ y : [50]  0.935887 -0.106164  0.591518 -0.001379  0.194915  0.912558
#>  ~ x : [50x100]
#>                  1        2        3        4        5        .    
#>         1      0.07194  0.06417 -0.95098 -0.31681  0.22111 ........
#>         2     -0.86242 -0.42306 -1.33933  1.97503  0.94015 ........
#>         3     -1.25605  1.17780  1.18149 -0.32052 -0.12204 ........
#>         4      1.13917 -1.39504 -0.20798  0.19854 -0.41428 ........
#>         5      0.61933  0.43978  2.26375 -0.95445 -1.50371 ........
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
#>  ~ seed : 268
#>  ~ b : [2]  0.1068 -0.1257
#>  ~ pi : [2] 0.3 0.7
#>  ~ sigma2 : 0.07511
#>  ~ gamma2 : 1.381e-05
#>  ~ intercept : 0.1653
#>  ~ likelihood : -67.68
#>  ~ entropy : 0.08748
#>  ~ P : [100x2]
#>              Group 1 Group 2
#>         1       0       1   
#>         2       1       0   
#>         3       0       1   
#>         4       0       1   
#>         5       0       1   
#>         .    ....... .......
#> 
#>  ~ theta : [1000x8]
#>                intercept    b1        b2        pi1       pi2        .    
#>          1      0.031837 -0.016399 -0.047944  0.520000  0.480000 .........
#>          2      0.035912 -0.009921 -0.051016  0.410000  0.590000 .........
#>          3      0.002500 -0.002213 -0.056687  0.460000  0.540000 .........
#>          4      0.087243  0.033266 -0.078856  0.470000  0.530000 .........
#>          5      0.110178  0.029635 -0.074744  0.440000  0.560000 .........
#>          .     ......... ......... ......... ......... ......... .........
#> 
#>  ~ Zw : [100x200]
#>        1 2 3 4 5 .
#>      1 1 1 1 1 1 .
#>      2 0 0 0 0 0 .
#>      3 1 1 1 1 1 .
#>      4 1 1 1 1 1 .
#>      5 1 1 1 1 1 .
#>      . . . . . . .
#> 
#>  ~ Bw : [100x200]
#>                 1       2       3       4       5       .   
#>         1    -0.1235 -0.1313 -0.1314 -0.1223 -0.1293 .......
#>         2     0.1070  0.1035  0.1172  0.1062  0.1065 .......
#>         3    -0.1287 -0.1236 -0.1218 -0.1296 -0.1177 .......
#>         4    -0.1285 -0.1222 -0.1202 -0.1293 -0.1304 .......
#>         5    -0.1307 -0.1266 -0.1291 -0.1291 -0.1254 .......
#>         .    ....... ....... ....... ....... ....... .......
#> 
#>  ~ Z0 : NA
#>  ~ message : NA

plot(model)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

clus <- clusters(model, threshold = NULL)
clus
#>   [1] 2 1 2 2 2 1 2 1 2 2 2 2 2 2 2 1 2 2 2 2 1 2 1 1 2 2 2 1 2 2 1 1 2 2 1 1 1
#>  [38] 2 2 2 2 2 2 1 1 2 1 2 1 2 2 2 2 2 1 2 1 2 2 2 2 2 1 2 2 2 2 1 2 1 2 1 2 2
#>  [75] 2 2 2 2 2 2 2 1 2 2 1 2 2 2 2 1 1 1 2 2 2 2 2 2 1 1

predict(model, newx = x + 1)
#>  [1] -4.643929 -5.876955 -4.824284 -5.627991 -5.141486 -4.140606 -4.616513
#>  [8] -4.692023 -6.584613 -3.862135 -4.817077 -7.357741 -6.385545 -3.693137
#> [15] -5.706480 -5.673461 -5.257039 -6.467525 -6.226551 -7.672825 -6.107953
#> [22] -5.460870 -5.491688 -5.909375 -5.499003 -5.693902 -5.843314 -3.685829
#> [29] -5.932126 -3.996119 -5.987252 -5.342098 -6.110889 -6.138178 -5.739112
#> [36] -7.618909 -5.139723 -5.930938 -4.474482 -4.827240 -7.536104 -6.253147
#> [43] -7.115679 -5.085276 -4.705289 -5.105788 -5.786090 -4.909901 -5.443860
#> [50] -4.453799

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = 0.1653
#>  b         =  0.1068 -0.1257
#>  pi        = 0.3 0.7
#>  sigma2    = 0.07511
#>  gamma2    = 1.381e-05
#> 
#>  ---
#>  Log-likelihood =  -67.68 
#>  Entropy        =  0.087481 
#>  AIC            =  147.35 
#>  BIC            =  158.82 
#>  ICL            =  158.91
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
