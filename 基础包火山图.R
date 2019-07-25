rm(list =ls())
DE = read.csv('D:\\transcriptLevelAnalysis\\quautity\\proteinCodingfilterF0DEseqres.csv',header = F,row.names  = 1)
x = DE$V3
y = -1*log10(DE$V7)
color_vec= rep('gray',length(x))
## set color by x axis value
color_vec[x >1 & y >(log10(0.05)*-1)] = 'firebrick2'
## set color by y axis value
color_vec[x <(-1) & y >(log10(0.05)*-1)] = 'royal blue'
par(mar=c(6, 5, 2, 1.4))
## plot
plot(x,y,pch=20,cex=0.7,col=color_vec,xaxt='n',yaxt='n',
     ylim = c(0,8),xlim = c(-4,4),
     xlab = 'log2 (Fold_Change)',
     ylab = '-log10 (padj)',
     cex.lab = 1.5,
     main = 'Volcano plot of mRNAs expression (EH vs R)',cex.main=0.8
)
## x axis set 
axis(side = 1,at=c(-4,-2,-1,0,1,2,4),labels = c('-4','-2','-1','0','1','2','4'))
## y axis set
axis(side = 2,at=c(0,-log10(0.05),2,4,6,8),labels = c('0','p=0.05','2','4','6','8'))
## abline fold-change threshold lines
abline(v=-1,lty=2)
abline(v=1,lty=2)

## abline p-adj threshold line
abline(h= -log10(0.05),lty=2)

