#' @title Generate a k-mer similarity score heatmap
#'
#' @description
#' The \code{kmeRs_heatmap} function makes a heatmap (placeholder ATM)
#'
#' @aliases kmeRs_heatmap
#'
#' @param kmeRs_similarity_matrix matrix calculated by \code{kmeRs_similarity_matrix} function
#' @param summary_statistics_only when parameter is set to TRUE only the summarized table with
#' statistics is returned
#'
#' @return data.frame with results
#'
#' @examples
#' # Use RColorBrewer to generate a figure similar to publication
#' library(RColorBrewer)
#' h.palette <- rev(brewer.pal(9, "YlGnBu"))
#' q0 <- c("GATTACA", "ACAGATT", "GAATTAC", "GAAATCT", "CTATAGA", "GTACATA", "AACGATT")
#' example <- kmeRs_similarity_matrix(q0, submat = "BLOSUM62")
#' kmeRs_heatmap(kmeRs_score(example), col = h.palette)
#'
#' @export
kmeRs_heatmap <- function(x, cexRow = NULL, cexCol = NULL, col = NULL) {
	x.exclude <- c("Min", "Max", "Mean", "SD")
	x <- x[!(rownames(x) %in% x.exclude),]
	x <- x[,(!colnames(x) %in% x.exclude)]
	
	cex.row <- .2 + 1/log10(dim(x)[1])
	cex.col <- .2 + 1/log10(dim(x)[2])
	cex.all <- min(1, cex.row, cex.col)
	if (is.null(cexRow)) {
		cexRow <- cex.all
	}
	if (is.null(cexCol)) {
		cexCol <- cex.all
	}
	if (is.null(col)) {
		col <- colorRampPalette(c("blue4", "aquamarine3", "chartreuse3"))(256)
	}
	heatmap(as.matrix(x), scale = "none", col = col, 
		cexRow = cexRow, cexCol = cexCol)
}