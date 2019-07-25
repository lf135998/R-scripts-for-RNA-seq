rm(list = ls())
go = read.csv('D:\\transcriptLevelAnalysis\\functionAnnotation\\trans_regulated\\GOAndKEGG\\GOplot.txt',sep = '\t',header = F,
              col.names = c('Category','Term','PValue'))
go$Term <- substring(go$Term,12,100)
go$Ontology <-substring(go$Category,8,9)
go$lgv=-log10(go$PValue)
library(gridExtra)
library(cowplot)
library(ggpubr)
bp<-ggbarplot(go,x="Term",y="lgv",fill = 'Ontology',
              color='white',
              palette = 'npg',
              sort.val = "desc",
              sort.by.groups = TRUE,
              x.text.angle= 45)
bp2<-bp+font("x.text")+ylab('-log10(p_value)')+xlab('GO term')
g=ggpar(bp2,font.xtickslab = c(7, "bold", "black") )#+coord_flip()
ggarrange(plot(1,2),g,ncol = 2, nrow = 1)

