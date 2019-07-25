rm(list=ls())
library(DESeq2)
## load file int a matrix
expMatrix <- read.csv('D:\\transcriptLevelAnalysis\\quautity\\transcript_count_matrix.csv',
                      sep = ',',header = 1,row.names = 1)
## filter low expressed transcripts by rowSums function
bNoSum0 <- expMatrix[rowSums(expMatrix)>0,]
## grouping. eg: treated or untreated
condition = c('EH','R','EH',rep('R',3),'EH','R',rep('EH',2))
cFactor <- factor(condition)
colData <- data.frame(row.names = colnames(expMatrix),cFactor)
## read data into a DEseq objective of dds.
dds <- DESeqDataSetFromMatrix(countData = bNoSum0, colData, 
                              design = ~cFactor)
## DEseq analysis result to dds2 objective.
dds2=DESeq(dds)
res <-  results(dds2, contrast=c("cFactor",'EH','R'))
## reoder result by padj value.
resOrder <- res[order(res$padj),]
result_EH_R <- as.data.frame(resOrder)
print(summary(res))
## write results to a csv format file.
write.csv(result_EH_R,file='D:\\transcriptLevelAnalysis\\quautity\\Deseqres.csv',quote = F)


