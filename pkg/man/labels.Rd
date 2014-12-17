\name{labels}
\alias{labels}
\alias{label}
\alias{pageLayout}

\title{ Create Latex input }

\description{
Create file to be typesetted using LaTex.
}

\usage{
labels(x, file = "labels.tex", template, nrow = 3, ncol = 2)
label(x, pos, side, template)
pageLayout(x, nrow = 3, ncol = 2)
}

\arguments{
  \item{ x }{
  data.frame.
}
  \item{ file }{
  character. A output file name.
}
  \item{ template }{
  character. LaTex template (see \code{\link{template}})
}
  \item{ nrow, ncol }{
  integer. Number of rows and columns in page layout.
}
  \item{ pos }{
  how to position individual label on page. See \sQuote{Details}.
}
  \item{ side }{
  how to position individual label on page.
}
}
\details{
The function uses the \href{http://www.ctan.org/pkg/textpos}{textpos} package to place individual labels on page. A 2 by 4 layout is predefined.

\describe{

\item{ \code{labels} }{ calls the below listed function and save a file specified in \code{file} argument. The structure (layout) of a label is controlled by a template and the function expects to find some specific keywords. See (reference to extdata).

}

\item{ \code{label} }{
creates LaTex source for an individual label (a unique voucher).
}

\item{ \code{pageLayout} }{
creates a list of arguments that can be used along with the \emph{textblock} environment provided with the textpos package (\code{"\begin{textblock}{0.8}[side](pos)"}).
}
}

}
\value{
a file written to disk.
}

\author{ Roland Kaiser }

\examples{
# Nothing here yet
}

\keyword{ manip }
