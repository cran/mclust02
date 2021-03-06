\name{hc}
\alias{hc}
\title{
  Model-based Hierarchical Clustering
}
\description{
  Agglomerative hierarchical clustering based on maximum likelihood criteria 
  for MVN mixture models parameterized by eigenvalue decomposition.
}
\usage{
hc(modelName, data, \dots)
}
\arguments{
  \item{modelName}{
    A character string indicating the model. Possible models: \cr\cr 
    "E" : equal variance  (one-dimensional) \cr
    "V" : spherical, variable variance (one-dimensional) \cr
    "EII": spherical, equal volume \cr
    "VII": spherical, unequal volume \cr
    "EEE": ellipsoidal, equal volume, shape, and orientation \cr
    "VVV": ellipsoidal, varying volume, shape, and orientation
  }
  \item{data}{
    A numeric vector, matrix, or data frame of observations.
    Categorical variables are not allowed.
    If a matrix or data frame, rows correspond to observations and
    columns correspond to variables.
  }
  \item{\dots}{
    Arguments for the method-specific hc functions. See
    \code{\link{hcE}}.
  }
}
\value{
  A numeric two-column matrix in which the \emph{i}th row gives the 
  minimum index for observations in each of the two clusters merged at the
  \emph{i}th stage of agglomerative hierarchical clustering.
}
\details{
  Most models have memory usage of the order of the square of the
  number groups in the initial partition for fast execution.
  Some models, such as equal variance or \code{"EEE"},
  do not admit a fast algorithm under the usual agglomerative
  hierarchical clustering paradigm. 
  These use less memory but are much slower to execute.
}
\note{
  If \code{modelName = "E"} (univariate with equal variances) or
  \code{modelName = "EII"} (multivariate with equal spherical
  covariances), then the method is equivalent to Ward's method for
  hierarchical clustering.
}
\section{References}{
  J. D. Banfield and A. E. Raftery (1993).
  Model-based Gaussian and non-Gaussian Clustering.
  \emph{Biometrics 49:803-821}. 
  
  C. Fraley (1998).
  Algorithms for model-based Gaussian hierarchical clustering.
  \emph{SIAM Journal on Scientific Computing 20:270-281}. 
  See \url{http://www.stat.washington.edu/mclust}. 
  
  C. Fraley and A. E. Raftery (2002a).
  Model-based clustering, discriminant analysis, and density estimation.
  \emph{Journal of the American Statistical Association 97:611-631}. 
  See \url{http://www.stat.washington.edu/mclust}. 
  
  C. Fraley and A. E. Raftery (2002b).
  MCLUST:Software for model-based clustering, density estimation and
  discriminant analysis. 
  Technical Report, Department of Statistics, University of Washington. 
  See \url{http://www.stat.washington.edu/mclust}.
}
\seealso{
  \code{\link{hcE}},...,
  \code{\link{hcVVV}},
  \code{\link{hclass}}
}
\examples{
data(iris)
irisMatrix <- as.matrix(iris[,1:4])

hcTree <- hc(modelName = "VVV", data = irisMatrix)
cl <- hclass(hcTree,c(2,3))

par(pty = "s", mfrow = c(1,1))
clPairs(irisMatrix,cl=cl[,"2"])
clPairs(irisMatrix,cl=cl[,"3"])

par(mfrow = c(1,2))
dimens <- c(1,2)
coordProj(irisMatrix, classification=cl[,"2"], dimens=dimens)
coordProj(irisMatrix, classification=cl[,"3"], dimens=dimens)
}
\keyword{cluster}
% docclass is function
% Converted by Sd2Rd version 1.21.
