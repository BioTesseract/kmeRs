#' @title Simple Demo For KmeRs Package
#'
#' @description
#' The \code{kmeRs_test_package} function calculates and shows an example report of
#' the kmeRs package for sample given k-mers: "ATA", "CGC", "TGC", "GGA"
#'
#' @aliases kmeRs_test_package
#'
#' @return example report
#'
#' @export


  kmeRs_test_package <- function(){

    # Sample k-mers
    kmers_given <- c("ATA", "CGC", "TGC", "GGA")

    # Calculate similarity matrix
    kmeRs_test_matrix <- kmeRs_similarity_matrix(kmers_given, k = 1, submat = "BLOSUM62", save_to_file = '')

    # Score and sort the Similarity Matrix
    kmeRs_test_matrix <- kmeRs_score_and_sort(kmeRs_test_matrix)

    # Calculate and add basic statistics to the similarity matrix
    kmeRs_test_matrix <- kmeRs_statistics(kmeRs_test_matrix, summary_statistics_only = FALSE)

    # Show example alignment
    print("Example result of the kmeRs_show_alignment() function")
    print(kmeRs_show_alignment( kmer_A = "AAATTTCCCGGG", kmer_B = "TCACCC" ,submat = "BLOSUM62"))

    print("Example analysis for sample kmers_given :")
    print(paste(kmers_given))

    return(kmeRs_test_matrix)

}
