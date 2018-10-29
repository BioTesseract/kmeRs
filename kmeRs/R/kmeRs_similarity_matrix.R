#' @title Pairwise Similarity Matrix
#'
#' @description
#' The \code{kmeRs_similarity_matrix} function generates a pairwise similarity score
#' matrix for for k length given k-mers vs. all possible k-mers combination.
#' The pairwise similarity score is calculated using PAM or BLOSUM substitution matrix;
#' 30, 40, 70, 120, 250 and 62, 45, 50, 62, 80, 100 matrix versions are available for
#' PAM or BLOSUM, respectively. The results are evaluated by global similarity score;
#' higher similarity score indicates more similar sequences for BLOSUM and opposite for
#' PAM matrix.
#'
#' @aliases kmeRs_similarity_matrix
#'
#' @param kmers_given vector with given k-mers
#' @param compare_to this parameter can have 3 different states, when:
#' '' - the \code{kmers_given} will be compared to each other, default value;
#' ALL -  the \code{kmers_given} will be compared to all possible combinations given by k parameter e.g. N= 4^6 = 4096 combinations for 6-mers;
#' 3rd option is to provide a list of k-mers which should be compared with the set given by the \code{kmers_given} parameter
#' @param k length of k-mers to calculate similarity matrix, higher values may slow down the computer, default value is k=3
#' @param alignment_type type of alignment, default is 'global', could be 'local' or 'global', where 'global' represents
#' Needleman-Wunsch global alignment; 'local' represents Smith-Waterman local alignment.
#' @param submat substitution matrix, default is 'BLOSUM62', but could be one of 'BLOSUM45', 'BLOSUM50', 'BLOSUM62', 'BLOSUM80',
#' 'BLOSUM100', 'PAM30', 'PAM40', 'PAM70', 'PAM120', 'PAM250'
#' @param save_to_file directory and file name; if value is declared the matrix will be saved to the given file name
#'
#' @return similarity matrix is returned as a data.frame
#'
#' @importFrom rDNAse twoSeqSim
#' @importFrom utils write.csv2
#' @importFrom tcR generate.kmers
#' @importFrom Biostrings score
#'
#' @export


 kmeRs_similarity_matrix <- function(kmers_given, compare_to = '', alignment_type = "global", k = 3, submat = "BLOSUM62", save_to_file = '' ){

  # Avoid case-sensitive errors

    kmers_given <- toupper(kmers_given)

  # Compare to the same set by default

    if (compare_to[1] == ''){

      compare_to <- kmers_given

    }

  # If compare_to_all == TRUE - Generate all possible k-mers from DNA alphabet

    if (compare_to[1] == 'ALL'){

      compare_to <- tcR::generate.kmers(.k = k, .seq = '', .alphabet = c('A', 'C', 'G', 'T'))

    }

  ## -- Prepare matrix --

    kmers_dist_matrix <- matrix(NA, ncol = length(kmers_given), nrow = length(compare_to))

  # Set cols and rows names

    kmers_dist_matrix <- data.frame(kmers_dist_matrix, row.names = compare_to)
    colnames(kmers_dist_matrix) <- kmers_given


  ## -- Calculate the distance matrix -- TO-DO: Optimise performance - parallel calculations, packages like doParallel and foreach

    for (col in 1:length(kmers_dist_matrix[1, ])){

      for (row in 1:length(kmers_dist_matrix[, 1])){

        seqA <- colnames(kmers_dist_matrix)[col]
        seqB <- rownames(kmers_dist_matrix)[row]

        kmers_dist_matrix[row, col] <- Biostrings::score(rDNAse::twoSeqSim(seqA, seqB, type = "global", submat = submat))  # TO-DO: more precise method may be applied

      }
    }

  # Save to the file if requested

  if (save_to_file > ''){

    utils::write.csv2(kmers_dist_matrix, save_to_file)

  }

  # Return matrix

    return(kmers_dist_matrix)

}
