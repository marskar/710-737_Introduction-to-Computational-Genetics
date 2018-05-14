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
# Hits object with 203719 hits and 0 metadata columns:
#            queryHits subjectHits
#            <integer>   <integer>
#        [1]         1       11645
#        [2]         1       11646
#        [3]         1       11647
#        [4]         1       17861
#        [5]         2           6
#        ...       ...         ...
#   [203715]      6189       19614
#   [203716]      6189       19615
#   [203717]      6189       19616
#   [203718]      6189       19617
#   [203719]      6189       19618
#   -------
#   queryLength: 6189 / subjectLength: 22093
sel <- unique(from(ovl))
genesovl <- genes[sel,]
nrow(genesovl)

#It appears that 6140 genes overlaps overlap nucleosome free regions

