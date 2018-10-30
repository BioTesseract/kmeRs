#' @title Calculate And Add Basic Statistics To The K-mers Similarity Matrix
#'
#' @description
#' The \code{kmeRs_statistics} function calculates basic statistics and returns the similarity matrix
#' with calculated results or summarized table with statistics only when summary_statistics_only
#' is set to TRUE
#'
#' @aliases kmeRs_statistics
#'
#' @param kmeRs_similarity_matrix matrix calculated by \code{kmeRs_similarity_matrix} function
#' @param summary_statistics_only when parameter is set to TRUE only the summarized table with
#' statistics is returned
#'
#' @return data.frame with results
#'
#' @export


  kmeRs_statistics <- function(kmeRs_similarity_matrix, summary_statistics_only = FALSE){

    kmeRs_similarity_matrix_temp <- kmeRs_similarity_matrix

    col.count <- length(kmeRs_similarity_matrix[ , 1]) + 1
    row.count <- length(kmeRs_similarity_matrix[ 1, ]) + 1

  # -- 1st -- Calculate the stats for rows and add columns for min, max, mean etc.

      # Ignore score column if exists
      score_column_exists <- which(colnames(kmeRs_similarity_matrix) == 'score_total')

        if (score_column_exists > 0){

          kmeRs_similarity_matrix_temp <- kmeRs_similarity_matrix[ , - score_column_exists]

        }

      Min  <- apply(kmeRs_similarity_matrix_temp, 1, min)
      Max  <- apply(kmeRs_similarity_matrix_temp, 1, max)
      Mean <- apply(kmeRs_similarity_matrix_temp, 1, mean)
      Sd   <- apply(kmeRs_similarity_matrix_temp, 1, stats::sd)

      kmeRs_similarity_matrix <- cbind(kmeRs_similarity_matrix, data.frame(Min, Max, Mean, Sd))

  # -- 2nd -- Calculate the stats for cols and add rows for min, max, mean etc.

      Min  <- apply(kmeRs_similarity_matrix, 2, min)
      Max  <- apply(kmeRs_similarity_matrix, 2, max)
      Mean <- apply(kmeRs_similarity_matrix, 2, mean)
      Sd   <- apply(kmeRs_similarity_matrix, 2, stats::sd)

      kmeRs_similarity_matrix <- rbind(kmeRs_similarity_matrix, t(data.frame(Min, Max, Mean, Sd)))
      kmeRs_similarity_matrix <- round(kmeRs_similarity_matrix, 2)

  # -- 3rd -- Add results to matrix or prepare a summary table

      if (summary_statistics_only == TRUE){

        kmeRs_similarity_matrix <- kmeRs_similarity_matrix[row.count:length(kmeRs_similarity_matrix[1, ])-1, col.count:length(kmeRs_similarity_matrix[ ,1])]

      }

    return(kmeRs_similarity_matrix)

 }
