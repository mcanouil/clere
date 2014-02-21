\name{clere-package}

\docType{package}

\alias{clere}
\alias{clere-package}

\title{
  CLERE methodology for simultaneous variables clustering and regression
}

\description{
  The methodology consists in creating clusters of variables involved in a high dimensional linear regression model so as to reduce the dimensionality. A model-based approach is proposed and fitted using a Stochastic EM-Gibbs algorithm (SEM-Gibbs).
}

\details{
  \tabular{ll}{
    Package: \tab clere\cr
    Title: \tab CLERE methodology for simultaneous variables clustering and regression\cr
    Version: \tab 1.1\cr
    Date: \tab 2014-02-15\cr
    Author: \tab Loic Yengo <loic.yengo@gmail.com>\cr
    Contributor: \tab Mickael Canouil\cr
    Maintainer: \tab Loic Yengo <loic.yengo@gmail.com>\cr
    License: \tab GPL (>= 3)\cr
    Depends: \tab methods, parallel\cr
    Imports: \tab Rcpp\cr
    Suggests: \tab grid, ggplot2\cr
    LinkingTo: \tab Rcpp, RcppEigen\cr
  }
  The package implements mainly the \code{\link{fit.clere}} function (an example is given below) for fitting the model from a matrix of covariates and a vector of response. The package also implements a \code{\link{summary}} method and graphical summary \code{\link{plot}} (or \code{\link{ggPlot}}) which represents the course of each parameters at each step of the SEM-Gibbs and a \code{\link{predict}} method for making prediction from a new design matrix. 
}

\seealso{
  Overview : \code{\link{clere-package}} \cr
  Classes : \code{\linkS4class{Clere}} \cr
  Methods :  \code{\link{show}}, \code{\link{plot}}, \code{\link{ggPlot}}, \code{\link{clusters}}, \code{\link{predict}}, \code{\link{summary}} \cr
  Functions : \code{\link{fit.clere}}
}

\author{Loic Yengo \email{loic.yengo@gmail.com}}

\references{
  Yengo L., Jacques J. and Biernacki C. Variable clustering in high dimensional linear regression, Journal de la Societe Francaise de Statistique (2013).
}

\keyword{clere-package}
\keyword{Clere}
\keyword{clere}
\keyword{package}

\examples{ 
# Simple example using simulated data
# to see how to you the main function clere
# library(clere)
x     <- matrix(rnorm(50 * 100), nrow = 50, ncol = 100)
y     <- rnorm(50)
model <- fit.clere(y = y, x = x, g = 2, plotit = FALSE)
plot(model) 
# ggPlot(model)
clus <- clusters(model, threshold = NULL)
predict(model, newx = x+1)
summary(model)
}
