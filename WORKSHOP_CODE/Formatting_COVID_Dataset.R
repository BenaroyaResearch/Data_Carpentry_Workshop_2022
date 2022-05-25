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

