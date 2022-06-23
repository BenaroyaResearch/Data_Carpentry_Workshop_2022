#### Day 4, part 2 ####

# This session focused on running PCA and UMAP on microarray data
# and plotting the results with some plot customization.

# load tidyverse packages
library(tidyverse)

# remove all objects from environment
rm(list = ls())

# load objects from .RData file
load(file = "data/data_day4_MJD.RData")

# load objects from .RData file, and store list of objects as a character vector
objects <- load(file = "data/data_day4_MJD.RData")

# examine loaded objects
str(data_microarray)
View(data_microarray)

str(metadata)
View(metadata)

## run PCA

# subset metadata
metadata_subset <-
  metadata %>%
  select(title, geo_accession, donor, visit, dosage, filename, studyGroup)
View(metadata_subset)

# set rownames for metadata, required by PCAtools::pca
rownames(metadata_subset) <- metadata_subset$filename
rownames(metadata_subset)

# check that data object column names match metadata rownames
all(colnames(data_microarray) == rownames(metadata_subset))

# run PCA on microarray data, and attach metadata
pca_microarray <- PCAtools::pca(data_microarray,
                                metadata = metadata_subset)

# load PCAtools package, and install if needed
if (!require(PCAtools)) install.packages("PCAtools")
library(PCAtools)

# plot PCs, colored by dosage
PCAtools::biplot(pca_microarray, colby = "dosage")

# remove text labels on points
PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL)

# load ggthemes package, and install if needed
if (!require(ggthemes)) install.packages("ggthemes")
library(ggthemes)

PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL) +
  ggthemes::scale_color_colorblind()

# show points with NA values included
PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL) +
  ggthemes::scale_color_colorblind(na.value = "gray60")

# change x- and y-axis labels
PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL) +
  ggthemes::scale_color_colorblind(na.value = "gray60") +
  labs(x = "PC1", y = "PC2")

# change x- and y-axis labels using values stored in a variable
# (this is useful for setting values across a number of plots or uses)
# (they can then be modiifed once, and applied across all those plots / uses by re-running the script)
myLabels <- c("PC1", "PC2")
PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL) +
  labs(x = myLabels[1], y = myLabels[2]) +

# attempt to remove axis tick number labels
# (doesn't work because of a quirk of PCAtools::biplot)
PCAtools::biplot(pca_microarray, colby = "dosage",
                 lab = NULL) +
  labs(x = myLabels[1], y = myLabels[2]) +
  theme(axis.text = element_blank())


## plot PCs using ggplot functions
# examine pca object to locate the components we want to plot
str(pca_microarray)

# PC values are in pca_microarray$rotated
# metadata is in pca_microarray$metadata

# plot PC1 and PC2, colored by dosage
ggplot(
  mapping = aes(x = pca_microarray$rotated$PC1,
                y = pca_microarray$rotated$PC2,
                color = pca_microarray$metadata$dosage)) +
  geom_point()

## Challenge
# Make this plot as clean / pretty as you can
# Some possible things to modify: themes, colors, labels, points, axes

## participant examples of cleaned-up plots
# example 1
ggplot(
  mapping=aes(x=pca_microarray$rotated$PC1,
              y=pca_microarray$rotated$PC2,
              color= pca_microarray$metadata$dosage)
) +
  geom_point(aes(fill = pca_microarray$metadata$dosage), pch = 21, color = "black") +
  theme_bw() +
  labs(x = "PC1", y = "PC2", 
       title = "Microarray") +
  scale_fill_manual(labels = c("Placebo", "Ixekizumab",
                               "NA"), 
                    values = c("Red", "blue","gray")) +
  theme(legend.title = element_blank())

# example 2
ggplot(
  mapping = aes(x=pca_microarray$rotated$PC1,
                y=pca_microarray$rotated$PC2, 
                color = pca_microarray$metadata$dosage))+
  geom_point()+
  theme_classic()+
  labs(x=myLabels[1],y=myLabels[2], title = "Joe's Fabulous PCA Microarray")+
  guides(color = guide_legend(title = "Dosage"))+
  ggthemes::scale_color_fivethirtyeight(na.value="gray60")+
  theme(axis.text = element_blank())

# example 3
ggplot(mapping = aes(x = pca_microarray$rotated$PC1, 
                     y = pca_microarray$rotated$PC2, 
                     color = pca_microarray$metadata$dosage)) +
  geom_point() +
  labs(x = "PC1", y = "PC2", color = "Dosage") +
  theme_classic() +
  ggthemes::scale_color_canva(na.value = "gray60")


## Run UMAP on microarray data

library(umap)
# install.package("umap") # install package if not already installed

# run UMAP (data are in wrong orientation)
umap_microarray <- umap::umap(data_microarray)
View(data_microarray)

# run UMAP on transposed (rotated) data
umap_microarray <- umap::umap(t(data_microarray))

# examine umap output
str(umap_microarray)

# extract UMAP coordinates, and modify them to enable merging with metadata
umap_coords_microarray <- umap_microarray$layout
View(umap_coords_microarray)

umap_coords_microarray <- as.data.frame(umap_coords_microarray)
colnames(umap_coords_microarray) <- c("UMAP_1", "UMAP_2")
umap_coords_microarray$filename <- rownames(umap_coords_microarray)

# merge / join UMAP coordinates with metadata
metadata_subset_with_UMAP <-
  left_join(metadata_subset, umap_coords_microarray)
View(metadata_subset_with_UMAP)

# Plot UMAP
metadata_subset_with_UMAP %>%
  ggplot(mapping = aes(x = UMAP_1, y = UMAP_2, color = dosage)) +
  geom_point()

## Challenge
# Plot samples on UMAP using the same style you used above for the PCA plot
# Bonus: output the PCA and UMAP plots side-by-side using ggarrange
