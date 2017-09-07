setwd("/home/hlzi/project/HMZ_20170704_methylation/BSMAP_result")
library(ChIPpeakAnno)
library(GenomicRanges)
library(GenomicFeatures)
library(rtracklayer)

gtf<-system.file("GFF_file", "Arabidopsis_thaliana.TAIR10.36.gtf", package="ChIPseeker")
TxDb.gr3<-makeTxDbFromGFF(gtf, format="gtf")

require(ChIPseeker)
anno = function(DMR_list){
	peak<-readPeakFile(DMR_list)
	peakAnno <- annotatePeak(peak, tssRegion=c(-3000, 3000), TxDb=TxDb.gr3)
	pdf(paste0(DMR_list,".pdf"))
	plotAnnoPie(peakAnno)
	dev.off()
	write.table(as.data.frame(peakAnno), file=paste0(DMR_list,".txt"),quote = FALSE,row.names = FALSE,sep="\t")
	}

anno()
