label <-
function (x, pos, side, template) {
	#	template based on textblock
	#	\begin{textblock}{0.8}[side](pos)
	r <- template
	
	#	can also use isHyrbid
	x$taxon <- gsub("\u00D7", "$\\times$", x$taxon, fixed = TRUE)
	
	hook <- grep("(pos)", r, fixed = TRUE)
	r[hook] <- gsub("(pos)", pos, r[hook], fixed = TRUE)
	
	hook <- grep("[side]", r, fixed = TRUE)
	r[hook] <- gsub("[side]", side, r[hook], fixed = TRUE)
	
	family  <- as.character(x$family)
	taxon <- paste("\\textbf{", as.character(x$taxon), "} ",
		"\\\\{\\footnotesize \\textsc{",
				gsub("&", "\\&", as.character(x$authority), fixed = TRUE),
				"}}", sep = "")
	
	r[grep("family", r, fixed = TRUE)] <-
		paste(family, "\\\\")
	r[grep("species", r, fixed = TRUE)] <-
		paste(taxon, "\\par\\bigskip")
	r[grep("locality", r, fixed = TRUE)] <-
		paste(x$locality, "") # \\par\\bigskip
	r[grep("habitat", r, fixed = TRUE)] <-
		paste(x$habitat, "\\\\")
	r[grep("date", r, fixed = TRUE)] <-
		paste("\\texttt{Date ", x$date, ",}", sep = "")
	r[grep("coordinates", r, fixed = TRUE)] <-
		paste("\\texttt{", x$coordinates, "}", sep = "")
	r[grep("number", r, fixed = TRUE)] <-
		paste("\\texttt{collectors \\#:\\,\\textbf{",
			ifelse(!is.na(x$voucher), x$voucher, "\\dots"),
			"}}\\\\ \\vspace*{0.25cm}", sep = "")
	#r[grep("plot", r, fixed = TRUE)] <-
	#	paste("{\\centering{\\footnotesize --- Vegetation Sample Plot Label ",
	#			toupper(sel$plot), " ---}}", sep = "")			
	return(r)
}
