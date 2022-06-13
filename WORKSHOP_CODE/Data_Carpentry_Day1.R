## Data Carpentry Day 1
# BRI Data Carpentry Course
# Monday June 13th

## Starting in R 

getwd()
setwd()
mean()

#### Introduction to R ####

3+5
10*2

age <- 50
age <- 40
age2 <- 40

# Multiply by 2
age*2
age_double <- age*2

# Challenge 1
time_d <- 180
total_dosage_mg <-   500

# What is the dosage per day (mg)?
total_dosage_mg / time_d

# https://pad.riseup.net/p/BRI_Data_Carpentry_2022

# Age square root
age_sqrt <- sqrt(50)
age_sqrt <- sqrt(age)

# Vector of age
age_d <- c(50, 100, 150, 200)

# Character vector 
treatment <- c("saline", "tetramer","IL-13")

# inspect data
length(treatment)
length(age_d)

# type of data
class(age_d)
class(treatment)
mean(treatment) # demonstrate data class error

# View the structure
str(treatment)
str(age_d)

# Subset vectors
drug <- c("aspirin", "tylenol","sudafed")
class(drug)

drug[c(2,3)]
drug_subset <- drug[c(3,2)]
drug[-1]
drug[-2]
drug[1]

# Conditional subseting
weight_g <- c(25,30,35,40)

# Logical question
weight_g > 20
weight_g < 35
weight_g <= 35

# subset weight_g
weight_g_subset <- weight_g[weight_g < 40]

# Combine multiple tests
weight_g[weight_g <= 30 | weight_g == 40]
weight_g[weight_g <= 30 & weight_g == 30]

# Search list of strings
months <- c("Jan","Feb","Mar","Apr")

months[months %in% c("Jan","Mar","July")]

# Challenge 2
# Can you find values between 100 and 200 in this list
weight_lb <- c(55, 95, 105, 187, 201)

# Missing Data 
# na.rm = TRUE
heights <- c(2,4,4,NA,6)
mean(heights, na.rm = TRUE)

# select for values that are not NA's
heights[!is.na(heights)]
#heights[is.na(heights)]

mean(heights[!is.na(heights)])

# You can also omit the NAs
heights_omit  <- na.omit(heights)
heights

## Challenge 3
# Can you return this data frame with no NAs
weight_g <- c(10,15,16, NA, 25, 30, NA)

## Dataframes
library(tidyverse)

# load data
data <- read_csv("data/Bolouri_2021_subset.csv")
read_txt()
library(readxl)
data_xl <- readxl::read_xlsx("data/Bolouri_2021_subset.xlsx")

# Print data
print(data)
print(data, 5)

# Head function
head(data)

# Last few lines
tail(data)

# Challenge 5
# Create a dataframe containing only the data in row
# 200 of the dataset




# open full dataframe
View(data)



# rename
data1 <- data

# additional data inspection
nrow(data)
ncol(data)
rownames(data)
colnames(data)
summary(data)

# Index and subset dataframes
data[1,1] # get first row and column
data_first <- data[1,1]

data[,5]
data$sex
data[1:2,"sex"]

# select group of rows and columns
data3 <- data[1:2, 3:6]

# exclude columns
data[,-5]
data[,-1]

# To get the head of the dataframe
head(data)
head(data,7)
data[-(7:nrow(data)),3]
data[-(7:nrow(data)),3]

# Factors

# Convert sex column to a factor
data$sex <- factor(data$sex)

# Check the conversion worked
summary(data$sex)
class(data$sex)

# Check levels
levels(data$sex)

# Number of levels
nlevels(data$sex)

# Reorder factor
data$sex <- factor(data$sex, levels = c("male","female"))
levels(data$sex)

# Challenge
# Convert the HighestCare column to a factor and put
# the levels in this order: Neg, Floor, CCU, Outpatient
data$HighestCare <- factor(data$HighestCare, levels = c("Neg", "Floor", "CCU", "Outpatient"))
levels(data$HighestCare)
summary(data$sex)
summary(data$HighestCare)

# Check levels in non-factor column
class(data$race)
levels(as.factor(data$race))

# Convert back to character
as.character(data$sex)

# Rename factors
plot(data$HighestCare)
levels(data$HighestCare)[1] <- "Negative"
plot(data$HighestCare)

# Rename NA
data$Ever.On.Ventilator <- factor(data$Ever.On.Ventilator)
plot(data$Ever.On.Ventilator)

# Add missing values to factor levels
data$Ever.On.Ventilator <- addNA(data$Ever.On.Ventilator)
levels(data$Ever.On.Ventilator)
levels(data$Ever.On.Ventilator)[1] <- "Not Applicable"
plot(data$Ever.On.Ventilator)

#levels(data$Ever.On.Ventilator) <- c("No","Yes","Not Applicable")

# Can you reorder the levels in data$Ever.On.Ventilator
# so the Not Applicable patients are before the N patients?

## Manipulating Data with Dplyr
# select columns
select(data, Sample.ID, age, bmi)
select(data, -race, -sex)

# Filter rows
filter(data, HighestCare == "Outpatient")
filter(data, age <= 50)

# Piping
class(data$bmi)
data2 <- data %>%
  # select columns
  select(Sample.ID, age, severity, bmi) %>%
  # filter by bmi
  filter(bmi < 30)
head(data2)

# Challenge 7
# Using pipes, subset data to keep only patients with COVID
# score at or below 4, whose highest care was NOT CCU,
# and retain only their Sample.ID, age, sex, bmi

# Save your data
write.csv(data, file="data/data_day1.csv" )

