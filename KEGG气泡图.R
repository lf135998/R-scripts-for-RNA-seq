rm(list = ls())
library(ggplot2)
pathway = read.table("D:\\transcriptLevelAnalysis\\functionAnnotation\\trans_regulated\\GOAndKEGG\\KEGGplot.txt",,header = T,sep = '\t',
                     col.names = c('Term','count','PValue'))
pathway$Term=substring(pathway$Term,10,100)
pp = ggplot(pathway,aes(pathway$PValue,pathway$Term))
pp+geom_point(aes(size=pathway$count))
pbubble = pp + geom_point(aes(size=pathway$count,color=-1*log10(pathway$PValue)))
pbubble + scale_colour_gradient(low="green",high="firebrick1")

pr = pbubble + scale_colour_gradient(low="green",high="firebrick1") + 
  labs(color=expression(-log[10](Pvalue)),size="Gene number",
       x="p_value",y="Pathway name",title="Top20 of trans target gene pathway enrichment")
pr+theme(plot.title = element_text(hjust = 0.5,size = 15))
savePlot("C:\\Users\\dklly\\Desktop\\plot", type=c("pdf"),device=dev.cur(),restoreConsole=TRUE)

