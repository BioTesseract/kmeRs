
#' (C) Rafal Urniaz
#' Generate a pairwise similarity matrix for DNA k-mers using BLOSUM62 matrix; sum the elementary score in additional column and return the matrix.
#' @param hexamers_given_f list of given k-mers
#' @param k length of k-mers to calculate similarity , equal or less than given k-mers length
#' @return similarity matrix



hexamers.scoring.matrix <- function(hexamers_given_f, k = 6, save_to_file = '' ){
  
  # Generate all possible k-mers from DNA alphabet
  hexamers.all <- generate.kmers(.k = k, .seq = '', .alphabet = c('A', 'C', 'G', 'T'))
  
  
## -- Prepare matrix --
  
  hexamers.dist.matrix <- matrix(NA, ncol = length(hexamers_given_f), nrow = length(hexamers.all))
  
  # Trim to do not calculate 2 times the same, comparison of A to B and B to A are equal 
  # hexamers.dist.matrix <- lower.tri(hexamers.dist.matrix, diag = FALSE) # To-DO: Better function should be applied
  
  # Set cols and rows names
  hexamers.dist.matrix <- data.frame(hexamers.dist.matrix, row.names = hexamers.all)
  colnames(hexamers.dist.matrix) <- hexamers_given_f
  
  # Check structure
  #head(hexamers.dist.matrix)
  
## -- Calculate the distance matrix -- TO-DO: Optimise performance - parallel calculations, packages like doParallel and foreach
  
  for (col in 1:length(hexamers.dist.matrix[1, ])){
    
    for (row in 1:length(hexamers.dist.matrix[, 1])){
      
      seqA <- colnames(hexamers.dist.matrix)[col]
      seqB <- rownames(hexamers.dist.matrix)[row]
      
      hexamers.dist.matrix[row, col] <- twoSeqSim(seqA, seqB, type = "global")@score #BLOSUM62 matrix - more precise method should be applied 
      
    }
  }
  
## -- Find the most different sequence from the set  --
  
  # Calculate the global score 
  
  score.global <- apply(hexamers.dist.matrix, 1, sum)
  
  hexamers.dist.matrix <- cbind(hexamers.dist.matrix, score.global)
  
  # Sort by scoring
  hexamers.dist.matrix <- hexamers.dist.matrix[order(hexamers.dist.matrix$score.global, decreasing = FALSE), ]
  
  # Check results
  #head(hexamers.dist.matrix, 10)  
  
  if (save_to_file > ''){
    
    # Save when calculated - step backup - 
    write.csv2(hexamers.dist.matrix, save_to_file )
    
  }
  
  #return matrix
  return(hexamers.dist.matrix)
  
}
