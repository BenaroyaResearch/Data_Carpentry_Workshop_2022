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
write.csv(data, file="data/data_day1.csv")

#### DAY 2 ####
library(tidyverse)

data_day2 <- read_csv(file = "data/data_day1.csv")
head(data_day2)
data_day2 <- data_day2[,-1]
head(data_day2)

# Calculate age in months
data_day2 %>% 
  mutate(age_mo = age*12) %>% View()

# Multiple mutates
data_test <- data_day2 %>% 
  mutate(age_mo = age*12,
         age_d = age_mo*30)
data_test

# Pipes work with non dplyr functions
data_test %>% tail()

# Calculate mean bmi of patients
mean_bmi <- data_day2 %>%
  mutate(mean_bmi = mean(bmi))
# pad address https://pad.riseup.net/p/BRI_Data_Carpentry_2022
mean_bmi$mean_bmi

data_day2$bmi

# Filter NAs
mean_bmi <- data_day2 %>%
  filter(!is.na(bmi)) %>%
  mutate(mean_bmi = mean(bmi))
mean_bmi$mean_bmi

# Challenge
# Create a new data frame containing only the Sample.ID 
# column and a column showing mean Score, and only has patients
# older than 40

# compute mean bmi by sex
data_day2 %>%
  group_by(sex) %>%
  summarize(mean_bmi = mean(bmi, na.rm = TRUE))

data_day2 %>%
  group_by(race) %>%
  summarise(mean_bmi = mean(bmi, na.rm = TRUE))

# Group by multiple columns
data_new <- data_day2 %>%
  group_by(sex, race) %>%
  summarize(mean_bmi = mean(bmi, na.rm = TRUE))
data_new

# Summarize multiple variables
data_day2 %>%
  group_by(sex, race) %>%
  summarize(mean_bmi = mean(bmi, na.rm = TRUE),
            max_bmi = max(bmi, na.rm = TRUE))

# Arrange output
data_day2 %>%
  group_by(sex, race) %>%
  summarize(mean_bmi = mean(bmi, na.rm = TRUE),
            max_bmi = max(bmi, na.rm = TRUE)) %>%
  arrange(desc(max_bmi)) %>% View()

# Counting observations
# count patients by sex
data_day2 %>%
  count(sex, race)

# equivalent to group_by %>% summarize()
data_day2 %>%
  group_by(sex) %>%
  summarize(count = n())

# Arrange in descending order
data_day2 %>%
  count(sex, race) %>%
  arrange(sex, desc(n))

# Challenge
# How many male patients had severe Covid (severity column)
data_day2 %>%
  count(sex, severity)

# Use group_by and summarize to find the mean, min, and max
# White blood cell count of patients by Covid severity group, 
# and finally add a column with the number of observations

data_day2 %>%
  group_by(severity) %>%
  filter(!is.na(CBC.White.Blood.Cell.Count)) %>%
  summarize(min = min(CBC.White.Blood.Cell.Count, na.rm = TRUE),
            mean = mean(CBC.White.Blood.Cell.Count, na.rm = TRUE),
            max = max(CBC.White.Blood.Cell.Count, na.rm = TRUE),
            count = n()) 

# View data
View(data_day2)

# Pivot longer
?pivot_longer
colnames(data_day2)
data_long <- data_day2 %>% 
  pivot_longer(cols = c("CBC.White.Blood.Cell.Count",
                        "CBC.Absolute.Monocytes",
                        "CBC.Absolute.Neutrophils",
                        "CBC.Absolute.Lymphocytes"),
              names_to = "CBC",
              values_to = "Counts")
  
View(data_long)

# Pivot CYTOF
colnames(data_long)
data_long <- data_long %>%
  pivot_longer(cols = c("FracCD45.Neutrophil" ,
                        "FracCD45.T.cell.CD4",
                        "FracCD45.DC" , 
                        "T.cell.CD8.HLA_DRp__of.CD8"),
               names_to = "CYTOF",
               values_to = "Fraction")
View(data_long)

### GGPLOT2 ###

# build basic mapping
ggplot(data = data_long, mapping = aes(x = bmi, y = age)) +
  geom_point()

# remove NAs
data_long %>%
  filter(!is.na(bmi)) %>%
ggplot(aes(x = bmi, y = age)) + geom_point()

# Save plot base layer
data_plot <- ggplot(data = data_long, 
                    mapping = aes(x = bmi, y = age)) 
  #geom_point()
data_plot
data_plot + geom_point() + geom_text

# Add transparency
data_plot + geom_point(alpha = 0.05)

# Add color to points
ggplot(data_long, aes(x = bmi, y = age, color = sex)) +
  geom_point(alpha = 0.05)

# Equivalent point color
ggplot(data_long, aes(x = bmi, y = age)) +
  geom_point(alpha = 0.05, aes(color = sex))

# Plotting challenge
# plot the relationship between severity and age with points,
# and color by sex

# Boxplots
ggplot(data_long, aes(x=severity, y = age, color = sex)) +
  geom_boxplot()

# Add data points
ggplot(data_long, aes(x=severity, y = age, color = sex)) +
  geom_boxplot() +
  geom_point()

# Dodge points
ggplot(data_long, aes(x=severity, y = age, color = sex)) +
  geom_boxplot() +
  geom_point(aes(group = sex),
             position = position_dodge(width = 0.75))

# Violin plot
ggplot(data_long, aes(x=severity, y = age, color =   sex  )) +
  geom_violin() +
  geom_point(aes(group=sex), 
             position = position_dodge(width = 0.9))

# Challenge
# Make a boxplot of bmi by Patient Type and color by 
# Highest Care, include points for individual observations
ggplot(data_long, aes(x = patientType, y = bmi, 
                      color = HighestCare )) +
  geom_boxplot() +
  geom_point(aes(group = HighestCare), 
             position = position_dodge(width = 0.75))

## Make CBC boxplot  by Covid Score
data_long %>%
  filter(CBC == "CBC.White.Blood.Cell.Count") %>% 
  distinct(Counts, CBC, Sample.ID, .keep_all = TRUE ) %>% 
  ggplot(aes(x = Score, y = Counts)) +
  geom_boxplot()

data_long %>%
  filter(CBC == "CBC.White.Blood.Cell.Count") %>% 
  distinct(Counts, CBC, Sample.ID, .keep_all = TRUE ) %>%
  select(Score)

# remove NAs
data_long %>%
  filter(CBC == "CBC.White.Blood.Cell.Count") %>% 
  distinct(Counts, CBC, Sample.ID, .keep_all = TRUE ) %>%
  filter(!is.na(Score)) %>%
  ggplot(aes(x = Score, y = Counts, group = Score)) +
  geom_boxplot()

levels(as.factor(data_long$Score))

# Set score as factor
data_long$Score <- factor(data_long$Score, 
                          levels = c("2", "3", "4", "5", "6" ,"7"))
class(data_long$Score)

# make boxplot
data_long %>%
  filter(CBC == "CBC.White.Blood.Cell.Count") %>%
  distinct(Counts, CBC, Sample.ID, Score) %>%
  filter(!is.na(Score)) %>%
  ggplot(aes(x = Score, y = Counts, group = Score))+
  geom_boxplot()

# Save the data from today
write.csv(data_long, file = "data/data_day2.csv", row.names = FALSE)


