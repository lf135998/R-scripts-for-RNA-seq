rm(list=ls())
options(scipen=200)
protein <- read.csv('D:\\transcriptLevelAnalysis\\comparelncRNAmRNA\\proteinCodingfilterF0.5.fa.fai',
                    header = F,sep = '\t')
newLnc <- read.csv('D:\\transcriptLevelAnalysis\\comparelncRNAmRNA\\newlncRNA.fa.fai',
                   header = F, sep = '\t')
konwnLnc <- read.csv('D:\\transcriptLevelAnalysis\\comparelncRNAmRNA\\knownLncfilterF0.5.fa.fai',
                   header = F, sep = '\t')
breaks = union(seq(from=0,to=3000,by=300),c(max(protein$V2)))
AllLnc <- c(newLnc$V2, konwnLnc$V2)
dProtein <- table(cut(protein$V2, breaks = breaks))
dAllLnc <-table(cut(AllLnc,breaks = breaks))
a <- data.frame(dProtein)
b <- data.frame(dAllLnc)
classfication = c(rep('mRNAs',11),rep('lncRNAs',11))
data <- data.frame(classfication,section = rep(a$Var1,2),num=c(a$Freq,b$Freq))
library(plyr)
ce <- ddply(data, 'classfication', transform, percentage = num/sum(num)*100 )
library(ggplot2)
g = ggplot(ce, aes(x=ce$classfication,y=ce$percentage,fill=ce$section))+
  geom_bar(stat='identity')+
  scale_fill_manual(values=c('darkgreen','lightsalmon','lightgoldenrod','salmon2',
                             'khaki1','goldenrod1','darkseagreen1','deepskyblue','mediumorchid1',
                             'hotpink','darkred'),name='Length intervals')
g = g + theme(panel.grid.major =element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(),axis.line = element_line(colour = "black"))
g = g+xlab('Type of RNA')+ylab('Percentage of transcripts')
g + theme(axis.text.x = element_text(angle = 0,vjust = 0,size = 15),
          axis.text.y = element_text(angle = 0,hjust = 0,size = 20),
          axis.title.x = element_text(angle = 0,vjust = 0,size = 20),
          axis.title.y = element_text(angle = 90,vjust = 2,size = 20),
          legend.text = element_text(size = 13),
          legend.title = element_text(size=15))

