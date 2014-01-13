labels <- function (x, file = "labels.tex", template) {
	if (missing(template)) {
		stop("please supply LaTex template")
	}
	#	names(x) <- tolower(names(x))
	l <- pageLayout(x)
	r  <- c()
	
	#which(pagebreak)
	for (i in 1:nrow(x)) {
		#	i = 1
		pagebreak <- l$pagebreak[i]
		ri <- label(x[i, ], l$pos[i], l$side[i], template)
		r <- c(r, ifelse (pagebreak, "\n\\null\\newpage %persuade LaTex", ""), ri)
	}
	
	#	write to disk
	con <- file(file)
		writeLines(r, con)
	close(con)
	
	return(invisible(r))
}
