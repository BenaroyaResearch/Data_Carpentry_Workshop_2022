# Data Carpentry Workshop 2022

## General Information

The Bioinformatics Group is organizing an R programming workshop this June. The workshop is geared towards people that have never programmed or have limited programming experience in R. We will teach how to organize your code, your data, and produce some common plots and figures.

The workshop curriculum is largely based on the publicly available Data Carpentry workshop "Data Analysis and Visualization in R for Ecologists". However, the curriculum has been tailored to work with the COVID-19 CYTOF and clinical metadata data set provided by Hamid Bolouri and Cate Speake published in [JCI](https://doi.org/10.1172/JCI143648):

- Bolouri, H., Speake, C., Skibinski, D., Long, S. A., Hocking, A. M., Campbell, D. J., Hamerman, J. A., Malhotra, U., & Buckner, J. H. (2021). The COVID-19 immune landscape is dynamically and reversibly correlated with disease severity. Journal of Clinical Investigation, 131(3), 1–14. https://doi.org/10.1172/JCI143648`

This repository houses the schedule, code, and resources for the workshop.

For more information regarding the mission and purpose of Data Carpentry visit their [website](https://datacarpentry.org). For further reading about the Carpentry approach to teaching scientific computing see their [paper](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510).

## Details

**When and Where:**: The workshop will run for 4 mornings (9 – 12pm), June 13 to 16 and will be in person in 4N. Though we recognize the commitment of a 4 morning workshop, we ask attendees to attend all sessions as the curriculum is designed to progressively build upon skills from prior days.

**Requirements:** Participants must bring a personal or BRI-provided laptop with a Mac, Linux, or Windows operating system (not a tablet, Chromebook, etc.) that you have the ability to install software on. You should have a few specific software packages installed (listed below). For any questions regarding installing software please contact the BRI helpdesk.

**Contact**: Please contact Erin Witkop <EWitkop@benaroyaresearch.org> for any questions regarding the schedule, workshop goals, or curriculum.

## Before the Workshop

1. Complete the Pre-Workshop survey by **Wednesday June 8th**. INSERT LINK.

2. Install R and RStudio on your machine. Follow the instructions [here](https://datacarpentry.org/R-ecology-lesson/#Install_R_and_RStudio).

    - Note R must be installed prior to installing and using RStudio.
    - Please email the BRI helpdesk regarding any issues installing the software.

3. Install necessary packages.

    **NOTE:** The time required to dowload and install packages can vary. Please download and install these packages prior to the workshop starting!

    During the course we will need a number of R packages. Packages contain useful R code written by other people. We will use the packages tidyverse...ADD OTHER PACKAGES HERE

    To install these packages, open RStudio (after R is installed) and copy and paste the following command into the console window (look for a blinking cursor on the bottom left), then press the Enter (Windows and Linux) or Return (MacOS) to execute the command.

            `install.packages(c("tidyverse","ggpubr"))` 

    We will also need to download several packages from the website Bioconductor, which has many helpful packages. Enter the following command in the console and press enter or Return to execute.

            `if (!require("BiocManager", quietly = TRUE))
              install.packages("BiocManager")

              BiocManager::install(c("ComplexHeatmap", "PCAtools"))`

    Alternatively, you can install the packages using RStudio’s graphical user interface by going to `Tools > Install Packages` and typing the names of the packages separated by a comma.

    R tries to download and install the packages on your machine. When the installation has finished, you can try to load the packages by pasting the following code into the console and pressing `run` on the top right of the screen:

            ` library(tidyverse)`

    If you do not see an error like `there is no package called ‘...’` you are good to go!

## Download the Data

Download a subsampled version of the publically available Bolouri et al., (2021) COVID-19 CYTOF and clinical metadata dataset here:

## Collaborative Notes

We will use this <https://pad.riseup.net/p/BRI_Data_Carpentry_2022> for chatting, taking notes, and sharing URLs and bits of code. This collaborative document will expire 60 days from it's creation (May 13th)

## Schedule


### DAY 1: June 13th

| Time           | Topic                                            | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 8:30am         |Pre-Workshop Help                                 |                                                                                                      |
| 9:00am         |Official Workshop Start/Introduction              | <https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html>                                 |
| 9:10am         |Introduction to R                                 | <https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html#Knowing_your_way_around_RStudio> |
| 10:30am-10:45am|BREAK                                             |                                                                                                      |
| 10:45am-11:15am|Starting with Data in R (dataframes)              | <https://datacarpentry.org/R-ecology-lesson/02-starting-with-data.html>                              |
| 11:15am-12:00pm|Starting with Data in R Cont. (factors)           |                                                                                                      |
| 12:00pm        |End of Day 1                                      |                                                                                                      |


### DAY2: June 14th

| Time           | Topic                                            | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 9:00am         |Manipulating Data in R  (summarizing, reshaping)  | <https://datacarpentry.org/R-ecology-lesson/03-dplyr.html#Pipes>                                     |
| 10:15am-10:30am|BREAK                                             |                                                                                                      |
| 10:30am-12:00pm|Visualizing Data (ggplot)                         | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 12:00pm        |End of Day 2                                      |                                                                                                      |

### DAY 3: June 15th

| Time           | Topic                                                       | Data Carpentry Curriculum Reference                                                                  |
|:---------------|:-----------------------------------------------------------:|:----------------------------------------------------------------------------------------------------:|
| 9:00am         |Visualizing Data Continued (pipes, faceting, themes)         | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 10:15am-10:30am|BREAK                                                        |                                                                                                      |
| 10:30am-12:00pm|Visualizing Data Cont. (customization, arranging, exporting) | <https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>                           |
| 12:00pm        |End of Day 3                                                 |                                                                                                      |

### DAY 4: June 16th

| Time           | Topic                                               | Data Carpentry Curriculum Reference     |
|:---------------|:---------------------------------------------------:|:---------------------------------------:|
| 9:00am         |Specialized Plotting  (PCAs, advanced heatmaps)      |                                         |
| 10:15am-10:30am|BREAK                                                |                                         |
| 10:30am-12:00  |Loading and customizing code for your analyses       |                                         |
| 12:00pm        |End of Workshop!                                     |                                         |
