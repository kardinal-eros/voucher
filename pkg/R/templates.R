template <- function() {
	path <- paste(system.file(package = "voucher"), "/extdata/template.tex", sep='')
	con <- file(path)
		r <- readLines(con)
	close(con)
	return(r)
}

preamble <- function() {
	path <- paste(system.file(package = "voucher"), "/extdata/preamble.tex", sep='')
	con <- file(path )
		r <- readLines(con)
	close(con)
	return(r)
}

configure <- function() {
	path <- paste(system.file(package = "voucher"), "/extdata/configure.tex", sep='')
	con <- file(path )
		r <- readLines(con)
	close(con)
	return(r)
}