

hexamers.transcript_to_complementary <- function(hexamers.given){
  
 new_all <- NULL
 
 for (a in 1:length(hexamers.given)){  
   
   kmer <- hexamers.given[a]
   
   new <- NULL
  
    for (i in 1:nchar(kmer)){
    
      letter <- substr(kmer, i, i)
    
      # A -> T
      if (toupper(letter) == "A") new <- paste(new, "T", sep="") 
    
      # T -> A
      if (toupper(letter) == "T") new <- paste(new, "A", sep="") 
    
      # C -> G
      if (toupper(letter) == "C") new <- paste(new, "G", sep="") 
    
      # G -> C
      if (toupper(letter) == "G") new <- paste(new, "C", sep="") 
      
    }
   
   new_all <- c(new_all, new)
   
  }  
  
  return(new_all) 

  
}