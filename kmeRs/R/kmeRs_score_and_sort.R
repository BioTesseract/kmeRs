#' @title Score And Sort The Similarity Matrix
#'
#' @description
#' The \code{kmeRs_score_and_sort} function sums the partial scores and sort the data.frame
#' to indicate the most 'different' k-mers
#'
#' @aliases kmeRs_score_and_sort
#'
#' @param kmeRs_similarity_matrix the similarity matrix calculated by \code{kmeRs_similarity_matrix} function
#'
#' @return sorted similarity matrix with global.score column added; is returned as a data.frame
#'
#' @examples
#' # Calculate the example BLOSUM62 matrix and score the result
#'
#' example <- kmeRs_similarity_matrix(kmers_given = c("A", "T", "C", "G"), submat = "BLOSUM62")
#' kmeRs_score_and_sort(example)
#'
#' @export


  kmeRs_score_and_sort <- function(kmeRs_similarity_matrix){

    # Calculate the total score

      score_total <- apply(kmeRs_similarity_matrix, 1, sum)
      kmeRs_similarity_matrix <- cbind(kmeRs_similarity_matrix, score_total)

    # Sort by scoring

      kmeRs_similarity_matrix <- kmeRs_similarity_matrix[order(kmeRs_similarity_matrix$score_total, decreasing = FALSE), ]

    # Return matrix

    return(kmeRs_similarity_matrix)

}
