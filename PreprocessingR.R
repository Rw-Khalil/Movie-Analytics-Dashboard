# Preprocessing
options(max.print = 5000000)

#check for N/A values
is.na(Movies.IMDB)

#Remove any N/A values
Movies.IMDB$overview <- as.character(Movies.IMDB$overview)
Movies.IMDB[Movies.IMDB == ""] <- NA        
colSums(is.na(Movies.IMDB))
Movies.IMDB$V14[is.na(Movies.IMDB$V14)] <- "Unknown"
Movies.IMDB$V16[is.na(Movies.IMDB$V16)] <- "Unknown"
Movies.IMDB$V17[is.na(Movies.IMDB$V17)] <- "Unknown"
Movies.IMDB$V18[is.na(Movies.IMDB$V18)] <- "Unknown"
Movies.IMDB$V19[is.na(Movies.IMDB$V19)] <- "Unknown"
Movies.IMDB$V23[is.na(Movies.IMDB$V23)] <- 0
Movies.IMDB$V24[is.na(Movies.IMDB$V24)] <- "Unknown"
Movies.IMDB$V25[is.na(Movies.IMDB$V25)] <- 0
Movies.IMDB$V26[is.na(Movies.IMDB$V26)] <- 0
Movies.IMDB$V27[is.na(Movies.IMDB$V27)] <- "Unknown"
Movies.IMDB$V28[is.na(Movies.IMDB$V28)] <- "Unknown"
Movies.IMDB$V29[is.na(Movies.IMDB$V29)] <- "Unknown"
Movies.IMDB$V30[is.na(Movies.IMDB$V30)] <- "Unknown"
Movies.IMDB$V31[is.na(Movies.IMDB$V31)] <- "Unknown"
Movies.IMDB$V32[is.na(Movies.IMDB$V32)] <- "Unknown"
Movies.IMDB$V33[is.na(Movies.IMDB$V33)] <- "Unknown"
Movies.IMDB$V34[is.na(Movies.IMDB$V34)] <- "Unknown"

#check for duplicates
duplicated(Movies.IMDB)          
sum(duplicated(Movies.IMDB)) 

#adult encoding
Movies.IMDB$V9 = factor(Movies.IMDB$V9, levels = c('FALSE', 'TRUE'), labels = c(0,1))

write.csv(Movies.IMDB, "C:/Users/ACER/Desktop/Movies-IMDB.csv", row.names = FALSE)
