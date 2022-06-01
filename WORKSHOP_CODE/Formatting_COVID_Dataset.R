### R Script to Edit COVID-19 Dataset 

# Written by Erin Witkop
# May 24th, 2022
# Data provided from Hamid Bolouri and Cate Speake
# Data published in JCI
  # Bolouri, H., Speake, C., Skibinski, D., Long, S. A., Hocking, A. M., Campbell, D. J., Hamerman, 
  # J. A., Malhotra, U., & Buckner, J. H. (2021). The COVID-19 immune landscape is dynamically and 
  # reversibly correlated with disease severity. Journal of Clinical Investigation, 131(3), 1–14. 
  # https://doi.org/10.1172/JCI143648

#### Load Libraries ####

library(tidyverse)
library(readxl)

#### Load the raw data ####

workshop_path <- "/Users/ewitkop/Library/CloudStorage/Box-Box/EW_Bioinformatics_Postdoc_Research/ADMINISTRATIVE/Data_Carpentry_Workshop_June_2022"

data <- readxl::read_xlsx(file.path(workshop_path, "WORKSHOP_DATA/postMS_bigTbl_HB14Sept2020.xlsx"))

#### Subsetting the Dataset

## Remove discharge date to help protect PHI
colnames(data)

data_formatted <- data %>% select(-dischargeDate)

# Keep only patients that received toclizumab
data_formatted <- data_formatted %>% filter(!is.na(tocilizumab.StartDate))

# Keep only SWB samples
data_formatted <- data_formatted %>% filter(grepl("SWB",Sample.ID)) %>% filter(drawDate != "NA")

View(data_formatted)

# Select CBC, CYTOF, and metadata rows to keep
CBC_keep <- c("CBC.White.Blood.Cell.Count", "CBC.Absolute.Monocytes","CBC.Absolute.Neutrophils","CBC.Absolute.Lymphocytes")
CYTOF_keep <- c("FracCD45.Neutrophil","FracCD45.T.cell.CD4","FracCD45.DC", "T.cell.CD8.HLA_DRp__of.CD8"      )
metadata_keep <- c("Sample.ID", "drawDate","Covid.ID","Score","sex","age","race","bmi","patientType","HighestCare","Ever.On.Ventilator" ,
                   "Preexisting.Hypertension","eventId","admitDate","deceasedDate","covidId","severity","drawTime",
                    "tocilizumab.StartDate","tocilizumab.EndDate","tocilizumab.TotalDays"  )
total_keep <- c(metadata_keep, CBC_keep, CYTOF_keep)

# Subset dataset 
data_formatted <- data_formatted[,total_keep]

# Check class of all columns
str(data_formatted)

# Change incorrectly formatted chr variables to numeric
data_formatted[,c("Score","age","bmi","CBC.White.Blood.Cell.Count",
                  "CBC.Absolute.Monocytes","CBC.Absolute.Neutrophils",
                  "CBC.Absolute.Lymphocytes")]<- sapply(data_formatted[,c("Score","age","bmi","CBC.White.Blood.Cell.Count",
                  "CBC.Absolute.Monocytes","CBC.Absolute.Neutrophils",
                  "CBC.Absolute.Lymphocytes")], as.numeric)

# Recheck st
str(data_formatted) # correct

## Export cleaned data
write.csv(data_formatted, file.path(workshop_path, "WORKSHOP_DATA/Bolouri_2021_subset.csv"), row.names = FALSE)

#### Make the data UN-Tidy for the workshop ####

data_messy <- data_formatted

# Make age character
data_messy$age <- as.character(data_messy$age)

# Make formatting of sex non uniform
data_messy$sex <- recode(data_messy$sex, "male" = "M")

# Change ever on ventilator NA to zero
data_messy$Ever.On.Ventilator <- recode(data_messy$Ever.On.Ventilator, "NA"="0")

View(data_messy)

## Export the messy data
write.csv(data_messy, file.path(workshop_path, "WORKSHOP_DATA/Bolouri_2021_subset_UNTIDY.csv"), row.names = FALSE)

