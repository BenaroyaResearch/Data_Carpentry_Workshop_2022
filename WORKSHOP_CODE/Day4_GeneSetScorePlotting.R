#Load libraries
library(dplyr)
library(stringr)
library(ggplot2); theme_set(
  theme_bw(20) +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_rect(colour="black", fill=NA, size=1),
          axis.text=element_text(colour="black"),
          axis.ticks=element_line(colour="black"),
          legend.key = element_blank(),
          text = element_text(size=20),
          strip.text.x = element_text(size = 10,margin = margin( b = 3, t = 3) ),
          strip.background = element_rect(fill="white", colour="black")))
library(tidyr)
library(ggbeeswarm)

#Set up directories

baseDir <- "/Users/hdeberg/Box/DataCarpentry2022"
dataDir <- file.path(baseDir, "data")
codeDir <- file.path(baseDir, "code")
plotDir <- file.path(baseDir, "plots")

#Load data
load(file.path(dataDir, "SkinMicroarrayGeneSetScores.RData"))

#Combine gene set scores and annotation into a single data frame
annoSetScores <- left_join(combAnno,
                           scoresSupKCForR01)

#Check numbers of samples
table(combAnno$studyGroup)
table(annoSetScores$studyGroup)

#Check column names to make sure gene set score columns are present. These should be "Blood CD4+ Th1" (or Th2, Th17, Th22).

colnames(annoSetScores)

#Rearrange data for plotting. Make longer with one column that has gene set names and another column with gene set scores 

annoSetScoresLong <- annoSetScores %>%
  pivot_longer(cols = c("Blood CD4+ Th1",
                        "Blood CD4+ Th2",
                        "Blood CD4+ Th17",
                        "Blood CD4+ Th22"),
               names_to = "stimulation",
               values_to = "geneSetScore")

#Check sizes of data frames
dim(annoSetScores) #38 rows
dim(annoSetScoresLong) #152 = 38*4 rows

#I want to plot the study group on the x-axis. 
#Check the levels of this variable
table(annoSetScoresLong$studyGroup)

#I want PS_aIL17 to come before PS on the plot

annoSetScoresLong <- annoSetScoresLong %>%
  dplyr::mutate(studyGroup = factor(studyGroup,
                                    levels = c("HC",
                                               "PS_aIL17",
                                               "PS"))) 
#Check that the new levels look okay
table(annoSetScoresLong$studyGroup)

#Plot gene set scores by study group, facet to one plot per stimulation condition

#Make boxplots

gSetScoresBoxplots <- ggplot(annoSetScoresLong,
                             aes(x = studyGroup,
                                 y = geneSetScore,
                                 group = studyGroup)) +
  geom_boxplot(outlier.shape = NA) +
  scale_x_discrete(labels=c("HC" = "HC", 
                            "PS_aIL17" = "aIL17",
                            "PS" = "PS"))+
  labs(x = "",
       y = "Gene set score") +
  theme(axis.text=element_text(size=10),
        axis.title=element_text(size=10)) +
  facet_wrap(~stimulation)

pdf(file.path(plotDir, 
              "Boxplots_GeneSetScores.pdf"),
    height = 4,
    width = 4)

print(gSetScoresBoxplots)

invisible(dev.off())

gSetScoresPointsMeans <- ggplot(annoSetScoresLong,
                                aes(x = studyGroup,
                                    y = geneSetScore,
                                    group = studyGroup)) +
  geom_quasirandom()+
  stat_summary(fun="mean", geom="segment", mapping=aes(xend=..x.. - 0.25, yend=..y..), color = "red")+
  stat_summary(fun="mean", geom="segment", mapping=aes(xend=..x.. + 0.25, yend=..y..), color = "red") +
  scale_x_discrete(labels=c("HC" = "HC", 
                            "PS_aIL17" = "aIL17",
                            "PS" = "PS"))+
  labs(x = "",
       y = "Gene set score") +
  theme(axis.text=element_text(size=10),
        axis.title=element_text(size=10)) +
  facet_wrap(~stimulation)

pdf(file.path(plotDir, 
              "PointsAndMeans_SupGeneSetScores.pdf"),
    height = 4,
    width = 4)

print(gSetScoresPointsMeans)

invisible(dev.off())


#Focus on paired samples with pre-post anti IL17 treatment - how does anti IL-17 affect responses to T-cell supernatants?

#Subset to controls or psoriasis samples on Ixekizumab

table(annoSetScoresLong$studyGroup, annoSetScoresLong$dosage, useNA = "ifany")

annoSetScoresSubset <- annoSetScoresLong %>%
  dplyr::filter((studyGroup == "HC") | (dosage == "Ixekizumab")) 

table(annoSetScoresSubset$studyGroup, annoSetScoresSubset$dosage, useNA = "ifany")

#Rename studyGroup variable per collaborator's request
annoSetScoresSubset <- annoSetScoresSubset %>%
  dplyr::mutate(studyGroup = case_when(studyGroup == "HC" ~ "HC",
                                        studyGroup == "PS" ~ "PS, baseline",
                                        studyGroup == "PS_aIL17" ~ "PS, aIL17"))

#Set factor levels

annoSetScoresSubset <- annoSetScoresSubset %>%
  dplyr::mutate(studyGroup = factor(studyGroup,
                                  levels = c("HC",
                                             "PS, baseline",
                                             "PS, aIL17"))) 

table(annoSetScoresSubset$studyGroup,useNA = "ifany")


gSetScoresPointsByDonor <-  ggplot(annoSetScoresSubset,
                                   aes(x = studyGroup,
                                       y = geneSetScore,
                                       group = donor)) +
  geom_point()+
  geom_line() +
  ylim(c(6,8))+
  labs(x = "",
       y = "Gene set score") +
  theme(axis.text.x=element_text(angle=60, hjust=1),
        axis.text=element_text(size=10),
        axis.title=element_text(size=10)) +
  facet_wrap(~stimulation)

pdf(file.path(plotDir, 
              "PointsByDonor_GeneSetScores.pdf"),
    height = 5,
    width = 4)

print(gSetScoresPointsByDonor)

invisible(dev.off())

#Compute statistics between groups

geneSetScoreStats <- annoSetScoresSubset %>%
  dplyr::group_by(stimulation) %>%
  dplyr::summarise(pvaluesHCvsaIL17 = t.test(geneSetScore[studyGroup == "HC"],
                                             geneSetScore[studyGroup == "PS, aIL17"])$p.value,
                   pvaluesHCvsPS = t.test(geneSetScore[studyGroup == "HC"],
                                          geneSetScore[studyGroup == "PS, baseline"])$p.value,
                   pvaluesaIL17vsPS = t.test(geneSetScore[studyGroup == "PS, aIL17"],
                                             geneSetScore[studyGroup == "PS, baseline"])$p.value) %>%
  pivot_longer(cols = starts_with("pvalues"),
               names_to = "comparison",
               values_to = "pValue") %>%
  dplyr::mutate(FDR = p.adjust(pValue, method = "fdr"), 
                bonferroni = p.adjust(pValue, method = "bonferroni"))


View(geneSetScoreStats)