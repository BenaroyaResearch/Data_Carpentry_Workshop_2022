Data Carpentry Workshop 2022 Code
================
Erin Witkop
5/13/2022

## DAY 1

### 9:00 am Introduction

Welcome to the second data carpentry style workshop that the
Bioinformatics group has hosted. My name is Erin Witkop, I am a
Bioinformatics Postdoctoral Research Associate in Peter Linsley’s lab
and I started last October. I started coding in R as a undergrad and now
have about 8 years of experience and about three years ago I became a
certified Data Carpentry instructor, which means I have taken several of
their courses, taught several prior courses, and have taken a course in
the pedagogical style of the Carpentries. I really enjoy teaching and
working with data and I’m excited to be teaching this course along with
several fellow intructors Hannah DeBerg and Matt Dufort who are going to
step in toward the end of the course.

This course is designed to start out with the assumption that you have
no prior experience coding at all in any language and the curriculum is
designed to build on itself throughout the course. Our main goals for
the course are that in the future when you have your own data you will
be able to load it into R, calculate some standard statisitcs, and do
some exploratory plotting that you can share with your colleagues.

We are basing the curriculum and pedagogical style of this course off of
the Data Carpentries style, specifically the visusalizing ecology data
course.

For information regarding the schedule, helpful Data Carpentry
resources, links to the code we will generate, and links to the
collaborative etherpad document, please see our github repository
[link](https://github.com/BenaroyaResearch/Data_Carpentry_Workshop_2022)

We are additionally going to use a collaborative etherpad document at
several points during the course. The link for the etherpad is
[here](https://pad.riseup.net/p/BRI_Data_Carpentry_2022).

Finally, I wanted our helpers for the workshop today: . Every day we
will have atleast two helpers who have experience with R Their role is
to help troubleshoot any individual problems or error codes you may have
that you are not able to figure out. Whenever you need help just raise
up your red sticky note and a helper will come over and see if they can
help assist you. At some points in the course I’ll check in regarding
the pace of the course and ask you to put up a green sticky note if you
feel good, or red if I need to slow down and go slower.

I do want to point out that there are a lot of things to know about R,
but the goal of this course is to help you build confidence and know
that you find answers to your own questions.

### 9:10 am - 9:45am: Intro to R

-   What is R? What is RStudio?
    -   The term “R” is used to refer to both the programming language
        and the software that interprets the scripts written using it.
-   Why learn R?
    -   R is great for reproducibility, R can integrate new and existing
        tools, R is interdiscipinary and extensible, its free, is open
        source, R produces high quality graphics, large helpful
        community
        -   Stack overflow, R studio community

#### Knowing your way around R and R studio

Let’s start by learning about RStudio, which is an Integrated
Development Environment (IDE) for working with R.

The RStudio IDE open-source product is free under the Affero General
Public License (AGPL) v3. The RStudio IDE is also available with a
commercial license and priority email support from RStudio, PBC.

We will use RStudio IDE to write code, navigate the files on our
computer, inspect the variables we are going to create, and visualize
the plots we will generate. RStudio can also be used for other things
(e.g., version control, developing packages, writing Shiny apps) that we
will not cover during the workshop.

RStudio is divided into 4 “panes”:

-   The Source for your scripts and documents (top-left, in the default
    layout)
-   Your Environment/History (top-right) which shows all the objects in
    your working space (Environment) and your command history (History)
-   Your Files/Plots/Packages/Help/Viewer (bottom-right)
-   The R Console (bottom-left)

The placement of these panes and their content can be customized (see
menu, Tools -> Global Options -> Pane Layout). For ease of use, settings
such as background color, font color, font size, and zoom level can also
be adjusted in this menu (Global Options -> Appearance).

One of the advantages of using RStudio is that all the information you
need to write code is available in a single window. Additionally, with
many shortcuts, autocompletion, and highlighting for the major file
types you use while developing in R, RStudio will make typing easier and
less error-prone.

#### Getting set up

It is good practice to keep a set of related data, analyses, and text
self-contained in a single folder, called the working directory. All of
the scripts within this folder can then use relative paths to files that
indicate where inside the project a file is located (as opposed to
absolute paths, which point to where a file is on a specific computer).
Working this way allows you to move your project around on your computer
and share it with others without worrying about whether or not the
underlying scripts will still work.

RStudio provides a helpful set of tools to do this through its
“Projects” interface, which not only creates a working directory for
you, but also remembers its location (allowing you to quickly navigate
to it) and optionally preserves custom settings and (re-)open files to
assist resume work after a break. Go through the steps for creating an
“R Project” for this tutorial below.

1.  Start RStudio.
2.  Under the `File` menu, click on `New Project`. Choose
    `New Directory`, then `New Project`.
3.  Enter a name for this new folder (or “directory”), and choose a
    convenient location for it. This will be your working directory for
    the rest of the course (e.g., \~/data-carpentry).
4.  Click on Create Project.

A workspace is your current working environment in R which includes any
user-defined object. By default, all of these objects will be saved, and
automatically loaded, when you reopen your project.

#### Organizing your working directory

Using a consistent folder structure across your projects will help keep
things organized, and will help you to find/file things in the future.
This can be especially helpful when you have multiple projects. In
general, you may create directories (folders) for scripts, data, and
documents.

Let’s create a few new folders to hold input and output for us in our
repository - `/raw_data/` - `/scripts/` - `/figures/` - `/results/`

#### The working directory

The working directory is an important concept to understand. It is the
place from where R will be looking for and saving the files. When you
write code for your project, it should refer to files in relation to the
root of your working directory and only need files within this
structure.

RStudio assists you in this regard and sets the working directory
automatically to the directory where you have placed your project in. If
you need to check it, you can use `getwd()`. If for some reason your
working directory is not what it should be you can use
`setwd("/path/to/working/directory")` to reset your working directory.

#### Interacting with R

What we are writing is *code* or the instructions to tell R how to run.
We call the instructions *commands* and then we execute the commands by
running the code.

You can either run code directly through the console and press `Enter`,
or by writing your commands in a script and running them using the `Run`
button or a keyboard shortcut. For example, I run my commands in R on a
mac using COMMAND+ENTER.

For reproducibility its best to write your code down in R and using the
number (#) sign to include comments. Any line or part of a line starting
with a number sign will be ignored by R. It’s really important to
comment your code, both for yourself and for sharing what you have done
with others.

#### Seeking help

You can search functions by typing `?mean()` in the console or also
through the help tab in R studio. Looking up commands is really useful
for understanding the arguments that each one takes and how to use it
properly!

#### Automatic Code Completion

When you start typing code in R you can its tab completion to finish a
command or object name that you were typing by hitting the tab button.

#### Dealing with Error Messages

Don’t get discouraged if your code doesn’t run immediately! Error
messages are common when programming, and fixing errors is part of any
programmer’s daily work. Often, the problem is a small typo in a
variable name or a missing parenthesis. Watch for the red x’s next to
your code in RStudio. These may provide helpful hints about the source
of the problem.

RStudio shows a red x next to a line of code that R doesn’t understand.
RStudio shows a red x next to a line of code that R doesn’t understand.

If you can’t fix an error yourself, start by googling it. Some error
messages are too generic to diagnose a problem (e.g. “subscript out of
bounds”). In that case it might help to include the name of the function
or package you’re using in your query.

### 9:45 - 10:30 am: Introduction to R

#### Creating Objects in R

You can get output from R simply by typing math in the console:

``` r
3 + 5
```

    ## [1] 8

``` r
12 / 7
```

    ## [1] 1.714286

However to do things with this data we need to save it as an *object* by
assigning the value to a name using the assignment operator `<-`

In RStudio, typing Alt + - (push Alt at the same time as the - key) will
write \<- in a single keystroke in a PC, while typing Option + - (push
Option at the same time as the - key) does the same in a Mac.

``` r
age <- 50
```

R doesn’t automatically print the output after you assign data to an
object, so to view it you need to print the name of the object and run
it

``` r
age
```

    ## [1] 50

Objects can have almost any name you want, they just can’t start with a
number, have any spaces in them, or be the same name as one of the
functions in R. R is case sensitive, and being consistent in your naming
is helpful.

For those of you familiar with any other coding languages, in R and
`object` is the same thing as a `variable`. They are interchangable.

Now that we have saved our data data as an object we can do math with
it!

``` r
age * 2
```

    ## [1] 100

``` r
# And we can save this output to a new object
age_double <- age * 2
```

You can also change the value by assigning a new one

``` r
age <- 60
# Note this rewrites the previous data, but does not affect our doubled age object!

age_double
```

    ## [1] 100

``` r
# So if you ever change a bit of code upstream, you need to rerun all the other commands that code depended on in order to update your data 
```

Let’s do a quick challenge - put the answers to the following in the
etherpad:

``` r
time_d <- 180
total_dosage_mg <- 500

# What is the dosage per day (mg)?
time_d/total_dosage_mg 
```

    ## [1] 0.36

Now it’s time to save your code!

#### Functions and their arguments

Functions are canned scripts that automate certain tasks, and all
functions take arguments, and we can look these up using the help
function!

``` r
age_sqrt <- sqrt(50)
age_sqrt
```

    ## [1] 7.071068

#### Vectors and Data Types

A vector is the most common and basic data type in R, and is the
workhorse of R. A vector is composed by a series of values, which can be
either numbers or characters. We can assign a series of values to a
vector using the c() function. `c` stands for concatenate. However, all
the elements in the vector have to be the same type of data.

``` r
# They can contain numbers
age_d <- c(50, 100, 150, 200)
age_d 
```

    ## [1]  50 100 150 200

``` r
# Or characters
treatments <- c("saline","tetramer","IL-13")
treatments
```

    ## [1] "saline"   "tetramer" "IL-13"

Several functions allow you to inspect a vector.

``` r
# To view the number of elements
length(treatments)
```

    ## [1] 3

``` r
# To view the type of data 
class(age_d) 
```

    ## [1] "numeric"

``` r
class(treatments)
```

    ## [1] "character"

``` r
# view the structure 
str(treatments)
```

    ##  chr [1:3] "saline" "tetramer" "IL-13"

``` r
str(age_d)
```

    ##  num [1:4] 50 100 150 200

There are several other important data structures in R that we will
discuss as we move through the course, including `list`, `matrix`, data
frames (`data.frame`), factors (`factor`) and arrays (`arrays`).

##### Subsetting Vectors

To extract a value from a vector you need to provide and index in square
brackets.

``` r
drug <- c("aspirin","tylenol","sudafed")

# to extract the third and second elements
drug[c(3,2)]
```

    ## [1] "sudafed" "tylenol"

##### Conditional Subsetting

``` r
weight_g <- c(25,30,35,40)

# Can ask a logical question
weight_g > 20
```

    ## [1] TRUE TRUE TRUE TRUE

``` r
weight_g < 30
```

    ## [1]  TRUE FALSE FALSE FALSE

``` r
# you can also select values that meet a condition
weight_g[weight_g < 40]
```

    ## [1] 25 30 35

``` r
# Or combine multiple tests with AND `&` and OR `|`
weight_g[weight_g <=30 | weight_g == 40]
```

    ## [1] 25 30 40

You can also search for a list of strings in a vector using the `%in%`
function

``` r
months <- c("Jan","Feb","Mar","Apr")

# Use logical vector to find matches between lists
months[months %in% c("Jan","Mar","July")]
```

    ## [1] "Jan" "Mar"

``` r
# can you find values between 100 and 200 in this list?
weight_lb <- c(55,95,105,187, 201)
```

##### Missing Data

Missing data in vectors is returned as `NA`. In some function you can
add `na.rm = TRUE` to remove the `NA`s.

``` r
heights <- c(2,4,4,NA,6)
mean(heights) # why didn't this work?
```

    ## [1] NA

``` r
mean(heights, na.rm = TRUE)
```

    ## [1] 4

``` r
# You can also select for all values that are not NAs
heights[!is.na(heights)]
```

    ## [1] 2 4 4 6

``` r
# You can also omit NAs
heights <- na.omit(heights)
```

``` r
# Can you return this data frame with no NAs?

weight_g <- c(10,15,16, NA,25, 30, NA)
```

### BREAK: 10:30 - 10:45

### 10:45-11:15: Starting with Data in R: Dataframes

#### Downloading the Data

Now it’s time to download a subset version of the COVID-19 data. The
data is saved in a csv file and is saved on our Github landing page.
<https://github.com/BenaroyaResearch/Data_Carpentry_Workshop_2022/blob/main/WORKSHOP_DATA/Bolouri_2021_subset.csv>

Let’s open the csv table in EXCEL and view it. We have patient metadata,
CYTOF data, and initial CBC counts for different cell populations. The
data is in different formats also.

Download the data to your raw_data folder

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✓ ggplot2 3.3.5     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.6     ✓ dplyr   1.0.8
    ## ✓ tidyr   1.2.0     ✓ stringr 1.4.0
    ## ✓ readr   2.1.2     ✓ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
setwd("/Users/ewitkop/Library/CloudStorage/Box-Box/EW_Bioinformatics_Postdoc_Research/ADMINISTRATIVE/Data_Carpentry_Workshop_June_2022/WORKSHOP_CODE/Data_Carpentry_Workshop_2022/")
data <- read_csv("raw_data/Bolouri_2021_subset.csv")
```

    ## Rows: 299 Columns: 26

    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (11): Sample.ID, Covid.ID, sex, race, patientType, HighestCare, Ever.On....
    ## dbl (15): drawDate, Score, age, bmi, admitDate, deceasedDate, drawTime, CBC....
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

Note how read csv looks at the data type of each column.

#### Inspecting data frames

``` r
# To view whole dataset
print(data,100)
```

    ## # A tibble: 299 × 26
    ##    Sample.ID     drawDate Covid.ID     Score sex     age race    bmi patientType
    ##    <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr> <dbl> <chr>      
    ##  1 SWB343927719     43978 Covid1366599    NA male     54 whit…  69.0 SARS-COV-2…
    ##  2 SWB125388248     43971 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  3 SWB1057697917    43972 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  4 SWB386069501     43940 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  5 SWB827655421     43943 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  6 SWB200026065     43978 Covid1458219    NA fema…    37 whit…  28.4 SARS-COV-2…
    ##  7 SWB258824496     43940 Covid1472094    NA fema…    65 whit…  29.9 SARS-COV-2…
    ##  8 SWB733482852     43939 Covid1490037    NA fema…    94 whit…  28.0 SARS-COV-2…
    ##  9 SWB1084971930    43978 Covid1550447    NA male     79 decl…  25.6 SARS-COV-2…
    ## 10 SWB1078357262    43971 Covid1584168    NA male     75 whit…  23.3 SARS-COV-2…
    ##    HighestCare Ever.On.Ventilat… Preexisting.Hyp… eventId admitDate deceasedDate
    ##    <chr>       <chr>             <chr>            <chr>       <dbl>        <dbl>
    ##  1 Neg         N                 Y                ce1518…     43976           NA
    ##  2 Neg         N                 <NA>             ce1326…     43971           NA
    ##  3 Neg         N                 <NA>             ce1054…     43971           NA
    ##  4 Neg         N                 <NA>             ce1783…     43927           NA
    ##  5 Neg         N                 <NA>             ce1838…     43927           NA
    ##  6 Neg         N                 <NA>             ce1761…     43977           NA
    ##  7 Neg         N                 <NA>             ce1677…     43937           NA
    ##  8 Neg         N                 <NA>             ce1573…     43937           NA
    ##  9 Neg         N                 <NA>             ce1538…     43976           NA
    ## 10 Neg         N                 <NA>             ce1881…     43969           NA
    ## # … with 289 more rows, and 11 more variables: covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>, CBC.Absolute.Neutrophils <dbl>,
    ## #   CBC.Absolute.Lymphocytes <dbl>, FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>,
    ## #   FracCD45.DC <dbl>, T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
# To see the first few lines
head(data)
```

    ## # A tibble: 6 × 26
    ##   Sample.ID     drawDate Covid.ID     Score sex      age race    bmi patientType
    ##   <chr>            <dbl> <chr>        <dbl> <chr>  <dbl> <chr> <dbl> <chr>      
    ## 1 SWB343927719     43978 Covid1366599    NA male      54 whit…  69.0 SARS-COV-2…
    ## 2 SWB125388248     43971 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 3 SWB1057697917    43972 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 4 SWB386069501     43940 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 5 SWB827655421     43943 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 6 SWB200026065     43978 Covid1458219    NA female    37 whit…  28.4 SARS-COV-2…
    ## # … with 17 more variables: HighestCare <chr>, Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
head(data, 100)
```

    ## # A tibble: 100 × 26
    ##    Sample.ID     drawDate Covid.ID     Score sex     age race    bmi patientType
    ##    <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr> <dbl> <chr>      
    ##  1 SWB343927719     43978 Covid1366599    NA male     54 whit…  69.0 SARS-COV-2…
    ##  2 SWB125388248     43971 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  3 SWB1057697917    43972 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  4 SWB386069501     43940 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  5 SWB827655421     43943 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  6 SWB200026065     43978 Covid1458219    NA fema…    37 whit…  28.4 SARS-COV-2…
    ##  7 SWB258824496     43940 Covid1472094    NA fema…    65 whit…  29.9 SARS-COV-2…
    ##  8 SWB733482852     43939 Covid1490037    NA fema…    94 whit…  28.0 SARS-COV-2…
    ##  9 SWB1084971930    43978 Covid1550447    NA male     79 decl…  25.6 SARS-COV-2…
    ## 10 SWB1078357262    43971 Covid1584168    NA male     75 whit…  23.3 SARS-COV-2…
    ## # … with 90 more rows, and 17 more variables: HighestCare <chr>,
    ## #   Ever.On.Ventilator <chr>, Preexisting.Hypertension <chr>, eventId <chr>,
    ## #   admitDate <dbl>, deceasedDate <dbl>, covidId <chr>, severity <chr>,
    ## #   drawTime <dbl>, CBC.White.Blood.Cell.Count <dbl>,
    ## #   CBC.Absolute.Monocytes <dbl>, CBC.Absolute.Neutrophils <dbl>,
    ## #   CBC.Absolute.Lymphocytes <dbl>, FracCD45.Neutrophil <dbl>,
    ## #   FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>, …

``` r
# To see last few lines
tail(data)
```

    ## # A tibble: 6 × 26
    ##   Sample.ID     drawDate Covid.ID     Score sex     age race     bmi patientType
    ##   <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr>  <dbl> <chr>      
    ## 1 SWB1030641467    43960 Covid1992031     6 male     43 nativ…  49.3 SARS-COV-2…
    ## 2 SWB250851795     43964 Covid1992031     6 male     43 nativ…  49.3 SARS-COV-2…
    ## 3 SWB209750009     43968 Covid1992031     6 male     43 nativ…  49.3 SARS-COV-2…
    ## 4 SWB117690763     43971 Covid1992031     6 male     43 nativ…  49.3 SARS-COV-2…
    ## 5 SWB1031605803    43977 Covid1992031     6 male     43 nativ…  49.3 SARS-COV-2…
    ## 6 SWB231587985     43971 Covid1968851     4 male     66 other…  28.3 SARS-COV-2…
    ## # … with 17 more variables: HighestCare <chr>, Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
# To open in R studio
View(data)

# additional helpful commands
nrow(data)
```

    ## [1] 299

``` r
ncol(data)
```

    ## [1] 26

``` r
rownames(data)
```

    ##   [1] "1"   "2"   "3"   "4"   "5"   "6"   "7"   "8"   "9"   "10"  "11"  "12" 
    ##  [13] "13"  "14"  "15"  "16"  "17"  "18"  "19"  "20"  "21"  "22"  "23"  "24" 
    ##  [25] "25"  "26"  "27"  "28"  "29"  "30"  "31"  "32"  "33"  "34"  "35"  "36" 
    ##  [37] "37"  "38"  "39"  "40"  "41"  "42"  "43"  "44"  "45"  "46"  "47"  "48" 
    ##  [49] "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59"  "60" 
    ##  [61] "61"  "62"  "63"  "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71"  "72" 
    ##  [73] "73"  "74"  "75"  "76"  "77"  "78"  "79"  "80"  "81"  "82"  "83"  "84" 
    ##  [85] "85"  "86"  "87"  "88"  "89"  "90"  "91"  "92"  "93"  "94"  "95"  "96" 
    ##  [97] "97"  "98"  "99"  "100" "101" "102" "103" "104" "105" "106" "107" "108"
    ## [109] "109" "110" "111" "112" "113" "114" "115" "116" "117" "118" "119" "120"
    ## [121] "121" "122" "123" "124" "125" "126" "127" "128" "129" "130" "131" "132"
    ## [133] "133" "134" "135" "136" "137" "138" "139" "140" "141" "142" "143" "144"
    ## [145] "145" "146" "147" "148" "149" "150" "151" "152" "153" "154" "155" "156"
    ## [157] "157" "158" "159" "160" "161" "162" "163" "164" "165" "166" "167" "168"
    ## [169] "169" "170" "171" "172" "173" "174" "175" "176" "177" "178" "179" "180"
    ## [181] "181" "182" "183" "184" "185" "186" "187" "188" "189" "190" "191" "192"
    ## [193] "193" "194" "195" "196" "197" "198" "199" "200" "201" "202" "203" "204"
    ## [205] "205" "206" "207" "208" "209" "210" "211" "212" "213" "214" "215" "216"
    ## [217] "217" "218" "219" "220" "221" "222" "223" "224" "225" "226" "227" "228"
    ## [229] "229" "230" "231" "232" "233" "234" "235" "236" "237" "238" "239" "240"
    ## [241] "241" "242" "243" "244" "245" "246" "247" "248" "249" "250" "251" "252"
    ## [253] "253" "254" "255" "256" "257" "258" "259" "260" "261" "262" "263" "264"
    ## [265] "265" "266" "267" "268" "269" "270" "271" "272" "273" "274" "275" "276"
    ## [277] "277" "278" "279" "280" "281" "282" "283" "284" "285" "286" "287" "288"
    ## [289] "289" "290" "291" "292" "293" "294" "295" "296" "297" "298" "299"

``` r
summary(data)
```

    ##   Sample.ID            drawDate       Covid.ID             Score     
    ##  Length:299         Min.   :43926   Length:299         Min.   :2.00  
    ##  Class :character   1st Qu.:43939   Class :character   1st Qu.:4.00  
    ##  Mode  :character   Median :43951   Mode  :character   Median :4.00  
    ##                     Mean   :43951                      Mean   :4.65  
    ##                     3rd Qu.:43963                      3rd Qu.:6.00  
    ##                     Max.   :43978                      Max.   :7.00  
    ##                                                        NA's   :25    
    ##      sex                 age         race                bmi       
    ##  Length:299         Min.   :27   Length:299         Min.   :17.03  
    ##  Class :character   1st Qu.:55   Class :character   1st Qu.:26.64  
    ##  Mode  :character   Median :63   Mode  :character   Median :30.04  
    ##                     Mean   :64                      Mean   :32.44  
    ##                     3rd Qu.:73                      3rd Qu.:36.80  
    ##                     Max.   :97                      Max.   :69.03  
    ##                                                     NA's   :3      
    ##  patientType        HighestCare        Ever.On.Ventilator
    ##  Length:299         Length:299         Length:299        
    ##  Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character  
    ##                                                          
    ##                                                          
    ##                                                          
    ##                                                          
    ##  Preexisting.Hypertension   eventId            admitDate      deceasedDate  
    ##  Length:299               Length:299         Min.   :43910   Min.   :43932  
    ##  Class :character         Class :character   1st Qu.:43931   1st Qu.:43942  
    ##  Mode  :character         Mode  :character   Median :43945   Median :43944  
    ##                                              Mean   :43943   Mean   :43953  
    ##                                              3rd Qu.:43955   3rd Qu.:43950  
    ##                                              Max.   :43978   Max.   :44003  
    ##                                                              NA's   :255    
    ##    covidId            severity            drawTime     
    ##  Length:299         Length:299         Min.   :0.0000  
    ##  Class :character   Class :character   1st Qu.:0.2083  
    ##  Mode  :character   Mode  :character   Median :0.2083  
    ##                                        Mean   :0.2805  
    ##                                        3rd Qu.:0.2083  
    ##                                        Max.   :0.9458  
    ##                                                        
    ##  CBC.White.Blood.Cell.Count CBC.Absolute.Monocytes CBC.Absolute.Neutrophils
    ##  Min.   : 2.100             Min.   :0.000          Min.   : 1.43           
    ##  1st Qu.: 6.200             1st Qu.:0.400          1st Qu.: 4.29           
    ##  Median : 8.500             Median :0.600          Median : 6.18           
    ##  Mean   : 9.028             Mean   :0.651          Mean   : 6.88           
    ##  3rd Qu.:11.000             3rd Qu.:0.900          3rd Qu.: 8.70           
    ##  Max.   :26.900             Max.   :1.600          Max.   :24.48           
    ##  NA's   :10                 NA's   :19             NA's   :19              
    ##  CBC.Absolute.Lymphocytes FracCD45.Neutrophil FracCD45.T.cell.CD4
    ##  Min.   :0.100            Min.   :0.3214      Min.   :0.00302    
    ##  1st Qu.:0.700            1st Qu.:0.6167      1st Qu.:0.03469    
    ##  Median :1.100            Median :0.7144      Median :0.06768    
    ##  Mean   :1.205            Mean   :0.7052      Mean   :0.07955    
    ##  3rd Qu.:1.600            3rd Qu.:0.8010      3rd Qu.:0.11733    
    ##  Max.   :4.880            Max.   :0.9136      Max.   :0.29809    
    ##  NA's   :18                                                      
    ##   FracCD45.DC        T.cell.CD8.HLA_DRp__of.CD8
    ##  Min.   :0.0001324   Min.   : 1.67             
    ##  1st Qu.:0.0036658   1st Qu.: 7.90             
    ##  Median :0.0060225   Median :14.50             
    ##  Mean   :0.0068292   Mean   :17.82             
    ##  3rd Qu.:0.0081830   3rd Qu.:23.85             
    ##  Max.   :0.0358275   Max.   :71.50             
    ## 

What we just loaded was a dataframe, the typical data structure used in
R for tabular data while we will use for statistics and plotting.

In a dataframe columns are vectors of the same length and same type of
data.

``` r
# Based on the output of str(data), what is the class of our data object? How many rows and columns are there? 

str(data)
```

    ## spec_tbl_df [299 × 26] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ Sample.ID                 : chr [1:299] "SWB343927719" "SWB125388248" "SWB1057697917" "SWB386069501" ...
    ##  $ drawDate                  : num [1:299] 43978 43971 43972 43940 43943 ...
    ##  $ Covid.ID                  : chr [1:299] "Covid1366599" "Covid1395204" "Covid1395204" "Covid1425716" ...
    ##  $ Score                     : num [1:299] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sex                       : chr [1:299] "male" "male" "male" "male" ...
    ##  $ age                       : num [1:299] 54 66 66 67 67 37 65 94 79 75 ...
    ##  $ race                      : chr [1:299] "white_caucasian" "native_american_alaska_native" "native_american_alaska_native" "white_caucasian" ...
    ##  $ bmi                       : num [1:299] 69 34.4 34.4 25.7 25.7 ...
    ##  $ patientType               : chr [1:299] "SARS-COV-2 Negative" "SARS-COV-2 Negative" "SARS-COV-2 Negative" "SARS-COV-2 Negative" ...
    ##  $ HighestCare               : chr [1:299] "Neg" "Neg" "Neg" "Neg" ...
    ##  $ Ever.On.Ventilator        : chr [1:299] "N" "N" "N" "N" ...
    ##  $ Preexisting.Hypertension  : chr [1:299] "Y" NA NA NA ...
    ##  $ eventId                   : chr [1:299] "ce1518184" "ce1326419" "ce1054312" "ce1783822" ...
    ##  $ admitDate                 : num [1:299] 43976 43971 43971 43927 43927 ...
    ##  $ deceasedDate              : num [1:299] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ covidId                   : chr [1:299] "Covid1366599" "Covid1395204" "Covid1395204" "Covid1425716" ...
    ##  $ severity                  : chr [1:299] "Neg" "Neg" "Neg" "Neg" ...
    ##  $ drawTime                  : num [1:299] 0.208 0.658 0.208 0.208 0.208 ...
    ##  $ CBC.White.Blood.Cell.Count: num [1:299] 13.6 11.6 9 11.9 14.6 11 6.8 9.6 8.8 22 ...
    ##  $ CBC.Absolute.Monocytes    : num [1:299] 1 1.2 0.63 0.6 1 1 0.4 1.34 0.7 1.1 ...
    ##  $ CBC.Absolute.Neutrophils  : num [1:299] 11.8 9.5 7.38 6.43 9.1 ...
    ##  $ CBC.Absolute.Lymphocytes  : num [1:299] 0.8 0.5 0.72 4.88 4.3 2.6 1.7 2.02 0.3 1.54 ...
    ##  $ FracCD45.Neutrophil       : num [1:299] 0.841 0.7 0.806 0.481 0.526 ...
    ##  $ FracCD45.T.cell.CD4       : num [1:299] 0.0197 0.0496 0.0285 0.1197 0.0674 ...
    ##  $ FracCD45.DC               : num [1:299] 0.00249 0.0052 0.00317 0.00791 0.00626 ...
    ##  $ T.cell.CD8.HLA_DRp__of.CD8: num [1:299] 9.23 5.01 7.7 10.1 12.4 2.46 4.06 15.6 25.3 2.35 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   Sample.ID = col_character(),
    ##   ..   drawDate = col_double(),
    ##   ..   Covid.ID = col_character(),
    ##   ..   Score = col_double(),
    ##   ..   sex = col_character(),
    ##   ..   age = col_double(),
    ##   ..   race = col_character(),
    ##   ..   bmi = col_double(),
    ##   ..   patientType = col_character(),
    ##   ..   HighestCare = col_character(),
    ##   ..   Ever.On.Ventilator = col_character(),
    ##   ..   Preexisting.Hypertension = col_character(),
    ##   ..   eventId = col_character(),
    ##   ..   admitDate = col_double(),
    ##   ..   deceasedDate = col_double(),
    ##   ..   covidId = col_character(),
    ##   ..   severity = col_character(),
    ##   ..   drawTime = col_double(),
    ##   ..   CBC.White.Blood.Cell.Count = col_double(),
    ##   ..   CBC.Absolute.Monocytes = col_double(),
    ##   ..   CBC.Absolute.Neutrophils = col_double(),
    ##   ..   CBC.Absolute.Lymphocytes = col_double(),
    ##   ..   FracCD45.Neutrophil = col_double(),
    ##   ..   FracCD45.T.cell.CD4 = col_double(),
    ##   ..   FracCD45.DC = col_double(),
    ##   ..   T.cell.CD8.HLA_DRp__of.CD8 = col_double()
    ##   .. )
    ##  - attr(*, "problems")=<externalptr>

``` r
nrow(data) # 299
```

    ## [1] 299

``` r
ncol(data) # 26
```

    ## [1] 26

#### Indexing and subsetting data frames

To extract data from a data frame we need to use its coordinates, which
are always row number followed by column number.

``` r
# get first row and column
data[1,1]
```

    ## # A tibble: 1 × 1
    ##   Sample.ID   
    ##   <chr>       
    ## 1 SWB343927719

``` r
# You can save this by assigning it to a variable
data_subset <- data[1,1]

# get only 5th columns
data[,5]
```

    ## # A tibble: 299 × 1
    ##    sex   
    ##    <chr> 
    ##  1 male  
    ##  2 male  
    ##  3 male  
    ##  4 male  
    ##  5 male  
    ##  6 female
    ##  7 female
    ##  8 female
    ##  9 male  
    ## 10 male  
    ## # … with 289 more rows

``` r
# select group of rows and columns
data[1:2,3:6]
```

    ## # A tibble: 2 × 4
    ##   Covid.ID     Score sex     age
    ##   <chr>        <dbl> <chr> <dbl>
    ## 1 Covid1366599    NA male     54
    ## 2 Covid1395204    NA male     66

``` r
# You can also exclude columns using the minus sign
data[,-1]
```

    ## # A tibble: 299 × 25
    ##    drawDate Covid.ID     Score sex      age race     bmi patientType HighestCare
    ##       <dbl> <chr>        <dbl> <chr>  <dbl> <chr>  <dbl> <chr>       <chr>      
    ##  1    43978 Covid1366599    NA male      54 white…  69.0 SARS-COV-2… Neg        
    ##  2    43971 Covid1395204    NA male      66 nativ…  34.4 SARS-COV-2… Neg        
    ##  3    43972 Covid1395204    NA male      66 nativ…  34.4 SARS-COV-2… Neg        
    ##  4    43940 Covid1425716    NA male      67 white…  25.7 SARS-COV-2… Neg        
    ##  5    43943 Covid1425716    NA male      67 white…  25.7 SARS-COV-2… Neg        
    ##  6    43978 Covid1458219    NA female    37 white…  28.4 SARS-COV-2… Neg        
    ##  7    43940 Covid1472094    NA female    65 white…  29.9 SARS-COV-2… Neg        
    ##  8    43939 Covid1490037    NA female    94 white…  28.0 SARS-COV-2… Neg        
    ##  9    43978 Covid1550447    NA male      79 decli…  25.6 SARS-COV-2… Neg        
    ## 10    43971 Covid1584168    NA male      75 white…  23.3 SARS-COV-2… Neg        
    ## # … with 289 more rows, and 16 more variables: Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
# To get only the head of the dataframe you can do
data[-(7:nrow(data)),]
```

    ## # A tibble: 6 × 26
    ##   Sample.ID     drawDate Covid.ID     Score sex      age race    bmi patientType
    ##   <chr>            <dbl> <chr>        <dbl> <chr>  <dbl> <chr> <dbl> <chr>      
    ## 1 SWB343927719     43978 Covid1366599    NA male      54 whit…  69.0 SARS-COV-2…
    ## 2 SWB125388248     43971 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 3 SWB1057697917    43972 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 4 SWB386069501     43940 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 5 SWB827655421     43943 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 6 SWB200026065     43978 Covid1458219    NA female    37 whit…  28.4 SARS-COV-2…
    ## # … with 17 more variables: HighestCare <chr>, Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
# You can also subset by using the name of the column in quotation marks
data[, "Sample.ID"]
```

    ## # A tibble: 299 × 1
    ##    Sample.ID    
    ##    <chr>        
    ##  1 SWB343927719 
    ##  2 SWB125388248 
    ##  3 SWB1057697917
    ##  4 SWB386069501 
    ##  5 SWB827655421 
    ##  6 SWB200026065 
    ##  7 SWB258824496 
    ##  8 SWB733482852 
    ##  9 SWB1084971930
    ## 10 SWB1078357262
    ## # … with 289 more rows

``` r
# Finally you can also use the $ to get a column
data$Sample.ID
```

    ##   [1] "SWB343927719"  "SWB125388248"  "SWB1057697917" "SWB386069501" 
    ##   [5] "SWB827655421"  "SWB200026065"  "SWB258824496"  "SWB733482852" 
    ##   [9] "SWB1084971930" "SWB1078357262" "SWB555276334"  "SWB302673469" 
    ##  [13] "SWB1035736641" "SWB258122016"  "SWB1055020493" "SWB216698474" 
    ##  [17] "SWB354119959"  "SWB305043519"  "SWB115252732"  "SWB226044164" 
    ##  [21] "SWB170917245"  "SWB443953916"  "SWB435038108"  "SWB162851435" 
    ##  [25] "SWB368283451"  "SWB1090292202" "SWB880578286"  "SWB163956617" 
    ##  [29] "SWB1094224548" "SWB884509578"  "SWB190448512"  "SWB100000661" 
    ##  [33] "SWB1040827190" "SWB303821643"  "SWB415598621"  "SWB962108351" 
    ##  [37] "SWB1089858954" "SWB219264173"  "SWB348671489"  "SWB1046794299"
    ##  [41] "SWB325327170"  "SWB1089895368" "SWB745411467"  "SWB338302022" 
    ##  [45] "SWB582266562"  "SWB125385416"  "SWB591094979"  "SWB245378744" 
    ##  [49] "SWB114841480"  "SWB227009524"  "SWB1069997190" "SWB285599378" 
    ##  [53] "SWB761460640"  "SWB574139136"  "SWB422393135"  "SWB144127475" 
    ##  [57] "SWB643844681"  "SWB745306795"  "SWB731501611"  "SWB153987642" 
    ##  [61] "SWB396519083"  "SWB167833243"  "SWB1032014586" "SWB1064177149"
    ##  [65] "SWB314377127"  "SWB266114095"  "SWB205168019"  "SWB203056667" 
    ##  [69] "SWB1005999121" "SWB117509040"  "SWB474988649"  "SWB171918140" 
    ##  [73] "SWB1006370538" "SWB130003945"  "SWB1007811075" "SWB1042418083"
    ##  [77] "SWB357683007"  "SWB1067405817" "SWB179050005"  "SWB1094410129"
    ##  [81] "SWB508500322"  "SWB363667742"  "SWB737563346"  "SWB171855639" 
    ##  [85] "SWB104438684"  "SWB1004287499" "SWB440771513"  "SWB317858129" 
    ##  [89] "SWB447361971"  "SWB288065067"  "SWB626016460"  "SWB1061853147"
    ##  [93] "SWB1006920918" "SWB215787516"  "SWB577399117"  "SWB1032222707"
    ##  [97] "SWB877788842"  "SWB687061292"  "SWB990382895"  "SWB611717516" 
    ## [101] "SWB722862172"  "SWB416555296"  "SWB1022471212" "SWB186599700" 
    ## [105] "SWB614399879"  "SWB257855274"  "SWB327349634"  "SWB554650476" 
    ## [109] "SWB378534264"  "SWB571713547"  "SWB1072405753" "SWB164838634" 
    ## [113] "SWB124351461"  "SWB311073107"  "SWB134019181"  "SWB423284233" 
    ## [117] "SWB1010154113" "SWB333383561"  "SWB196474700"  "SWB227194018" 
    ## [121] "SWB180135494"  "SWB665730390"  "SWB559628175"  "SWB1021054163"
    ## [125] "SWB183641980"  "SWB353819528"  "SWB144617885"  "SWB1086588216"
    ## [129] "SWB311059340"  "SWB694338934"  "SWB606784480"  "SWB506116356" 
    ## [133] "SWB1032615104" "SWB176872640"  "SWB1062588127" "SWB105325695" 
    ## [137] "SWB709089639"  "SWB101474884"  "SWB314066371"  "SWB762638766" 
    ## [141] "SWB110499849"  "SWB1047795090" "SWB396784327"  "SWB490708504" 
    ## [145] "SWB833793078"  "SWB892604512"  "SWB180292825"  "SWB775107411" 
    ## [149] "SWB1076871858" "SWB433661764"  "SWB166464933"  "SWB210727695" 
    ## [153] "SWB1081329726" "SWB235913611"  "SWB184010667"  "SWB364614827" 
    ## [157] "SWB345936186"  "SWB129835986"  "SWB292962231"  "SWB201676705" 
    ## [161] "SWB612772517"  "SWB220967189"  "SWB1071913451" "SWB224464193" 
    ## [165] "SWB347838583"  "SWB470319312"  "SWB592141069"  "SWB1087415338"
    ## [169] "SWB219290549"  "SWB1043116165" "SWB324145882"  "SWB1040120060"
    ## [173] "SWB254432726"  "SWB697877130"  "SWB118473016"  "SWB272679954" 
    ## [177] "SWB419122753"  "SWB1014124823" "SWB334104343"  "SWB753585273" 
    ## [181] "SWB1053696821" "SWB1091394540" "SWB496086687"  "SWB292145490" 
    ## [185] "SWB728937188"  "SWB459933167"  "SWB1001584606" "SWB302160471" 
    ## [189] "SWB161172632"  "SWB288477469"  "SWB758508438"  "SWB348185149" 
    ## [193] "SWB1029165728" "SWB1084698694" "SWB434379651"  "SWB1055196030"
    ## [197] "SWB185550711"  "SWB1096675304" "SWB184339182"  "SWB154287237" 
    ## [201] "SWB1078232855" "SWB159994817"  "SWB1065967402" "SWB303023711" 
    ## [205] "SWB347236696"  "SWB149021787"  "SWB1035727975" "SWB1000617067"
    ## [209] "SWB126579584"  "SWB600902908"  "SWB333116474"  "SWB683006749" 
    ## [213] "SWB344298839"  "SWB127431461"  "SWB426896583"  "SWB1021849359"
    ## [217] "SWB631575542"  "SWB386540011"  "SWB515562450"  "SWB307415375" 
    ## [221] "SWB357704928"  "SWB194891159"  "SWB1046935744" "SWB1049921062"
    ## [225] "SWB1006388106" "SWB196809482"  "SWB1025808848" "SWB1098656440"
    ## [229] "SWB808115757"  "SWB205655342"  "SWB1009124954" "SWB1049871585"
    ## [233] "SWB277748518"  "SWB675832338"  "SWB463296017"  "SWB200595533" 
    ## [237] "SWB1055481611" "SWB492211130"  "SWB309016142"  "SWB512540212" 
    ## [241] "SWB242544000"  "SWB388237841"  "SWB182970260"  "SWB294693450" 
    ## [245] "SWB289113826"  "SWB1048855973" "SWB236568486"  "SWB824605621" 
    ## [249] "SWB166794768"  "SWB302506201"  "SWB1014284337" "SWB235253173" 
    ## [253] "SWB129267037"  "SWB1029808679" "SWB206593075"  "SWB121298063" 
    ## [257] "SWB658958485"  "SWB125119422"  "SWB1045425844" "SWB319841991" 
    ## [261] "SWB131286416"  "SWB1064235283" "SWB423741641"  "SWB1018749596"
    ## [265] "SWB239036731"  "SWB510654620"  "SWB329767319"  "SWB384619829" 
    ## [269] "SWB352090153"  "SWB239077602"  "SWB251002135"  "SWB225863457" 
    ## [273] "SWB701521765"  "SWB218393110"  "SWB153304465"  "SWB809102561" 
    ## [277] "SWB377713116"  "SWB1053765693" "SWB432212372"  "SWB374852674" 
    ## [281] "SWB1060014163" "SWB328797939"  "SWB277202346"  "SWB474582059" 
    ## [285] "SWB1076265469" "SWB220405756"  "SWB1010765728" "SWB108563173" 
    ## [289] "SWB1087942719" "SWB1007379952" "SWB476353238"  "SWB1093919404"
    ## [293] "SWB148712746"  "SWB1030641467" "SWB250851795"  "SWB209750009" 
    ## [297] "SWB117690763"  "SWB1031605803" "SWB231587985"

Challenge time!

``` r
#Create a data.frame (surveys_200) containing only the data in row 200 of the surveys dataset.

# Pull out the last row of the data frame and save it
```

Let’s take five minutes for this challenge so you can have a breather
before starting the final piece of our first day!

### 11:15-12:00pm: Starting with Data in R Cont:

#### Factors

Several of our data columns contain character data that are categorical
variables. `Factor` is a special class used for working with categorical
data. Factors only contain a list of pre-defined levels. Though factors
may often look like character vectors, they are actually treated as
integer vectors, so you need to be careful when treating them as
strings.

``` r
# Use the factor function to convert column levels to factors 
data$sex <- factor(data$sex) 

# check the conversion worked with summary and class
summary(data$sex)
```

    ## female   male 
    ##    125    174

``` r
class(data$sex)
```

    ## [1] "factor"

``` r
# Note that factors are always assigned in alphabetical order. Check the levels of a factor with levels
levels(data$sex) # see that female comes before male
```

    ## [1] "female" "male"

``` r
# Get the number of levels with n level 
nlevels(data$sex)
```

    ## [1] 2

Sometimes you may want your levels in specific order.

``` r
data$sex <- factor(data$sex, levels = c("male","female"))
levels(data$sex)
```

    ## [1] "male"   "female"

Challenge

``` r
# Convert the HigestCare column to a factor and put the levels in this order: Neg, Floor, CCU, Outpatient

levels(as.factor(data$HighestCare)) # "CCU"        "Floor"      "Neg"        "Outpatient"
```

    ## [1] "CCU"        "Floor"      "Neg"        "Outpatient"

``` r
data$HighestCare <- factor(data$HighestCare, levels = c("Neg","Floor","CCU","Outpatient"))
```

#### Converting factors

To convert a factor to character vector you can use `as.character(x)`

``` r
as.character(data$sex)
```

    ##   [1] "male"   "male"   "male"   "male"   "male"   "female" "female" "female"
    ##   [9] "male"   "male"   "male"   "female" "male"   "male"   "male"   "female"
    ##  [17] "female" "female" "male"   "female" "female" "female" "female" "female"
    ##  [25] "female" "female" "female" "female" "female" "female" "male"   "male"  
    ##  [33] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ##  [41] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "female"
    ##  [49] "female" "female" "female" "female" "female" "female" "female" "female"
    ##  [57] "female" "female" "male"   "male"   "male"   "female" "male"   "male"  
    ##  [65] "male"   "male"   "male"   "female" "female" "female" "male"   "male"  
    ##  [73] "female" "male"   "female" "male"   "female" "male"   "male"   "male"  
    ##  [81] "female" "female" "female" "female" "male"   "female" "female" "female"
    ##  [89] "female" "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ##  [97] "male"   "male"   "female" "male"   "male"   "male"   "female" "male"  
    ## [105] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "female"
    ## [113] "female" "female" "female" "female" "female" "female" "female" "female"
    ## [121] "female" "female" "male"   "male"   "male"   "male"   "male"   "male"  
    ## [129] "male"   "male"   "female" "female" "male"   "male"   "male"   "male"  
    ## [137] "male"   "male"   "male"   "male"   "female" "female" "female" "female"
    ## [145] "female" "female" "female" "female" "female" "female" "female" "male"  
    ## [153] "male"   "male"   "female" "male"   "male"   "male"   "male"   "male"  
    ## [161] "female" "male"   "male"   "female" "female" "female" "female" "female"
    ## [169] "female" "female" "female" "male"   "male"   "male"   "female" "female"
    ## [177] "female" "female" "female" "male"   "male"   "male"   "male"   "male"  
    ## [185] "male"   "female" "female" "male"   "male"   "male"   "male"   "male"  
    ## [193] "female" "female" "female" "male"   "female" "male"   "male"   "female"
    ## [201] "female" "female" "female" "male"   "male"   "male"   "male"   "male"  
    ## [209] "male"   "female" "male"   "male"   "male"   "male"   "male"   "male"  
    ## [217] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ## [225] "male"   "male"   "female" "female" "female" "female" "female" "female"
    ## [233] "female" "female" "male"   "female" "female" "female" "female" "female"
    ## [241] "female" "female" "male"   "male"   "male"   "male"   "male"   "male"  
    ## [249] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ## [257] "male"   "male"   "male"   "female" "female" "female" "female" "female"
    ## [265] "female" "female" "female" "female" "female" "female" "female" "female"
    ## [273] "female" "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ## [281] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ## [289] "male"   "male"   "male"   "male"   "male"   "male"   "male"   "male"  
    ## [297] "male"   "male"   "male"

#### Renaming Factors

With your data stored as factors you can use the `plot()` function to
quickly see the number of observations in each factor level

``` r
plot(data$HighestCare)
```

![](Full_Data_Carpentry_Workshop_2022_files/figure-gfm/plot_factor-1.png)<!-- -->
However say we wanted to rename the Negative group from Neg to Negative.

``` r
levels(data$HighestCare)[1] <- "Negative"
plot(data$HighestCare)
```

![](Full_Data_Carpentry_Workshop_2022_files/figure-gfm/rename_factor-1.png)<!-- -->
We can also use this to rename any NA levels we may have. For example,
lets make the `Ever.On.Ventilator` column a factor and plot it.

``` r
data$Ever.On.Ventilator <- factor(data$Ever.On.Ventilator)
plot(data$Ever.On.Ventilator)
```

![](Full_Data_Carpentry_Workshop_2022_files/figure-gfm/rename-1.png)<!-- -->

``` r
# But what about the NAs samples that we know are there?

# turn the missing values into a factor levels with the addNA() function
data$Ever.On.Ventilator <- addNA(data$Ever.On.Ventilator)
levels(data$Ever.On.Ventilator)
```

    ## [1] "N" "Y" NA

``` r
# And rename the NA
levels(data$Ever.On.Ventilator)[3] <- "Not Applicable"

# now we can replot and see this new added level
plot(data$Ever.On.Ventilator)
```

![](Full_Data_Carpentry_Workshop_2022_files/figure-gfm/rename-2.png)<!-- -->
Challenge!

``` r
# Now that we have renamed the Ever.On.Ventilator column, can you reorder the levels so that the "Not Applicable" patients are plotted before  the "N" patients?
data$Ever.On.Ventilator <- factor(data$Ever.On.Ventilator, levels = c("Not Applicable","N","Y"))

plot(data$Ever.On.Ventilator)
```

![](Full_Data_Carpentry_Workshop_2022_files/figure-gfm/challenge_7-1.png)<!-- -->
#### Saving and exporting data

Now that we have done a variety of data manipulations, we want to save
our output.

``` r
# lets output in our results folder
write.csv(data, file="Data_Carpentry_Workshop_2022/results/data_day1.csv", row.names = FALSE)
```

When you close out R Studio you will see the option to save your current
session objects. I typically do, though sometimes this can get you into
troubl as you are approaching the edge of R’s memory.

## DAY 2

### 9:00am: Manipulating Data in R

Using brackets to subset data can be cumbersome, so in comes the `dplyr`
package which has a set of functions designed for tabular data
manipulation. The `tidyverse` package we loaded yesterday already
includes this package as well as a few others, like `ggplot2`, `tidyr`
which we will use today. The `tidyr` allows for more simple reshaping of
the data for plotting and other data analysis tasks. Note that online
and in R studio there are helpful cheatsheets that have a list of
functions in both `dplyr` and `tidyr` that are very useful references.

To access go to `Help` \> `Cheatsheets`

``` r
# Note that every time you restart R you need to reload your packages

library(tidyverse)

# Let's also load in our data that we exported yesterday at the end of our session
data2 <- read_csv("Data_Carpentry_Workshop_2022/results/data_day1.csv")
```

    ## Rows: 299 Columns: 26
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr (11): Sample.ID, Covid.ID, sex, race, patientType, HighestCare, Ever.On....
    ## dbl (15): drawDate, Score, age, bmi, admitDate, deceasedDate, drawTime, CBC....
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

Now we’re going to learn some of the most useful `dplyr` data
manipulation functions.

-   `select()`: subset columns
-   `filter()`: subset rows on conditions
-   `mutate()`: create new columns by using information from other
    columns
-   `group_by()` and `summarize()`: create summary statistics on grouped
    data
-   `arrange()`: sort results
-   `count()`: count discrete values

#### Selecting columns and filtering rows

``` r
select(data2, Sample.ID, age, bmi) # put the name of the df first, followed by the columns names
```

    ## # A tibble: 299 × 3
    ##    Sample.ID       age   bmi
    ##    <chr>         <dbl> <dbl>
    ##  1 SWB343927719     54  69.0
    ##  2 SWB125388248     66  34.4
    ##  3 SWB1057697917    66  34.4
    ##  4 SWB386069501     67  25.7
    ##  5 SWB827655421     67  25.7
    ##  6 SWB200026065     37  28.4
    ##  7 SWB258824496     65  29.9
    ##  8 SWB733482852     94  28.0
    ##  9 SWB1084971930    79  25.6
    ## 10 SWB1078357262    75  23.3
    ## # … with 289 more rows

``` r
# use the minus "-" symbol to select all except certain columns
select(data2, -sex, -race)
```

    ## # A tibble: 299 × 24
    ##    Sample.ID     drawDate Covid.ID     Score   age   bmi patientType HighestCare
    ##    <chr>            <dbl> <chr>        <dbl> <dbl> <dbl> <chr>       <chr>      
    ##  1 SWB343927719     43978 Covid1366599    NA    54  69.0 SARS-COV-2… Negative   
    ##  2 SWB125388248     43971 Covid1395204    NA    66  34.4 SARS-COV-2… Negative   
    ##  3 SWB1057697917    43972 Covid1395204    NA    66  34.4 SARS-COV-2… Negative   
    ##  4 SWB386069501     43940 Covid1425716    NA    67  25.7 SARS-COV-2… Negative   
    ##  5 SWB827655421     43943 Covid1425716    NA    67  25.7 SARS-COV-2… Negative   
    ##  6 SWB200026065     43978 Covid1458219    NA    37  28.4 SARS-COV-2… Negative   
    ##  7 SWB258824496     43940 Covid1472094    NA    65  29.9 SARS-COV-2… Negative   
    ##  8 SWB733482852     43939 Covid1490037    NA    94  28.0 SARS-COV-2… Negative   
    ##  9 SWB1084971930    43978 Covid1550447    NA    79  25.6 SARS-COV-2… Negative   
    ## 10 SWB1078357262    43971 Covid1584168    NA    75  23.3 SARS-COV-2… Negative   
    ## # … with 289 more rows, and 16 more variables: Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
# you can also select rows based on certain criteria using filter
filter(data2, HighestCare == "Outpatient")
```

    ## # A tibble: 8 × 26
    ##   Sample.ID     drawDate Covid.ID     Score sex      age race    bmi patientType
    ##   <chr>            <dbl> <chr>        <dbl> <chr>  <dbl> <chr> <dbl> <chr>      
    ## 1 SWB474988649     43937 Covid1216277     2 male      54 whit…  NA   SARS-COV-2…
    ## 2 SWB1006370538    43967 Covid1299092     2 female    27 othe…  NA   SARS-COV-2…
    ## 3 SWB130003945     43962 Covid1414426     2 male      28 asian  NA   SARS-COV-2…
    ## 4 SWB1042418083    43962 Covid1769995     2 male      76 asian  27.3 SARS-COV-2…
    ## 5 SWB1094410129    43934 Covid1876926     2 male      56 whit…  37.2 SARS-COV-2…
    ## 6 SWB508500322     43942 Covid1889889     2 female    28 blac…  22.5 SARS-COV-2…
    ## 7 SWB363667742     43931 Covid1970770     2 female    67 asian  23.7 SARS-COV-2…
    ## 8 SWB737563346     43934 Covid1970770     2 female    67 asian  23.7 SARS-COV-2…
    ## # … with 17 more variables: HighestCare <chr>, Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>

``` r
filter(data2, age <= 50)
```

    ## # A tibble: 56 × 26
    ##    Sample.ID     drawDate Covid.ID     Score sex     age race    bmi patientType
    ##    <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr> <dbl> <chr>      
    ##  1 SWB200026065     43978 Covid1458219    NA fema…    37 whit…  28.4 SARS-COV-2…
    ##  2 SWB302673469     43939 Covid1601623    NA fema…    30 whit…  31.8 SARS-COV-2…
    ##  3 SWB435038108     43971 Covid1945628    NA fema…    48 whit…  30.2 SARS-COV-2…
    ##  4 SWB162851435     43972 Covid1945628    NA fema…    48 whit…  30.2 SARS-COV-2…
    ##  5 SWB368283451     43971 Covid1240633    NA fema…    43 whit…  25.1 SARS-COV-2…
    ##  6 SWB1006370538    43967 Covid1299092     2 fema…    27 othe…  NA   SARS-COV-2…
    ##  7 SWB130003945     43962 Covid1414426     2 male     28 asian  NA   SARS-COV-2…
    ##  8 SWB1007811075    43951 Covid1701495     2 fema…    41 othe…  54.1 SARS-COV-2…
    ##  9 SWB508500322     43942 Covid1889889     2 fema…    28 blac…  22.5 SARS-COV-2…
    ## 10 SWB104438684     43948 Covid1006658     3 male     34 whit…  33.3 SARS-COV-2…
    ## # … with 46 more rows, and 17 more variables: HighestCare <chr>,
    ## #   Ever.On.Ventilator <chr>, Preexisting.Hypertension <chr>, eventId <chr>,
    ## #   admitDate <dbl>, deceasedDate <dbl>, covidId <chr>, severity <chr>,
    ## #   drawTime <dbl>, CBC.White.Blood.Cell.Count <dbl>,
    ## #   CBC.Absolute.Monocytes <dbl>, CBC.Absolute.Neutrophils <dbl>,
    ## #   CBC.Absolute.Lymphocytes <dbl>, FracCD45.Neutrophil <dbl>,
    ## #   FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>, …

#### Pipes

What if you want to filter and select at the same time? You can either
do this in intermediate steps, nesting functions, or running the
functions one after the other on the same dataset using pipes.

``` r
# Intermediate steps
data2_subset <- filter(data2, bmi < 30)
data2_subset <- select(data2_subset, Sample.ID, age, severity)

# Nest the functions
data2_subset <- select(filter(data2, bmi < 30), Sample.ID, age, severity)

# nesting  can get hard to read

# Use the pipe operator %>% 
# Pipes in R look like %>% and are made available via the magrittr package, installed automatically with dplyr. If you use RStudio, you can type the pipe with Ctrl + Shift + M if you have a PC or Cmd + Shift + M if you have a Mac.

data2 %>%
  filter(bmi < 30) %>% 
  select(Sample.ID, age, severity)
```

    ## # A tibble: 146 × 3
    ##    Sample.ID       age severity
    ##    <chr>         <dbl> <chr>   
    ##  1 SWB386069501     67 Neg     
    ##  2 SWB827655421     67 Neg     
    ##  3 SWB200026065     37 Neg     
    ##  4 SWB258824496     65 Neg     
    ##  5 SWB733482852     94 Neg     
    ##  6 SWB1084971930    79 Neg     
    ##  7 SWB1078357262    75 Neg     
    ##  8 SWB555276334     75 Neg     
    ##  9 SWB1035736641    88 Neg     
    ## 10 SWB258122016     88 Neg     
    ## # … with 136 more rows

``` r
# the pipe passes the data from one operation to another and goes step by step, it is like saying the word "then" at each pipe 


# We can create a new object with this filtered data
data2_sml <- data2 %>%
  filter(bmi < 30) %>% 
  select(Sample.ID, age, severity)

data2_sml
```

    ## # A tibble: 146 × 3
    ##    Sample.ID       age severity
    ##    <chr>         <dbl> <chr>   
    ##  1 SWB386069501     67 Neg     
    ##  2 SWB827655421     67 Neg     
    ##  3 SWB200026065     37 Neg     
    ##  4 SWB258824496     65 Neg     
    ##  5 SWB733482852     94 Neg     
    ##  6 SWB1084971930    79 Neg     
    ##  7 SWB1078357262    75 Neg     
    ##  8 SWB555276334     75 Neg     
    ##  9 SWB1035736641    88 Neg     
    ## 10 SWB258122016     88 Neg     
    ## # … with 136 more rows

Challenge

``` r
# Using pipes, subset data2 to keep only patients with a COVID score at or below 4, whose highest care was NOT CCU, and retain only their Sample.ID, age, sex, and bmi.

data2_subset <- data2 %>% 
  filter(Score <= 4) %>% 
  filter(HighestCare != "CCU" ) %>%
  select(Sample.ID, age,sex, bmi)
```

#### Mutate

It is often the case that you want to perform some manipulation on an
existing column and make a new column. You can do this using the
function `mutate`

``` r
# lets create a new column where we calculate a persons age in months
data2 %>%
  mutate(age_months = age*12)
```

    ## # A tibble: 299 × 27
    ##    Sample.ID     drawDate Covid.ID     Score sex     age race    bmi patientType
    ##    <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr> <dbl> <chr>      
    ##  1 SWB343927719     43978 Covid1366599    NA male     54 whit…  69.0 SARS-COV-2…
    ##  2 SWB125388248     43971 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  3 SWB1057697917    43972 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  4 SWB386069501     43940 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  5 SWB827655421     43943 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  6 SWB200026065     43978 Covid1458219    NA fema…    37 whit…  28.4 SARS-COV-2…
    ##  7 SWB258824496     43940 Covid1472094    NA fema…    65 whit…  29.9 SARS-COV-2…
    ##  8 SWB733482852     43939 Covid1490037    NA fema…    94 whit…  28.0 SARS-COV-2…
    ##  9 SWB1084971930    43978 Covid1550447    NA male     79 decl…  25.6 SARS-COV-2…
    ## 10 SWB1078357262    43971 Covid1584168    NA male     75 whit…  23.3 SARS-COV-2…
    ## # … with 289 more rows, and 18 more variables: HighestCare <chr>,
    ## #   Ever.On.Ventilator <chr>, Preexisting.Hypertension <chr>, eventId <chr>,
    ## #   admitDate <dbl>, deceasedDate <dbl>, covidId <chr>, severity <chr>,
    ## #   drawTime <dbl>, CBC.White.Blood.Cell.Count <dbl>,
    ## #   CBC.Absolute.Monocytes <dbl>, CBC.Absolute.Neutrophils <dbl>,
    ## #   CBC.Absolute.Lymphocytes <dbl>, FracCD45.Neutrophil <dbl>,
    ## #   FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>, …

``` r
# Can also do multiple mutates one after the other
data2 %>% 
  mutate(age_months = age*12,
         age_d = age_months*30)
```

    ## # A tibble: 299 × 28
    ##    Sample.ID     drawDate Covid.ID     Score sex     age race    bmi patientType
    ##    <chr>            <dbl> <chr>        <dbl> <chr> <dbl> <chr> <dbl> <chr>      
    ##  1 SWB343927719     43978 Covid1366599    NA male     54 whit…  69.0 SARS-COV-2…
    ##  2 SWB125388248     43971 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  3 SWB1057697917    43972 Covid1395204    NA male     66 nati…  34.4 SARS-COV-2…
    ##  4 SWB386069501     43940 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  5 SWB827655421     43943 Covid1425716    NA male     67 whit…  25.7 SARS-COV-2…
    ##  6 SWB200026065     43978 Covid1458219    NA fema…    37 whit…  28.4 SARS-COV-2…
    ##  7 SWB258824496     43940 Covid1472094    NA fema…    65 whit…  29.9 SARS-COV-2…
    ##  8 SWB733482852     43939 Covid1490037    NA fema…    94 whit…  28.0 SARS-COV-2…
    ##  9 SWB1084971930    43978 Covid1550447    NA male     79 decl…  25.6 SARS-COV-2…
    ## 10 SWB1078357262    43971 Covid1584168    NA male     75 whit…  23.3 SARS-COV-2…
    ## # … with 289 more rows, and 19 more variables: HighestCare <chr>,
    ## #   Ever.On.Ventilator <chr>, Preexisting.Hypertension <chr>, eventId <chr>,
    ## #   admitDate <dbl>, deceasedDate <dbl>, covidId <chr>, severity <chr>,
    ## #   drawTime <dbl>, CBC.White.Blood.Cell.Count <dbl>,
    ## #   CBC.Absolute.Monocytes <dbl>, CBC.Absolute.Neutrophils <dbl>,
    ## #   CBC.Absolute.Lymphocytes <dbl>, FracCD45.Neutrophil <dbl>,
    ## #   FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>, …

``` r
# Pipes work with non plyr functions as well. For example, we canAdd head() to view the first #few rows
data2 %>% 
  mutate(age_months = age*12,
         age_d = age_months*30) %>%
  head()
```

    ## # A tibble: 6 × 28
    ##   Sample.ID     drawDate Covid.ID     Score sex      age race    bmi patientType
    ##   <chr>            <dbl> <chr>        <dbl> <chr>  <dbl> <chr> <dbl> <chr>      
    ## 1 SWB343927719     43978 Covid1366599    NA male      54 whit…  69.0 SARS-COV-2…
    ## 2 SWB125388248     43971 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 3 SWB1057697917    43972 Covid1395204    NA male      66 nati…  34.4 SARS-COV-2…
    ## 4 SWB386069501     43940 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 5 SWB827655421     43943 Covid1425716    NA male      67 whit…  25.7 SARS-COV-2…
    ## 6 SWB200026065     43978 Covid1458219    NA female    37 whit…  28.4 SARS-COV-2…
    ## # … with 19 more variables: HighestCare <chr>, Ever.On.Ventilator <chr>,
    ## #   Preexisting.Hypertension <chr>, eventId <chr>, admitDate <dbl>,
    ## #   deceasedDate <dbl>, covidId <chr>, severity <chr>, drawTime <dbl>,
    ## #   CBC.White.Blood.Cell.Count <dbl>, CBC.Absolute.Monocytes <dbl>,
    ## #   CBC.Absolute.Neutrophils <dbl>, CBC.Absolute.Lymphocytes <dbl>,
    ## #   FracCD45.Neutrophil <dbl>, FracCD45.T.cell.CD4 <dbl>, FracCD45.DC <dbl>,
    ## #   T.cell.CD8.HLA_DRp__of.CD8 <dbl>, age_months <dbl>, age_d <dbl>

Let’s say we now wanted to calculate the mean bmi of measured patients.

``` r
data2_mean_bmi <- data2 %>% 
  mutate(mean_bmi = mean(bmi))
data2_mean_bmi$mean_bmi # this returns all NA's? Why?
```

    ##   [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [26] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [51] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ##  [76] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [101] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [126] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [151] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [176] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [201] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [226] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [251] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [276] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

``` r
# Let's view the original data
data2$bmi # as we can see there are a few NA's here that are preventing our calculation from running correctly
```

    ##   [1] 69.03 34.35 34.35 25.74 25.74 28.36 29.86 27.99 25.59 23.33 23.33 31.81
    ##  [13] 25.80 25.80 25.80 21.21 21.21 21.21 21.13 25.42 22.81 23.01 30.22 30.22
    ##  [25] 25.12 23.44 23.44 23.44 23.44 23.44 35.80 35.80 35.80 35.80 35.80 45.40
    ##  [37] 45.40 45.40 45.40 45.40 45.40 45.40 45.40 45.40 45.40 45.40 45.40 31.33
    ##  [49] 31.33 31.33 31.33 31.33 31.33 31.33 31.33 31.33 31.33 31.33 18.14 18.14
    ##  [61] 18.14 46.48 27.19 27.19 27.19 27.19 27.19 21.15 21.15 18.49    NA 36.98
    ##  [73]    NA    NA 54.13 27.33 21.97 26.29 30.04 37.21 22.46 23.71 23.71 29.39
    ##  [85] 33.33 27.24 27.24 18.49 18.49 33.57 33.57 27.99 27.99 27.99 27.99 27.99
    ##  [97] 36.98 36.98 29.82 33.81 33.81 33.81 33.61 42.78 17.03 17.03 17.03 17.03
    ## [109] 17.03 17.03 17.03 40.45 40.45 40.45 40.45 40.45 30.45 30.45 30.45 21.97
    ## [121] 21.97 21.97 26.29 20.52 20.52 20.52 25.50 26.12 26.12 26.12 27.24 23.63
    ## [133] 33.57 33.57 33.57 33.57 33.57 33.57 27.99 36.98 27.97 27.97 36.77 36.77
    ## [145] 36.77 36.77 36.77 36.77 36.77 29.82 24.57 45.24 45.24 45.24 22.10 27.57
    ## [157] 27.57 27.57 27.57 27.57 34.18 42.78 42.78 31.55 31.55 31.55 22.26 22.26
    ## [169] 22.26 22.26 40.45 32.84 32.84 32.84 54.13 54.13 54.13 54.13 54.13 21.82
    ## [181] 21.82 21.82 21.82 26.29 26.29 36.90 36.90 30.04 30.04 30.04 30.04 40.93
    ## [193] 30.19 30.19 30.19 26.12 27.24 33.57 44.50 29.82 29.82 29.82 29.82 28.30
    ## [205] 23.51 23.51 26.12 26.12 26.12 27.24 33.57 33.57 33.57 33.57 33.57 33.57
    ## [217] 33.57 33.57 33.57 33.57 44.50 44.50 44.50 44.50 44.50 44.50 27.97 27.97
    ## [229] 27.97 27.97 27.97 27.97 27.97 36.77 45.24 48.85 48.85 48.85 48.85 48.85
    ## [241] 48.85 48.85 28.30 28.30 28.30 28.30 28.30 28.30 28.30 28.30 28.30 28.30
    ## [253] 28.30 28.30 28.30 28.30 28.30 28.30 28.30 54.53 54.53 54.53 54.53 54.53
    ## [265] 34.18 34.18 34.18 26.76 26.76 26.76 26.76 30.45 30.45 40.93 40.93 40.93
    ## [277] 40.93 40.93 40.93 23.51 23.51 23.51 28.31 28.31 28.31 28.31 28.31 28.31
    ## [289] 28.31 28.31 49.27 49.27 49.27 49.27 49.27 49.27 49.27 49.27 28.31

``` r
# we can filter out these NAs and then run the function
data2 %>%  
  filter(!is.na(bmi)) %>%
  mutate(mean_bmi = mean(bmi)) %>%
  View()
```

### 10:15am-10:30am: BREAK

### 10:30-12:00pm: Visualizing Data in R with ggplot

#### STOP FOR THE DAY AT PLOTTING TIME SERIES DATA
