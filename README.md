
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
#>  ~ y : [50]  0.9355  0.1357  0.2813  1.1892 -1.8425  1.9102
#>  ~ x : [50x100]
#>                  1        2        3        4        5        .    
#>         1     -0.05485 -0.32084  0.79872  0.87154  1.38732 ........
#>         2     -0.24127  0.39965  0.28376 -0.13829  1.40286 ........
#>         3     -0.86804 -0.60867  0.18791 -0.12006 -0.44457 ........
#>         4     -0.17136 -1.08940 -0.83413 -0.12792 -2.34753 ........
#>         5     -0.94247  0.62299 -0.84125  0.99282  0.32481 ........
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
#>  ~ seed : 902
#>  ~ b : [2] -0.008473  0.094632
#>  ~ pi : [2] 0.9643 0.0357
#>  ~ sigma2 : 1.018
#>  ~ gamma2 : 5.681e-05
#>  ~ intercept : 0.01699
#>  ~ likelihood : -80.93
#>  ~ entropy : 14.32
#>  ~ P : [100x2]
#>              Group 1 Group 2
#>         1     0.995   0.005 
#>         2     0.980   0.020 
#>         3     0.985   0.015 
#>         4     0.955   0.045 
#>         5     0.925   0.075 
#>         .    ....... .......
#> 
#>  ~ theta : [1000x8]
#>                intercept    b1        b2        pi1       pi2        .    
#>          1     -0.011869 -0.048576  0.069894  0.580000  0.420000 .........
#>          2      0.065421 -0.047632  0.047750  0.600000  0.400000 .........
#>          3      0.026877 -0.068462  0.066144  0.560000  0.440000 .........
#>          4      0.008423 -0.077084  0.073649  0.610000  0.390000 .........
#>          5      0.044046 -0.064794  0.057828  0.580000  0.420000 .........
#>          .     ......... ......... ......... ......... ......... .........
#> 
#>  ~ Zw : [100x200]
#>        1 2 3 4 5 .
#>      1 0 0 0 0 0 .
#>      2 0 0 0 0 0 .
#>      3 0 0 0 0 0 .
#>      4 0 0 0 0 0 .
#>      5 0 0 0 0 0 .
#>      . . . . . . .
#> 
#>  ~ Bw : [100x200]
#>                    1         2         3         4         5         .    
#>          1     -0.015950  0.004674 -0.021297 -0.018465 -0.013852 .........
#>          2     -0.013368 -0.007140 -0.002877 -0.008043 -0.013285 .........
#>          3     -0.014461 -0.016768 -0.004366 -0.017456 -0.013564 .........
#>          4     -0.005849 -0.011818 -0.009505 -0.005495  0.003009 .........
#>          5     -0.002955 -0.009576 -0.005183 -0.011437 -0.001869 .........
#>          .     ......... ......... ......... ......... ......... .........
#> 
#>  ~ Z0 : NA
#>  ~ message : NA

plot(model)
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r

clus <- clusters(model, threshold = NULL)
clus
#>   [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#>  [38] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#>  [75] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1

predict(model, newx = x + 1)
#>  [1] -0.4896918 -0.4502099 -0.4667479 -0.4771389 -0.5566632 -0.3100903
#>  [7] -0.5259593 -0.3611448 -0.5393856 -0.4735279 -0.3774606 -0.4527907
#> [13] -0.6209860 -0.4837953 -0.5068788 -0.4988797 -0.6363064 -0.4733052
#> [19] -0.4792310 -0.4875776 -0.4106795 -0.5060970 -0.4494433 -0.4713816
#> [25] -0.5928116 -0.5126168 -0.3145244 -0.4215091 -0.4486801 -0.4760081
#> [31] -0.6509478 -0.4830134 -0.3561554 -0.4829253 -0.3673193 -0.4054195
#> [37] -0.4178948 -0.5059111 -0.4855992 -0.4516640 -0.5021294 -0.4752771
#> [43] -0.4636760 -0.5047719 -0.5787894 -0.5492506 -0.3232664 -0.5104684
#> [49] -0.4589390 -0.4405581

summary(model)
#>  -------------------------------
#>  | CLERE | Yengo et al. (2016) |
#>  -------------------------------
#> 
#>  Model object for  2 groups of variables ( user-specified )
#> 
#>  ---
#>  Estimated parameters using SEM algorithm are
#>  intercept = 0.01699
#>  b         = -0.008473    0.094632
#>  pi        = 0.9643  0.0357
#>  sigma2    = 1.018
#>  gamma2    = 5.681e-05
#> 
#>  ---
#>  Log-likelihood =  -80.93 
#>  Entropy        =  14.319 
#>  AIC            =  173.86 
#>  BIC            =  185.33 
#>  ICL            =  199.65
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
