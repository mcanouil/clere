#' CLERE methodology for simultaneous variables clustering and regression
#' 
#' The methodology consists in creating clusters of variables involved in a
#' high dimensional linear regression model so as to reduce the dimensionality.
#' A model-based approach is proposed and fitted using a Stochastic EM-Gibbs
#' algorithm (SEM-Gibbs).
#' 
#' \tabular{ll}{ Package: \tab clere\cr Title: \tab CLERE methodology for
#' simultaneous variables clustering and regression\cr Version: \tab 1.1.4\cr
#' Date: \tab 2016-03-18\cr Author: \tab Loic Yengo <loic.yengo@gmail.com>\cr
#' Contributor: \tab Mickael Canouil <mickael.canouil@cnrs.fr>\cr Maintainer:
#' \tab Loic Yengo <loic.yengo@gmail.com>\cr License: \tab GPL (>= 3)\cr
#' Depends: \tab methods, parallel\cr Imports: \tab Rcpp\cr LinkingTo: \tab
#' Rcpp, RcppEigen\cr } The package implements mainly the
#' \code{\link{fitClere}} function (an example is given below) for fitting the
#' model from a matrix of covariates and a vector of response. The package also
#' implements a \code{\link{summary}} method and graphical summary
#' \code{\link{plot}} which represents the course of each parameters at each
#' step of the SEM-Gibbs and a \code{\link{predict}} method for making
#' prediction from a new design matrix.
#' 
#' @name clere-package
#' @aliases clere clere-package
#' @docType package

#' @seealso Overview : 
#' \code{\link{clere-package}} \cr Classes :
#' \code{\linkS4class{Clere}} \cr Methods : \code{\link{show}},
#' \code{\link{plot}}, \code{\link{clusters}}, \code{\link{predict}},
#' \code{\link{summary}} \cr Functions : \code{\link{fitClere}} Datasets :
#' \code{\link{numExpRealData}}, \code{\link{numExpSimData}}
#' 
#' @references Yengo L., Jacques J. and Biernacki C. Variable clustering in
#' high dimensional linear regression, Journal de la Societe Francaise de
#' Statistique (2013).
#' 
#' @examples
#'  
#'  # Simple example using simulated data
#'  # to see how to you the main function clere
#'  # library(clere)
#'  x     <- matrix(rnorm(50 * 100), nrow = 50, ncol = 100)
#'  y     <- rnorm(50)
#'  model <- fitClere(y = y, x = x, g = 2, plotit = FALSE)
#'  plot(model) 
#'  clus <- clusters(model, threshold = NULL)
#'  predict(model, newx = x+1)
#'  summary(model)
#' 
NULL

## usethis namespace: start
#' @useDynLib clere, .registration = TRUE
## usethis namespace: end
NULL

## usethis namespace: start
#' @importFrom Rcpp sourceCpp
## usethis namespace: end
NULL
## usethis namespace: start
#' @import RcppEigen
## usethis namespace: end
NULL