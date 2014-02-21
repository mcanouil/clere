\name{clusters}

\docType{methods}

\alias{clusters}
\alias{clusters-methods}
\alias{clusters,Clere-method}

\title{
clusters method
}

\description{
This function makes returns the estimated clustering of variables.
}

\usage{
\S4method{clusters}{Clere}(object, threshold = NULL, ...)
}

\arguments{
    \item{object}{[Clere]: Output object from \code{\link{fit.clere}}.}
    \item{threshold}{[numeric]: A numerical \code{threshold > 0.5}. If \code{threshold = NULL} then the each variable is assigned to the cluster having the largest associated posterior probability.}
    \item{...}{Additional arguments, not to be supplied in this version.} 
}

\seealso{
Overview : \code{\link{clere-package}} \cr
Classes : \code{\linkS4class{Clere}} \cr
Methods :  \code{\link{show}}, \code{\link{plot}}, \code{\link{ggPlot}}, \code{\link{clusters}}, \code{\link{predict}}, \code{\link{summary}} \cr
Functions : \code{\link{fit.clere}}
}

\author{Loic Yengo \email{loic.yengo@gmail.com}}

\keyword{clusters}
\keyword{methods}
\keyword{method}
\keyword{Clere}
\keyword{clere}

% \examples{}
