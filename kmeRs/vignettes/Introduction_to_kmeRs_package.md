---
title: "Introduction to the kmeRs package"
author:
- name: Rafal Urniaz, PhD^[BioTesseract Cambridge Bioinformatics Solutions, Cambridgeshire, Cambridge, UK]
date: "2018-10-29"
output: rmarkdown::html_vignette
  # pdf_document
  # md_document:
  #    variant: markdown_github
bibliography: citations.bib
vignette: >
  %\VignetteIndexEntry{Introduction to the kmeRs R package}
  %\VignetteEngine{knitr::knitr}
  %\VignetteEncoding{UTF-8}
---


## Introduction

The package contains tools to calculate DNA similarity score matrix for k length given k-mers vs. different k-mers combination. The pairwise similarity score is calculated using PAM or BLOSUM substitution matrix; 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. The results are evaluated by global similarity score calculated by Needleman-Wunsch global [@NEEDLEMAN1970443] alignment or Smith-Waterman local alignment [@SMITH1981195]. Higher similarity score indicates more similar sequences for BLOSUM and opposite for PAM matrix.

### Import the package first
   

```r
# Import the package 
  library(kmeRs)
```

### Example 1. How to display PAM or BLOSUM matrix used for calculation?

Simply apply the **kmeRs_similarity_matrix** function and mark as an input the vector contains the nucleotides letters for witch the scores should be calculated.    


```r
# Simple BLOSUM62 similarity matrix for all DNA nucleotides
  result <- kmeRs_similarity_matrix(kmers_given = c("A", "T", "C", "G"), submat = "BLOSUM62")
# Fancy knitr table
  knitr::kable(result)
```



|   |  A|  T|  C|  G|
|:--|--:|--:|--:|--:|
|A  |  4|  0|  0|  0|
|T  |  0|  5| -1| -2|
|C  |  0| -1|  9| -3|
|G  |  0| -2| -3|  6|

### Example 2. How to find the most *'different'* k-mer from the given set of k-mers?

In this example we will try to find the most different k-mer to "GATTACA" sequence from given set of heptamers. Here, 7 heptamer (being an anagram of the movie title "GATTACA") are given, as follow:  


```r
# Given hexamers
  kmers_given <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
# Matrix calculation 
  result <- kmeRs_similarity_matrix(kmers_given = c("GATTACA"), compare_to = kmers_given , submat = "BLOSUM62") 
# Fancy knitr table
  knitr::kable(result) 
```



|        | GATTACA|
|:-------|-------:|
|GATTACA |      37|
|ACAGATT |       1|
|GAATTAC |      15|
|GAAATCT |      19|
|CTATAGA |       7|
|GTACATA |      12|
|AACGATT |       4|

Now, applying function **kmeRs_score_and_sort** let's score the matrix and sort by decreasing score value. The lowest value (in case of BLOSUM) indicates the most 'different' sequence from given k-mers, in contrast to the highest value which indicates the most similar one. 


```r
# Score and sort the matrix  
  result <- kmeRs_score_and_sort(result)
# Fancy knitr table
  knitr::kable(result)
```



|        | GATTACA| score_global|
|:-------|-------:|------------:|
|ACAGATT |       1|            1|
|AACGATT |       4|            4|
|CTATAGA |       7|            7|
|GTACATA |      12|           12|
|GAATTAC |      15|           15|
|GAAATCT |      19|           19|
|GATTACA |      37|           37|

As can be observed above, the most *'different'* sequence to GATTACA is ACAGATT with score equal to 1 and the most similar to GATTACA  sequence is of course GATTACA sequence with the highest score equal to 37. 

### Example 3. How to find the most *'different'* k-mer comparing to the whole given set of k-mers? 

In this example we will try to find the most different k-mer from the whole given set of heptamers. Here, 7 heptamer (being an anagram of movie title "GATTACA" ) are given, as follow: 


```r
# Given hexamers
  kmers_given <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
# Matrix calculation 
  result <- kmeRs_similarity_matrix(kmers_given = kmers_given, submat = "BLOSUM62")
# Score the matrix and sort by decreasing score 
  result <- kmeRs_score_and_sort(result)
# Fancy knitr table
  knitr::kable(result)
```



|        | GATTACA| ACAGATT| GAATTAC| GAAATCT| CTATAGA| GTACATA| AACGATT| score_global|
|:-------|-------:|-------:|-------:|-------:|-------:|-------:|-------:|------------:|
|CTATAGA |       7|       3|       6|      -2|      37|      11|       0|           62|
|AACGATT |       4|      24|       1|       8|       0|       6|      37|           80|
|ACAGATT |       1|      37|       1|       8|       3|       9|      24|           83|
|GAATTAC |      15|       1|      37|      18|       6|       9|       1|           87|
|GTACATA |      12|       9|       9|       9|      11|      37|       6|           93|
|GATTACA |      37|       1|      15|      19|       7|      12|       4|           95|
|GAAATCT |      19|       8|      18|      37|      -2|       9|       8|           97|

As can be observed, the most *'different'* sequence to all given heptamers is CTATAGA with score equal to 62 and the most similar sequence is GAAATCT with the highest score equal to 97.

### Example 4. How to calculate basic statistics for the matrix?

Applying function **kmeRs_statistics** to the result matrix in example 3, we can calculate the basic statistics as additional columns to the matrix. When **summary_statistics_only** is set to TRUE only summary table is shown. It is much more elegant way to present results, especially in case of big data output.  


```r
# Score the matrix and sort by decreasing score 
  result <- kmeRs_statistics(result)
# Fancy knitr table
  knitr::kable(result[ , 1:(length(result[1, ])-4)])
```



|        | GATTACA| ACAGATT| GAATTAC| GAAATCT| CTATAGA| GTACATA| AACGATT| score_global|
|:-------|-------:|-------:|-------:|-------:|-------:|-------:|-------:|------------:|
|CTATAGA |    7.00|    3.00|    6.00|   -2.00|   37.00|   11.00|    0.00|        62.00|
|AACGATT |    4.00|   24.00|    1.00|    8.00|    0.00|    6.00|   37.00|        80.00|
|ACAGATT |    1.00|   37.00|    1.00|    8.00|    3.00|    9.00|   24.00|        83.00|
|GAATTAC |   15.00|    1.00|   37.00|   18.00|    6.00|    9.00|    1.00|        87.00|
|GTACATA |   12.00|    9.00|    9.00|    9.00|   11.00|   37.00|    6.00|        93.00|
|GATTACA |   37.00|    1.00|   15.00|   19.00|    7.00|   12.00|    4.00|        95.00|
|GAAATCT |   19.00|    8.00|   18.00|   37.00|   -2.00|    9.00|    8.00|        97.00|
|Min     |    1.00|    1.00|    1.00|   -2.00|   -2.00|    6.00|    0.00|        62.00|
|Max     |   37.00|   37.00|   37.00|   37.00|   37.00|   37.00|   37.00|        97.00|
|Mean    |   13.57|   11.86|   12.43|   13.86|    8.86|   13.29|   11.43|        85.29|
|Sd      |   12.08|   13.64|   12.62|   12.40|   13.16|   10.63|   13.83|        12.04|

## References
