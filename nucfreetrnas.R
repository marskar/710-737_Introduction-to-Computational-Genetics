source("http://bioconductor.org/biocLite.R")
biocLite("GenomicRanges")
library("GenomicRanges")

trnas <- read.table("trnaonly.md", stringsAsFactors=F)
nucfree <- read.table("nucleosome_free_regions_in_the_yeast_genome_lee.txt", stringsAsFactors=F, header = TRUE)

tstarts <- trnas[, 3]
tends <- trnas[, 4]
trnasIR <- IRanges(start=tstarts, end=tends)

nucfreeIR <- IRanges(start=nucfree[,2], end=nucfree[,3])

ovl <- findOverlaps(query = trnasIR, subject = nucfreeIR)
# Hits object with 1201 hits and 0 metadata columns:
#          queryHits subjectHits
#          <integer>   <integer>
#      [1]         1         295
#      [2]         1        4585
#      [3]         1       11528
#      [4]         1       18156
#      [5]         1       20574
#      ...       ...         ...
#   [1197]       254       19453
#   [1198]       255        7733
#   [1199]       255       11077
#   [1200]       256        4210
#   [1201]       256       19494
#   -------
#   queryLength: 256 / subjectLength: 22093
sel <- unique(from(ovl))
genesovl <- trnas[sel,]
nrow(genesovl)

#It appears that 253 trnas overlaps overlap nucleosome free regions

