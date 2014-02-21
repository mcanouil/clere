\name{ggPlot}
\docType{methods}

\alias{ggPlot}
\alias{ggPlot-methods}
\alias{ggPlot,Clere-method}

\title{
ggPlot method
}

\description{
Graphical summary for MCEM/SEM-Gibbs estimation.
This function represents the course of the model parameters in view of the iterations of the estimation algorithms implemented in \code{\link{fit.clere}}.
}

\usage{
\S4method{ggPlot}{Clere}(data, ...)
}

\arguments{
    \item{data}{[Clere]: Output object from \code{\link{fit.clere}}.}
    % \item{returnGGplot}{[logical]: If \code{TRUE}, ggplot objects are returned in a list.}
    \item{...}{Additional arguments, not to be supplied in this version.}
}

\seealso{
Overview : \code{\link{clere-package}} \cr
Classes : \code{\linkS4class{Clere}} \cr
Methods :  \code{\link{show}}, \code{\link{plot}}, \code{\link{ggPlot}}, \code{\link{clusters}}, \code{\link{predict}}, \code{\link{summary}} \cr
Functions : \code{\link{fit.clere}}
}

\author{Loic Yengo \email{loic.yengo@gmail.com}}

\keyword{ggPlot}
\keyword{methods}
\keyword{method}
\keyword{Clere}
\keyword{clere}

% \examples{}
