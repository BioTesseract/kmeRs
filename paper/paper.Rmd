---
title: 'kmeRs: K-Mers Similarity Score Matrix'
authors:
- affiliation: '1'
  name: Rafal Urniaz, PhD
  orcid: 0000-0003-0192-2165
date: "23 August 2019"
output: pdf_document
bibliography: paper.bib
tags:
- Similarity Score Matrix
- K-Mers
- Bioinformatics
- R package
affiliations:
- index: 1
  name: BioTesseract Ltd. Cambridge R&D, Cambridge Biomedical Campus, Cambridge, UK
---

# Summary

In computational science, the *k*-mer term typically refers to all the possible substrings of length *k* that are contained in a given string. In life science (computational genomics) *k*-mers refer to all the possible subsequence (of length *k*) from reads obtained through the DNA/RNA sequencing. KmeRs package [@urniaz01] provides tools to calculate effectively similarity score matrix for DNA *k*-mers. When combined with dedicated visualization Python package heatmap4kmers [@urniaz02] is a comprehensive way to calculate and present results (Picture 1).

-![Picture 1. The pairwise similarity score matrix for 7 heptamers being an anagram of the movie title "GATTACA". Higher similarity score indicates more similar sequences.](Figure_1.png)

# Acknowledgment

This work was partially conducted when working at University of Cambridge, UK

# References
