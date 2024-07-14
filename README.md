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
- [2.3 Tutorials](#23-tutorials)
    
[3. Tests](#3-tests)

[4. How to cite](#4-how-to-cite)

[5. Acknowledgement](#5-acknowledgement)



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

Simply apply the **kmeRs_similarity_matrix** function and mark the appropriate matrix, here BLOSUM62.  

```r
# Simple BLOSUM62 similarity matrix for all amino acid nucleotides
  BLOSUM62 <- kmeRs_similarity_matrix(submat = "BLOSUM62")
# Fancy knitr table
  knitr::kable(BLOSUM62)
```


<table style="width:100%;">
<colgroup>
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
<col style="width: 4%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;"></th>
<th style="text-align: right;">G</th>
<th style="text-align: right;">A</th>
<th style="text-align: right;">L</th>
<th style="text-align: right;">M</th>
<th style="text-align: right;">F</th>
<th style="text-align: right;">W</th>
<th style="text-align: right;">K</th>
<th style="text-align: right;">Q</th>
<th style="text-align: right;">E</th>
<th style="text-align: right;">S</th>
<th style="text-align: right;">P</th>
<th style="text-align: right;">V</th>
<th style="text-align: right;">I</th>
<th style="text-align: right;">C</th>
<th style="text-align: right;">Y</th>
<th style="text-align: right;">H</th>
<th style="text-align: right;">R</th>
<th style="text-align: right;">N</th>
<th style="text-align: right;">D</th>
<th style="text-align: right;">T</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">G</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
</tr>
<tr>
<td style="text-align: left;">A</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">L</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">M</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">F</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
</tr>
<tr>
<td style="text-align: left;">W</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-2</td>
</tr>
<tr>
<td style="text-align: left;">K</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">Q</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">E</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">S</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">P</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">V</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">I</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">C</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">Y</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
</tr>
<tr>
<td style="text-align: left;">H</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
</tr>
<tr>
<td style="text-align: left;">R</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">N</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">0</td>
</tr>
<tr>
<td style="text-align: left;">D</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-4</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-3</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">-1</td>
</tr>
<tr>
<td style="text-align: left;">T</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-2</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">-1</td>
<td style="text-align: right;">5</td>
</tr>
</tbody>
</table>

#### 2.3.2 How to find the most *'different'* k-mer from the *'given'* set of k-mers?


In this example, the most *‘different’* k-mer to “GATTACA” sequence will
be indicated from given set of heptamers. Here, 7 heptamer (being an
anagram of the movie title “GATTACA”) are given, as follow:

```r
    # Given hexamers
      kmers_given <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
    # Matrix calculation 
      kmers_mat <- kmeRs_similarity_matrix(q = c("GATTACA"), x = kmers_given , submat = "BLOSUM62") 
    # Fancy knitr table
      knitr::kable(kmers_mat) 
```


<table>
<thead>
<tr>
<th style="text-align: left;"></th>
<th style="text-align: right;">GATTACA</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">GATTACA</td>
<td style="text-align: right;">37</td>
</tr>
<tr>
<td style="text-align: left;">ACAGATT</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">GAATTAC</td>
<td style="text-align: right;">15</td>
</tr>
<tr>
<td style="text-align: left;">GAAATCT</td>
<td style="text-align: right;">19</td>
</tr>
<tr>
<td style="text-align: left;">CTATAGA</td>
<td style="text-align: right;">7</td>
</tr>
<tr>
<td style="text-align: left;">GTACATA</td>
<td style="text-align: right;">12</td>
</tr>
<tr>
<td style="text-align: left;">AACGATT</td>
<td style="text-align: right;">4</td>
</tr>
</tbody>
</table>

Now, applying **kmeRs\_score** function the total score is calculated
and the matrix is sorted by increasing score value. The lowest value (in
case of BLOSUM) indicates the most *‘different’* sequence from given
k-mers, in contrast to the highest value which indicates the most
similar one.

    # Score and sort the matrix  
      kmers_res <- kmeRs_score(kmers_mat)
    # Fancy knitr table
      knitr::kable(kmers_res)

<table>
<thead>
<tr>
<th style="text-align: left;"></th>
<th style="text-align: right;">GATTACA</th>
<th style="text-align: right;">Sum</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">ACAGATT</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1</td>
</tr>
<tr>
<td style="text-align: left;">AACGATT</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">4</td>
</tr>
<tr>
<td style="text-align: left;">CTATAGA</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">7</td>
</tr>
<tr>
<td style="text-align: left;">GTACATA</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">12</td>
</tr>
<tr>
<td style="text-align: left;">GAATTAC</td>
<td style="text-align: right;">15</td>
<td style="text-align: right;">15</td>
</tr>
<tr>
<td style="text-align: left;">GAAATCT</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">19</td>
</tr>
<tr>
<td style="text-align: left;">GATTACA</td>
<td style="text-align: right;">37</td>
<td style="text-align: right;">37</td>
</tr>
</tbody>
</table>

As can be observed, the most *‘different’* sequence to GATTACA is
ACAGATT with total score equal to 1 and the most similar to GATTACA
sequence is of course GATTACA sequence with the highest score equal to
37.



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
