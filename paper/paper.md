---
title: '``kmeRs``: K-Mers Similarity Score Matrix'
authors:
- affiliation: '1'
  name: Rafal Urniaz
  orcid: 0000-0003-0192-2165
date: "26 August 2019"
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

# Introduction 

Sequencing is the general term for any technique designed to determine the order of nucleotides in a nucleic acid molecule. Because nucleotide sequences are ultimately translated into cellular processes, sequencing technology has played a central role in biological research for decades. A genome is an organism’s complete set of DNA, including all of its genes. Each genome contains all of the information needed to build and maintain that organism. [@GENOME] A gene is the basic physical and functional unit of heredity. Genes are made up of DNA. Some genes act as instructions to make molecules called proteins. [@GENE] Every person has two copies of each gene, one inherited from each parent. Most genes are the same in all people, but a small number of genes (less than 1 percent of the total) are slightly different between people. Alleles are forms of the same gene with small differences in their sequence of DNA bases. These small differences contribute to each person’s unique physical features. [@Whatisagene] Sequence similarity, for example when comparing different alleles, is a measure of an empirical relationship between sequences. A common objective of sequence similarity calculations is establishing the likelihood for sequence homology. A measure of sequence homology can be expressed by similarity score.[@ss]

# Similarity score and purpose for the kmeRs package 

A similarity score is aimed to approximate the evolutionary distance between a pair of nucleotide or protein sequences. Many implementations for measuring sequence similarity exist [@ss], where a general aim is to infer structural or functional characteristics of an unannotated molecular sequence. Sequence similarity searching is the most widely used, and most reliable, strategy for characterizing newly determined sequences. Sequence similarity searches can identify ”homologous” proteins or genes by detecting excess similarity – statistically significant similarity that reflects common ancestry. The similarity comparison cane be done at a number of levels, including genomes, genes, alleles, or even smaller like *k*-mers. In computational science, the *k*-mer term typically refers to all the possible substrings of length *k* that are contained in a given string. In life science (computational genomics) *k*-mers refer to all the possible subsequence (of length *k*) from reads obtained through the sequencing. [@lee01] The ``KmeRs`` package contains tools to calculate similarity score matrix for DNA k-mers. The pairwise similarity score is calculated using PAM or BLOSUM substitution matrix. The results are evaluated by similarity score calculated by Needleman-Wunsch (global) [@NEEDLEMAN01] or Smith-Waterman (local) alignment.[ @SMITH01] Higher similarity score indicates more similar sequences for BLOSUM and less similar sequences for PAM matrix; 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for PAM and BLOSUM, respectively. Referring to other tools [@DESANTIS01, @ss, @JEH01], ``KmeRs`` package [@urniaz01] provides a simplified tool to calculate effectively similarity score matrix for DNA *k*-mers. When combined with dedicated visualization Python package ``heatmap4kmers`` [@urniaz02] is a comprehensive way to calculate and present results (Figure 1).


![The pairwise similarity score matrix for 7 heptamers being an anagram of the movie title "GATTACA". Higher similarity score indicates more similar sequences.](Figure_1.png)

# Acknowledgment

This work was partially conducted when working at University of Cambridge, UK

# References
