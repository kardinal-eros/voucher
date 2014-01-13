\name{collect}
\alias{collectVegsoup}
\alias{collect}

\title{ Collect voucher data from Vegsoup object }

\description{
The function calls \code{\link[vegsoup:reverseGeocode]{reverseGeocode}} from \pkg{vegsoup} to create a string of coordinate information and locality description. It then searches for vouchers stored in the species slot of the vegsoup object (column \code{"voucher"}).
}

\usage{
collectVegsoup(x)
collect(x)
}

\arguments{
  \item{ x }{
vegsoup object
}

}
\details{
This is an extractor that befits from the data stored in vegsoup objects, namely sampling coordinates, available descriptive data of samplings units (e.g. date and sample classification).
}

\value{
data.frame
}

\author{ Roland Kaiser }

\seealso{
\code{\link{labels}}, \code{\link[vegsoup:vegsoup-package]{vegsoup}}
}
\examples{
# Nothing here yet
}
\keyword{ manip }

