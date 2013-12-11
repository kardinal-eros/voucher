\name{collectVoucher}
\alias{collectVoucher}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
collectVoucher(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x) 
{
    require(vegsoup)
    stopifnot(inherits(x, "Vegsoup"))
    x <- reverseGeocode(x)
    xx <- Species(x)[Species(x)$voucher != "", ]
    xx <- xx[order(xx$voucher), ]
    yy <- Sites(x)
    i <- match(xx$plot, rownames(x))
    j <- c("locality", "syntaxon", "habitat", "date", "coordinate")
    j <- unlist(sapply(j, function(x) grep(x, names(yy))))
    yy <- Sites(x)[i, j]
    zz <- Taxonomy(x)
    i <- match(xx$abbr, zz$abbr)
    j <- c("taxon", "authority", "family")
    j <- sapply(j, function(x) agrep(x, names(zz)))
    zz <- zz[i, j]
    r <- cbind(xx, zz, yy)
    j <- grep("locality", names(r))
    if (length(j) > 1) {
        r0 <- r[, -j]
        r1 <- r[, j]
        r1 <- apply(r1, 1, paste, collapse = "; ")
        r <- cbind(r0, locality = r1)
    }
    j <- sapply(c("habitat", "syntaxon"), function(x) agrep(x, 
        names(r)))
    if (length(j) > 1) {
        r0 <- r[, -j]
        r1 <- r[, j]
        r1 <- apply(r1, 1, paste, collapse = "; ")
        r <- cbind(r0, habitat = r1)
    }
    j <- grep("coordinate", names(r))
    if (length(j) == 1) {
        names(r)[j] <- "coordinates"
    }
    r <- as.data.frame(as.matrix(r), stringsAsFactors = FALSE)
    return(r)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
