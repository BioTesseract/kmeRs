#' @title Calculate and Show Alignment Between Two Compared K-mers
#'
#' @description
#' The \code{kmeRs_show_alignment} function aligns and shows calculated alignment between two DNA or RNA sequences
#'
#' @aliases kmeRs_show_alignment
#'
#' @param kmer_A given k-mer A
#' @param kmer_B given k-mer B
#' @param submat substitution matrix version, default is 'BLOSUM62'; could be one of 'BLOSUM45', 'BLOSUM50', 'BLOSUM62', 'BLOSUM80',
#' 'BLOSUM100', 'PAM30', 'PAM40', 'PAM70', 'PAM120', 'PAM250'
#'
#' @return alignment is returned as a data.frame
#'
#' @examples
#' # Example alignment
#'
#' kmeRs_show_alignment( kmer_A = "AAATTTCCCGGG", kmer_B = "TCACCC" ,submat = "BLOSUM62")
#'
#' @export


  kmeRs_show_alignment <- function(kmer_A ='', kmer_B = '', submat = 'BLOSUM62'){

    alignment <- rDNAse::twoSeqSim(kmer_A, kmer_B, type = "global", submat = submat)

    # Make it fancy for markdown

    alignment_dataframe <- data.frame(matrix(nrow = 2, ncol = 2), row.names = c("Sequence A","Sequence B"))
    colnames(alignment_dataframe) <- c("Alignment","Score")

    alignment_dataframe[1,1] <- as.character(alignment@pattern)
    alignment_dataframe[2,1] <- as.character(alignment@subject)

    alignment_dataframe[c(1,2),2] <- as.character(alignment@score)

    return(alignment_dataframe)

}
