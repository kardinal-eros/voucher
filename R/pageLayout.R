pageLayout <-
function (x) {
	pos <-c(
		"(1,1)", "(2,1)", "(1,2)",
		"(2,2)", "(1,3)", "(2,3)")
	pos <- rep(pos, nrow(x))
	
	side <- c("[1.05,1]","[0.95,1]")
	side <- rep(side, nrow(x))
	
	pagebreak <- vector("logical", length(pos))
	pagebreak[seq(1, nrow(x), by = length(unique(pos)))] <- TRUE
	pagebreak[1] <- FALSE
	r <- list(pos = pos, side = side, pagebreak = pagebreak)
	return(r)
}
