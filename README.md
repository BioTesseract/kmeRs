Version 2.1.0 beta is available now! Construction works are ongoing! :D

![](https://img.shields.io/badge/%20Bioconductor%20BiocCheck-true-green.svg)  ![Static Badge](https://img.shields.io/badge/A-brightgreen?style=flat&logo=Codacy&label=code%20quality)  ![Static Badge](https://img.shields.io/badge/98%25-brightgreen?style=flat&logo=Codacy&label=coverage)  ![](https://img.shields.io/badge/build-passing-brightgreen?style=flat&label=circleci)  ![CRAN/METACRAN License](https://img.shields.io/cran/l/kmeRs)  ![CRAN/METACRAN Version](https://img.shields.io/cran/v/kmeRs)


# kmeRs: K-Mers Similarity Score Matrix

Comprehensive tool to calculate and heatmap similarity score matrix for nucleic and amino acid k-mers. Similarity score is evaluated by PAM and/or BLOSUM substitution matrix. The 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. Alignment is evaluated by Needleman-Wunsch and/or Smith-Waterman. 

[1. Installation](#1-installation)

[2. Documentation](#2-documentation)
- [2.1 Functions](#21-functions)
- [2.2 Examples](#22-examples)
    - [2.3.1 How to display BLOSUM matrix used for amino acides calculation?](#231-how-to-display-blosum-matrix-used-for-amino-acides-calculation)
    - [2.3.2 How to find the most *'different'* k-mer from the *'given'* set of k-mers?](#232-how-to-find-the-most-different-k-mer-from-the-given-set-of-k-mers)
    - [2.3.3 How to find the most *'different'* k-mer to *'whole'* given set of k-mers? ](#233-how-to-find-the-most-different-k-mer-to-whole-given-set-of-k-mers)
    - [2.3.4 How to calculate basic statistics for the matrix?](#234-how-to-calculate-basic-statistics-for-the-matrix)
    - [2.3.5 How to display a similarity matrix as a heatmap?](#235-how-to-display-a-similarity-matrix-as-a-heatmap)
- [2.3 Tutorials](##23-tutorials)
    
[3. Tests](#tests)

[4. How to cite](#how-to-cite)

[5. Acknowledgement](#how-to-cite)

## 1. Installation

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

## 2. Documentation

### 2.1 Functions
The documentation for package including user guides, package vignettes, descriptions of the functions and other documentation is simply accessible by running command below.

```r
# To show the manual and functions' descriptions 
help(package = "kmeRs")
```

### 2.2 Examples

#### 2.3.1 How to display BLOSUM matrix used for amino acides calculation?

#### 2.3.2 How to find the most *'different'* k-mer from the *'given'* set of k-mers?

#### 2.3.3 How to find the most *'different'* k-mer to *'whole'* given set of k-mers?

#### 2.3.4 How to calculate basic statistics for the matrix?

#### 2.3.5 How to display a similarity matrix as a heatmap?


### 2.3 Tutorials

Package vignettes are avaliable in [/kmeRs/vignettes/](/kmeRs/vignettes/) folder of the repository or directly from the package by command:

```r
# To show the introduction vignette
vignette("Introduction_to_kmeRs_package", package="kmeRs")
```

## 3. Tests

Test are implemented as continuous integration by CircleCI. Continuous integration is a DevOps software development practice where code changes are regularly merge into a central repository, after which automated builds and tests are run.

The source of tests covering the code of the package are available in [/kmeRs/tests/](/kmeRs/tests/) folder of the repository.

## 4. How to cite

TBA

## 5. Acknowledgement

Special thanks to Jason Lin, PhD from Chiba Cancer Center Research Institute, Chiba, Japan for contribution in 2021 as implementing of heatmap function and update deprecated functions. The kmeRs_generate_kmers and kmeRs_twoSeqSim base on orginal source from tcR and rDNAse, respectively.
