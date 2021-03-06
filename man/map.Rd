\name{map}
\alias{map}
\title{
  Classification given Probabilities 
}
\description{
  Converts a matrix in which each row sums to \emph{1} 
  into the nearest matrix of \emph{(0,1)} indicator variables.
}
\usage{
map(z, warn=TRUE, \dots)
}
\arguments{
  \item{z}{
    A matrix (for example a matrix of conditional
    probabilities  in which each row sums to 1
    as produced by the E-step of the EM algorithm).
  }
  \item{warn}{
    A logical variable indicating whether or not a warning should be
    issued when there are some columns of \code{z} for which no row
    attains a maximum.
  }
  \item{\dots }{
    Provided to allow lists with elements other than the arguments can
    be passed in indirect or list calls with \code{do.call}.
  }
}
\value{
  A integer vector with one entry for each row of z,
  in which the \emph{i}-th value is the column index at which the
  \emph{i}-th row of \code{z} attains a maximum.
  
}
\section{References}{
  C. Fraley and A. E. Raftery (2002a).
  Model-based clustering, discriminant analysis, and density estimation.
  \emph{Journal of the American Statistical Association 97:611-631}. 
  
  C. Fraley and A. E. Raftery (2002b).
  MCLUST:Software for model-based clustering, density estimation and 
  discriminant analysis. 
  Technical Report, Department of Statistics, University of Washington. 
  
  See \url{http://www.stat.washington.edu/mclust}.
}
\seealso{
  \code{\link{unmap}},
  \code{\link{estep}},
  \code{\link{em}},
  \code{\link{me}}
}
\examples{
data(iris)
irisMatrix <- as.matrix(iris[,1:4])
irisClass <- iris[,5]

emEst <- me(modelName = "VVV", data = irisMatrix, z = unmap(irisClass))

map(emEst$z)
}
\keyword{cluster}
% docclass is function
