# Data Carpentry Workshop 2022

## General Information

The Bioinformatics Group is organizing an R programming workshop this June. The workshop is geared towards people that have never programmed or have limited programming experience in R. We will teach how to organize your code, your data, and produce some common plots and figures. 

The workshop curriculum is largely based on the publicly available Data Carpentry workshop "Data Analysis and Visualization in R for Ecologists". However, the curriculum has been tailored to work with the COVID-19 data set provided by Hamid Bolouri and Cate Speake published in [JCI](https://doi.org/10.1172/JCI143648):

- Bolouri, H., Speake, C., Skibinski, D., Long, S. A., Hocking, A. M., Campbell, D. J., Hamerman, J. A., Malhotra, U., & Buckner, J. H. (2021). The COVID-19 immune landscape is dynamically and reversibly correlated with disease severity. Journal of Clinical Investigation, 131(3), 1–14. https://doi.org/10.1172/JCI143648`

This repository houses the schedule, code, and resources for the workshop.

For more information regarding the mission and purpose of Data Carpentry visit their [website](https://datacarpentry.org). For further reading about the Carpentry approach to teaching scientific computing see their [paper](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510). 

## Details 

**When and Where:**: The workshop will run for 4 mornings (9 – 12pm), June 13 to 16 and will be in person in 4N. Though we recognize the commitment of a 4 morning workshop, we ask attendees to attend all sessions as the curriculum is designed to progressively build upon skills from prior days. 

**Requirements:** Participants must bring a personal or BRI-provided laptop with a Mac, Linux, or Windows operating system (not a tablet, Chromebook, etc.) that they have administrative privileges on. They should have a few specific software packages installed (listed below).

**Contact**: Please contact Charlie Quinn <CQuinn@benaroyaresearch.org> or Hannah DeBerg <HDeBerg@benaroyaresearch.org> to sign up for the workshop or for any questions regarding hardware/software required. Please contact Erin Witkop <EWitkop@benaroyaresearch.org> for any questions regarding the schedule, workshop goals, or curriculum. 

## Before the Workshop

1. Complete the Pre-Workshop survey by **Wednesday June 8th**. INSERT LINK.

2. Dowload R and RStudio on your laptop

3. Install R and RStudio on your machine. Follow the instructions [here](https://datacarpentry.org/R-ecology-lesson/#Install_R_and_RStudio).

    - Note R must be installed prior to installing and using RStudio. 

4. Install necessary packages.

**NOTE:** Time required to dowload and install packages can vary. Please download and install these packages prior to the workshop starting! 

During the course we will need a number of R packages. Packages contain useful R code written by other people. We will use the packages tidyverse...ADD OTHER PACKAGES HERE

To install these packages, open RStudio (after R is installed) and copy and paste the following command into the console window (look for a blinking cursor on the bottom left), then press the Enter (Windows and Linux) or Return (MacOS) to execute the command. 

        `install.packages(c("tidyverse",)` 

Alternatively, you can install the packages using RStudio’s graphical user interface by going to `Tools > Install Packages` and typing the names of the packages separated by a comma.

R tries to download and install the packages on your machine. When the installation has finished, you can try to load the packages by pasting the following code into the console and pressing `run` on the top right of the screen:

        ` library(tidyverse)`

If you do not see an error like `there is no package called ‘...’` you are good to go!

## Download the Data

Download a subsampled version of the publically available Bolouri et al., (2021) COVID-19 CYTOF and clinical metadata dataset here: 

## Collaborative Notes

We will use this <https://pad.riseup.net/p/BRI_Data_Carpentry_2022> for chatting, taking notes, and sharing URLs and bits of code. This collaborative document will expire 60 days from it's creation (May 13th)

## Schedule


