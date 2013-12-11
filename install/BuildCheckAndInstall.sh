R CMD build --no-build-vignettes /Users/roli/Documents/voucher/pkg
R CMD check voucher_0.1-1.tar.gz
R CMD INSTALL -l /Users/roli/Library/R/3.0/library voucher_0.1-1.tar.gz
