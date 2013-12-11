template <- function() {
	path <- paste(system.file(package = "voucher"), "/extdata/template.tex", sep='')
	con <- file("~/Desktop/build/template.tex")
		r <- readLines(con)
	close(con)
	return(r)
}

preamble <- function() {
	path <- paste(system.file(package = "voucher"), "/extdata/preamble.tex", sep='')
	con <- file("~/Desktop/build/template.tex")
		r <- readLines(con)
	close(con)
	return(r)
}