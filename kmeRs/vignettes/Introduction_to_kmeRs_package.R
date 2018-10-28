## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Import the package 
  library(kmeRs)

## ------------------------------------------------------------------------
# Simple BLOSUM62 similarity matrix for all DNA nucleotides
  result <- kmeRs_similarity_matrix(kmers_given = c("A", "T", "C", "G"), submat = "BLOSUM62")
# Fancy knitr table
  knitr::kable(result)

## ------------------------------------------------------------------------
# Given hexamers
  kmers_given <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
# Matrix calculation 
  result <- kmeRs_similarity_matrix(kmers_given = c("GATTACA"), compare_to = kmers_given , submat = "BLOSUM62") 
# Fancy knitr table
  knitr::kable(result) 

## ------------------------------------------------------------------------
# Score the matrix  
  result <- kmeRs_score_and_sort(result)
  result <- result[ , "GATTACA"]
# Fancy knitr table
  knitr::kable(result)

## ------------------------------------------------------------------------
# Given hexamers
  kmers_given <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
# Matrix calculation 
  result <- kmeRs_similarity_matrix(kmers_given = kmers_given, submat = "BLOSUM62")
# Fancy knitr table
  knitr::kable(result)

## ------------------------------------------------------------------------
# Score the matrix  
  result <- kmeRs_score_and_sort(result)
# Fancy knitr table
  knitr::kable(result)

## ------------------------------------------------------------------------

  library(kmeRs)
  knitr::kable(kmeRs_test_package())


