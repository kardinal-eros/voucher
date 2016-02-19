voucher
========

Build status
------------

[![Travis-CI Build Status](https://travis-ci.org/kardinal-eros/voucher.svg?branch=master)](https://travis-ci.org/kardinal-eros/voucher)
<!-- [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/voucher)](http://cran.r-project.org/package=voucher) -->

About
-----

Functions to typeset herbarium labels using LaTex from data extracted from a data frame or Vegsoup object.

Installation
------------

You may directly install the package from GitHub using the below set of commands.

```R
# if not already installed
install.packages("devtools")

library(devtools)

#	install dependency vegsoup from github mirror
install_github("rforge/vegsoup/pkg")

install_github("kardinal-eros/voucher/pkg")

library(voucher)
```