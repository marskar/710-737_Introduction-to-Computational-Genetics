source("http://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
library("GenomicRanges")

genes <- read.table("scer_gene_fixed.md", stringsAsFactors=F)
nucfree <- read.table("nucleosome_free_regions_in_the_yeast_genome_lee.txt", stringsAsFactors=F, header = TRUE)

gstarts <- genes[genes$V12=="GENE", 3]
gends <- genes[genes$V12=="GENE", 4]
genesIR <- IRanges(start=gstarts, end=gends)

nucfreeIR <- IRanges(start=nucfree[,2], end=nucfree[,3])

ovl <- findOverlaps(query = genesIR, subject = nucfreeIR)
sel <- unique(from(ovl))
genesovl <- genes[sel,]
nrow(genesovl)

#It appears that 6140 genes overlaps overlap nucleosome free regions

