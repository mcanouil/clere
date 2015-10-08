\name{numExpRealData-dataset}
\docType{data}
\alias{numExpRealData}
\alias{numExpRealData-dataset}

\title{Performances of 9 methods for dimension reduction applied to 2 published real dataset}

\description{
  This data  contains two matrices: one for the \code{Prostat}e dataset (from R
  package \code{lasso2}) and the other for the \code{eyedata} dataset (from R package
  \code{flare}). Each matrix has 5 rows and 28 colums. The columns can be
  grouped as three blocs of 9 (for each method compared: \code{LASSO}, \code{RIDGE},
  Elastic net [\code{ELNET}], Stepwise variable selection [\code{STEP}], \code{CLERE}, CLERE
  sparse [\code{CLERE_s}], Spike and Slab [\code{SS}], \code{AVG} method and Pairwise
  Absolute Clustering and Sparsity [\code{PACS}]). The 1st 9 (1:9) contain
  prediction error obtained by 5-fold cross validation using 10 random
  permutation of the covariate matrix. The 2nd 9 columns (10:18)
  contain the number of parameters estimated for each method. The 3rd 9
  columns are times in seconds measured for fitting each methods. The 28
  column is the seed utilized for generating random numbers in these
  analyses. For more details, please refer the package vignette.
}

\usage{
 data(numExpRealData)
}

\format{
  A list containing two matrices: one for the Prostate dataset (from R
  package lasso2) and the other for the Eye dataset (from R package flare)  
}

\seealso{
  Overview  : \code{\link{clere-package}} \cr
  Classes   : \code{\linkS4class{Clere}}, \code{\linkS4class{Pacs}} \cr
  Functions : \code{\link{fitClere}}, \code{\link{fitPacs}} \cr
  Datasets  : \code{\link{numExpSimData}}, \code{\link{numExpRealData}}, \code{\link{algoComp}}
}

\author{Loic Yengo \email{loic.yengol@gmail.com}}

\keyword{datasets}
\keyword{numExpRealData}
\keyword{clere}
