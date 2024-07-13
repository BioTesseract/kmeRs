Version 2.1.0 beta is available now!

![](https://img.shields.io/badge/%20Bioconductor%20BiocCheck-true-green.svg) [![Build Status](https://travis-ci.com/RafalUrniaz/kmeRs.svg?branch=master)](https://travis-ci.com/OncoCDx/kmeRs) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html) [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/kmeRs)](https://cran.r-project.org/package=kmeRs) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/373b82ef47824c96a0e138afd8e59a02)](https://www.codacy.com/app/RafalUrniaz/kmeRs?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RafalUrniaz/kmeRs&amp;utm_campaign=Badge_Grade)

# kmeRs: K-Mers Similarity Score Matrix

Comprehensive tool to calculate similarity score matrix for nucleic and amino acid k-mers. Similarity score is evaluated by PAM and/or BLOSUM substitution matrix. The 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. Alignment is evaluated by Needleman-Wunsch and/or Smith-Waterman. 

[I. Installation](#i-installation)
[II. Documentation and tutorials ](#documentation-and-tutorials)

## I. Installation

**Bioconductor Packages** need to be installed first,
```r
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("Biostrings")
BiocManager::install("pwalign")
BiocManager::install("BiocGenerics")
```
**then install from CRAN**
```r
install.packages("kmeRs")
```
**or development version from GitHub**
```r
install.packages("devtools")
devtools::install_github("urniaz/kmeRs/kmeRs/")
```

## II. Documentation and tutorials 
The documentation can be found in [/kmeRs/vignettes/](/kmeRs/vignettes/) folder of the repository or directly from the package by commands:
```r
# To show the introduction vignette
vignette("Introduction_to_kmeRs_package", package="kmeRs")

# To show the manual and functions examples
help(package = "kmeRs")
```

## III.Tests

## IV. How to cite

TBA
