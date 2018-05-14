#read in data
starts <- read.table("WJHtrim30summary.tsv", stringsAsFactors=FALSE, header = FALSE) 

#remove zeros
starts <- starts[starts$V2!=0,]

#make histogram
hist(starts$V2, xlab = "Start Positions", main = "Frequency of Start Positions on Chromosome 19")
pdf(file = "hist.pdf")
