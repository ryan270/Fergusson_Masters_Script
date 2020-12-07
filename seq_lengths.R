###SEQUENCE QUALITY METRICS
#This script analyzes the sequence lengths, features, and overall quality...
#...of the four datasets used in the meta analysis


##LOAD PACKAGES, DATA, AND DIRECTORY
#Set Directory and Load required Packages
setwd('~/Documents/amphibian_meta_project/meta_analysis/qiime_analyses/seq-metrics/')
pcks <- c('ggplot2', 'wesanderson', 'rpsychi')
sapply(pcks, require, character.only = T)

metrics <- read.csv(file = 'meta_bioinf_metrics.csv', header = TRUE, sep = ',',
                    quote = "")

##SEQ METRICS
ggplot(metrics, aes(x = Dataset, y = Mean_Seq_Lngth, group = 1))+
  geom_line(linetype = 'dashed', aes(color = '#E1BD6D', size = 2))+
  geom_point(aes(size = Feat.per.Samp, color = "#EABE94"))+
  geom_errorbar(aes(ymin = Mean_Seq_Lngth-Seq_SD, ymax = Mean_Seq_Lngth+Seq_SD),
                size = 1)+
  xlab('Dataset')+
  ylab('Mean Sequence Length')+
  theme_bw()+
  theme(legend.position = 'none',
        axis.title = element_text(size = 16, family = "Georgia"),
        axis.text.x = element_text(size = 10, family = "Georgia"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = 'black', size = 0.25))


##ANOVA ANALYSIS
with(metrics, ind.oneway.second(Mean_Seq_Lngth, Seq_SD, Samples))