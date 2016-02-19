pageLayout <- function (x, nrow = 3, ncol = 2) {
	pos <- c()	
	for (i in 1:nrow)
		for (j in 1:ncol) pos <- c(pos, paste0("(", j, ",", i, ")"))
	pos <- rep(pos, nrow(x))
	
	side <- rep(c("[1,1]","[1,1]"), nrow(x))
	
	pagebreak <- vector("logical", length(pos))
	pagebreak[ seq(1, nrow(x), by = length(unique(pos))) ] <- TRUE
	pagebreak[1] <- FALSE
	r <- list(pos = pos, side = side, pagebreak = pagebreak)
	return(r)
}
