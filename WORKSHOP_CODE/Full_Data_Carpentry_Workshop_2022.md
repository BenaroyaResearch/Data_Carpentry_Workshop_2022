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
repository - `/raw_data/` - `/scripts/` - `/figures/`

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

#### BREAK: 10:30 - 10:45

#### 10:45-11:15: Starting with Data in R: Dataframes

#### 11:15-12:00pm: Starting with Data in R Cont: