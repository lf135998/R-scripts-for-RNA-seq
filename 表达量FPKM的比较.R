rm(list = ls())
par(mfrow=c(2,2))
mRNAFPKM = read.csv('D:\\transcriptLevelAnalysis\\comparelncRNAmRNA\\proteinCodingfilterF0.FPKM',
                    header = F,row.names = 1,sep = '\t')
colnames(mRNAFPKM)=paste0(rep('S',10),c(seq(12,18),20,21,22))
lncRNAFPKM = read.csv('D:\\transcriptLevelAnalysis\\comparelncRNAmRNA\\allLncF0.5.FPKM',
                      header = F,row.names = 1,sep = '\t')
colnames(lncRNAFPKM)=colnames(mRNAFPKM)
boxplot(log10(lncRNAFPKM+1),col=c(rep('royalblue',5),rep('royalblue4',5)),
        ylab='log10(FPKM+1)',xlab='samples ID',
        cex.lab=1.5,cex.axis=1.2,
        main='lncRNA expression level')
boxplot(log10(mRNAFPKM+1),col=c(rep('orangered',5),rep('orangered4',5)),
        ylab='log10(FPKM+1)',xlab='samples ID',
        cex.lab=1.5,cex.axis=1.2,
        main='lncRNA expression level')
a = unlist(as.list(mRNAFPKM))
b = unlist(as.list(lncRNAFPKM))
boxplot(log10(b+1),log10(a+1),col = c('royal blue','orangered'),names = c('lncRNA','mRNA'),
        varwidth = F,ylab='log10(FPKM+1)',xlab='type of RNA',cex.lab=1.5,cex.axis=1.5,
        main='expression levels comparing')

