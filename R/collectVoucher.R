collectVoucher <-
function (x) {
	require(vegsoup)
	stopifnot(inherits(x, "Vegsoup"))
	#	mandatory columns label fields
	#	c("family", "taxon", "authority",
	#	"locality", "habitat",
	#	"date", "coordinates", "id")
	
	#	get geocoding	
	x <- reverseGeocode(x)	
	#	species
	xx <- Species(x)[Species(x)$voucher != "", ]
	xx <- xx[order(xx$voucher), ]	
	#	sites
	yy <- Sites(x)
	i <- match(xx$plot, rownames(x))
	j <- c("locality", "syntaxon", "habitat", "date", "coordinate")
	j <- unlist(sapply(j, function (x) grep(x, names(yy))))
	yy <- Sites(x)[i, j]
	#	taxonomy
	zz <- Taxonomy(x)
	i <- match(xx$abbr, zz$abbr)
	j <- c("taxon", "authority", "family")
	j <- sapply(j, function (x) agrep(x, names(zz)))
	zz <- zz[i, j]
	#	merge objects
	r <- cbind(xx, zz, yy)
	#	merge if data set support additional locality field
	j <- grep("locality", names(r))
	if (length(j) > 1) {
		r0 <- r[,-j]
		r1 <- r[, j]
		r1 <- apply(r1, 1, paste, collapse = "; ")
		r <- cbind(r0, locality = r1)
	}
	#	merge if data set support syntaxon field
	j <- sapply(c("habitat", "syntaxon"), function (x) agrep(x, names(r)))
	if (length(j) > 1) {
		r0 <- r[, -j]		
		r1 <- r[, j]
		r1 <- apply(r1, 1, paste, collapse = "; ")
		r <- cbind(r0, habitat = r1)
	}			
	#	prepare names
	j <- grep("coordinate", names(r))
	if (length(j) == 1) {
		names(r)[j] <- "coordinates"
	}
	#	remove factors
	r <- as.data.frame(as.matrix(r), stringsAsFactors = FALSE)
	return(r)
}
