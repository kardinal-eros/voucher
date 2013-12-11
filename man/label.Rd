\name{label}
\alias{label}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
label(x, pos, side, template)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
%%     ~~Describe \code{x} here~~
}
  \item{pos}{
%%     ~~Describe \code{pos} here~~
}
  \item{side}{
%%     ~~Describe \code{side} here~~
}
  \item{template}{
%%     ~~Describe \code{template} here~~
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
function (x, pos, side, template) 
{
    r <- template
    x$taxon <- gsub("<U+00D7>", "$\\times$", x$taxon, fixed = TRUE)
    hook <- grep("(pos)", r, fixed = TRUE)
    r[hook] <- gsub("(pos)", pos, r[hook], fixed = TRUE)
    hook <- grep("[side]", r, fixed = TRUE)
    r[hook] <- gsub("[side]", side, r[hook], fixed = TRUE)
    family <- as.character(x$family)
    taxon <- paste("\\textbf{", as.character(x$taxon), "} ", 
        "\\\\{\\footnotesize \\textsc{", gsub("&", "\\&", as.character(x$authority), 
            fixed = TRUE), "}}", sep = "")
    r[grep("family", r, fixed = TRUE)] <- paste(family, "\\\\")
    r[grep("species", r, fixed = TRUE)] <- paste(taxon, "\\par\\bigskip")
    r[grep("locality", r, fixed = TRUE)] <- paste(x$locality, 
        "")
    r[grep("habitat", r, fixed = TRUE)] <- paste(x$habitat, "\\\\")
    r[grep("date", r, fixed = TRUE)] <- paste("\\texttt{Date ", 
        x$date, ",}", sep = "")
    r[grep("coordinates", r, fixed = TRUE)] <- paste("\\texttt{", 
        x$coordinates, "}", sep = "")
    r[grep("number", r, fixed = TRUE)] <- paste("\\texttt{collectors \\#:\\,\\textbf{", 
        ifelse(!is.na(x$voucher), x$voucher, "\\dots"), "}}\\\\ \\vspace*{0.25cm}", 
        sep = "")
    return(r)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
