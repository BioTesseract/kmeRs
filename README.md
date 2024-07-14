Version 2.1.0 beta is available now! Construction works are ongoing! :D


![](https://img.shields.io/badge/%20Bioconductor%20BiocCheck-true-green.svg)
![](https://img.shields.io/badge/build-passing-brightgreen?style=flat&label=circleci)

[![Build Status](https://travis-ci.com/RafalUrniaz/kmeRs.svg?branch=master)](https://travis-ci.com/OncoCDx/kmeRs) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html) [![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/kmeRs)](https://cran.r-project.org/package=kmeRs) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/373b82ef47824c96a0e138afd8e59a02)](https://www.codacy.com/app/RafalUrniaz/kmeRs?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=RafalUrniaz/kmeRs&amp;utm_campaign=Badge_Grade)




# kmeRs: K-Mers Similarity Score Matrix

Comprehensive tool to calculate similarity score matrix for nucleic and amino acid k-mers. Similarity score is evaluated by PAM and/or BLOSUM substitution matrix. The 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. Alignment is evaluated by Needleman-Wunsch and/or Smith-Waterman. 

[1. Installation](#installation)

[2. Documentation](#documentation)
- [2.1 Functions](#)
- [2.2 Examples](#)
    - [2.3.1 How to display BLOSUM matrix used for amino acides calculation?](#how-to-display-pam-or-blosum-matrix-used-for-amino-acides-calculation)
    - [2.3.2 How to find the most *'different'* k-mer from the *'given'* set of k-mers?](#)
    - [2.3.3 How to find the most *'different'* k-mer to *'whole'* given set of k-mers? ](#)
    - [2.3.4 How to calculate basic statistics for the matrix?](#)
    - [2.3.5 How to display a similarity matrix as a heatmap?](#)
- [2.3 Tutorials](#)
    
[3. Tests](#tests)

[4. How to cite](#how-to-cite)

## Installation

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

## Documentation
### Functions
The documentation for package including user guides, package vignettes, descriptions of the functions and other documentation is simply accessible by running command below.

```r
# To show the manual and functions' descriptions 
help(package = "kmeRs")
```
### Tutorials and examples
Package vignettes [/kmeRs/vignettes/](/kmeRs/vignettes/) folder of the repository or directly from the package by commands:
```r
# To show the introduction vignette
vignette("Introduction_to_kmeRs_package", package="kmeRs")
```
### Examples
#### How to display PAM or BLOSUM matrix used for amino acides calculation?

## Tests
The tests covering the code of package are available in [/kmeRs/tests/](/kmeRs/tests/) folder of the repository.

## How to cite

TBA
