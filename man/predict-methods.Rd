\name{predict}

\docType{methods}

\alias{predict}
\alias{predict-methods}
\alias{predict,Clere-method}

\title{
predict method
}

\description{
This function makes prediction using a fitted model and a new matrix of design. It returns a vector of predicted values of size equal to the number of rows of matrix newx.
}

\usage{
\S4method{predict}{Clere}(object, newx, ...)
}

\arguments{
    \item{object}{[Clere]: Output object from \code{\link{fit.clere}}.}
    \item{newx}{[matrix]: A numeric design matrix.}
    \item{...}{Additional arguments, not to be supplied in this version.} 
}

\seealso{
Overview : \code{\link{clere-package}} \cr
Classes : \code{\linkS4class{Clere}} \cr
Methods :  \code{\link{show}}, \code{\link{plot}}, \code{\link{ggPlot}}, \code{\link{clusters}}, \code{\link{predict}}, \code{\link{summary}} \cr
Functions : \code{\link{fit.clere}}
}

\author{Loic Yengo \email{loic.yengo@gmail.com}}

\keyword{summary}
\keyword{methods}
\keyword{method}
\keyword{Clere}
\keyword{clere}

% \examples{}
