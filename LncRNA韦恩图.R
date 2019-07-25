rm(list=ls())
par(mfrow=c(2,2))
library(VennDiagram)
## import files, every file keep containning only one column.
cpc <- read.csv('D:\\transcriptLevelAnalysis\\lncRNAIdentification\\codingAbility\\cpc.noncoding',header = F)
v_cpc <- cpc$V1
cnci <- read.csv('D:\\transcriptLevelAnalysis\\lncRNAIdentification\\codingAbility\\cnci.noncoding',header = F)
v_cnci <- cnci$V1
cpat <- read.csv('D:\\transcriptLevelAnalysis\\lncRNAIdentification\\codingAbility\\cpat.noncoding',header = F)
v_cpat <- cpat$V1
plek <- read.csv('D:\\transcriptLevelAnalysis\\lncRNAIdentification\\codingAbility\\plek.noncoding',header = F)
v_plek <- plek$V1
pfam <- read.csv('D:\\transcriptLevelAnalysis\\lncRNAIdentification\\codingAbility\\pfamscan.noncoding',header = F)
v_pfam <- pfam$V1
## dawing
venn.diagram(x=list(CPC2=v_cpc,CNCI=v_cnci,CPAT=v_cpat,PLEK=v_plek,Pfam=v_pfam),
             imagetype='svg',
             filename = 'C:/Users/dklly/Desktop/vn.svg',
             height = 8, width = 8,resolution =1000, 
             col="black",
             fill=c("#D90368","#27A22B","#E58122","#BD2A46","yellow"),
             alpha = 0.5, cex=1.7, cat.cex=2,lty="dotted",lwd = 2,
             margin = 0.2
              )
# fill=c("cornflowerblue","green","yellow","darkorchid1")
