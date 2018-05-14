source("http://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
library("GenomicRanges")

genes <- read.table("scer_gene_fixed.md", stringsAsFactors=F)
nucfree <- read.table("nucleosome_free_regions_in_the_yeast_genome_lee.txt", stringsAsFactors=F, header = TRUE)

head(genes)
gstarts <- genes[genes$V2==11 & genes$V12=="GENE", 3]
gends <- genes[genes$V2==11 & genes$V12=="GENE", 4]
genesIR <- IRanges(start=gstarts, end=gends)

head(nucfree)
nucfreeIR <- IRanges(start=nucfree[,2], end=nucfree[,3])

length(countOverlaps(query = genesIR, subject = nucfreeIR))

ovl <- findOverlaps(query = genesIR, subject = nucfreeIR)
sel <- unique(from(ovl))
genesovl <- genes[sel,]
nrow(genesovl)

#It does not appear that 328 genes overlaps overlap nucleosome free regions

