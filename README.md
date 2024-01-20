# BSDS 100: Intro to Data Science with R

## Cody Carroll

**Email**: cjcarroll@usfca.edu

**Class Time**: 12:45 pm - 2:30 pm,	TR in LS 103

**Office Hours**:  M 11a-12p on [Zoom](https://usfca.zoom.us/my/cody.carroll) and W 1:45p-2:45p in the Hive (Harney Engineering area),  starts Week 2

**Book**: [R for Data Science](http://r4ds.had.co.nz/index.html) by Hadley Wickham and Garrett Grolemund

**Syllabus**: [Link](https://github.com/codycarroll/Intro-DS-S24/blob/main/Syllabus/BSDS100-Spring-2024-Syllabus.pdf)

## Course Learning Outcomes

By the end of this course, you will be able to

- Proficiently wrangle, manipulate, and explore data using the R programming language
- Utilize contemporary R libraries including *ggplot2*, *tibble*, *tidyr*, *dplyr*, *knitr*, and *stringr*
- Visualize, present, and communicate trends in a variety of data types
- Communicate results using R markdown
- Formulate data-driven hypotheses using exploratory data analysis and introductory model building techniques

## Course Tenets:

When in doubt, rely on the following:
- Put the work in & ask for help when stuck.
- Ask questions before spiraling.
- When confused, work with a partner & zoom into details.
- When you understand, teach others & zoom out to debrief.
- Use common sense whenever possible.

## Course Overview

### Assessment

The focus of this course will be to provide you with the basic techniques available for making informed, data-driven decisions using the R programming language. This course will provide you the intuition to make hypotheses about complex questions through visualization, wrangling, manipulation, and exploration of data. The course will be graded based on the following components:

- **Attendance** (15%): Attendance is checked at the beginning of class. It is your responsibility to show up on time. You will lose 1.5 points from this grade for every unexcused absence, and 0.5 points for every class period you show up late (i.e., after class has started but still within the first 15 minutes of class). 

     For example: If at the end of the semester, you had 1 unexcused absence and 2 late arrivals, your attendance score would be:
     
     
     15 - 1.5 - 2 * 0.5 = 12.5 out of 15 possible points.

- **Assignments** (35%): You will be assigned a computational assignment to be completed using RStudio and the package *knitr* regularly throughout class. [Grading Standards](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/standards.pdf)
- **Case Studies** (30%): You will be assigned applied case studies throughout the class that are to be completed using RStudio.
- **Final Project** (20%): The final project will be a computational case study that brings together the techniques learned throughout the semester. The description for this project will be provided towards the mid point of the semester.
- **Extra Credit** (+5%): Create a *well-organized* database of *all* R functions that you use throughout the semester. These include those mentioned in lectures, those introduced in homework, etc. Along with each function, give a brief description that details the use of the function. Also, organize these functions into categories according to their use.

Late assignments, projects, and case studies will not be accepted. 

### Schedule

Overall, this course will be split into two main parts: 

(1) learning the basics of how to code in R and 

(2) performing data analysis on real case studies and examples using data science techniques in R.


**Introduction**

 | Topic | Reading | Lab Assignment (HW) | Due Date | Code Demos|
 | :---  | :---:  | :---:  | :---:  | :---: |
 | [Introduction - A History of Data Science](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Lecture%201%20Introduction.pdf) | [Ch. 1 What is Data Science?](https://www.safaribooksonline.com/library/view/doing-data-science/9781449363871/ch01.html)| HW0 - Anonymous Class Survey (Canvas) | Friday, 1/26| |
 | [R and RStudio](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/R%20and%20RStudio.pdf) | |  |  | [First Coding Demo](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/first_R_script.R) |
 | [Packages and RMarkdown](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/R%20Markdown.pdf)  | | | | [First Knitting Demo](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/MyFirstKnit.Rmd) |
  
  
 **Data Structures in R**
  
 | Topic | Reading | Lab Assignment / HW  | Due Date | Code Demos|
  | :---  | :---:  | :---:  | :---:  | :---: |
  | [Vectors, Matrices, and Arrays](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Data%20Structures%20I.pdf) | [Ch. 20 in R for Data Science](http://r4ds.had.co.nz/vectors.html) |  [HW1](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/HW1.pdf) <br> [Grading Standards](https://usfca.instructure.com/courses/1614499/files?preview=71276194)| Friday, 2/1| [Data Structures I](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Data_Structures1.R) & [Data Structures II](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Data_Structures2.R)|
  | [Lists and Data Frames](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Data%20Structures%20II.pdf) | | [HW2](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/HW2.pdf)| Friday, 2/16| [Data Structures III](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Data_Structures3.R) |  
  | [Tibbles](http://r4ds.had.co.nz/tibbles.html)| [Ch. 10 in R for Data Science](http://r4ds.had.co.nz/tibbles.html)|  |  | [Tibbles](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/tibbles.R) |
  | [String Analysis](http://r4ds.had.co.nz/strings.html)|[Ch. 14 in R for Data Science](http://r4ds.had.co.nz/strings.html) |  | | [String Analysis I](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Strings1.R)|
   | [String Analysis 2](http://r4ds.had.co.nz/strings.html)|[Ch. 14 in R for Data Science](http://r4ds.had.co.nz/strings.html) | [HW3](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/HW3.pdf)| Friday, 3/8 | [String Analysis II](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Strings2.R) |
  | [Factors](http://r4ds.had.co.nz/factors.html) | [Ch. 15 in R for Data Science](http://r4ds.had.co.nz/factors.html)| | | [Factors](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Factors.R) |
  
  
  **Data Wrangling and Plotting**
  
 | Topic | Reading | Lab Assignment (HW) | Due Date | Code Demos|
   | :---  | :---:  | :---:  | :---:  | :---: |
   | [Plotting in R](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Plotting%20in%20R.pdf) | [Ch. 3 in R for Data Science](https://r4ds.had.co.nz/data-visualisation.html) | | | [ggplot](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/ggplot1.R)|
   | [Input and Output]() | | | | [Input and Output](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Input_Output.R) |
   |[More Plotting with ggplot2](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/ggplot2_dogs.R)| [Ch. 3 in R for Data Science](https://r4ds.had.co.nz/data-visualisation.html) ||| [ggplot and dogs](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/ggplot2_dogs.R) | 
   | [Wrangling Data](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Wrangling%20Data.pdf) | [Ch. 12 in R for Data Science](https://r4ds.had.co.nz/tidy-data.html) | [HW4](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/HW4.pdf)| Friday 3/29| [Wrangling Data](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/data_wrangling.R)|
   
  **Statistical Modeling in R**
 
 | Topic | Reading | Lab Assignment (HW) | Due Date | Code Demos|
 | :---  | :---:  | :---:  | :---:  | :---: |
 | [Intro to Statistical Modeling in R]() | [Ch. 23 and 24 in R for Data Science](http://r4ds.had.co.nz) | | | [Linear Regression Demo](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/linear_regression_demo.Rmd) | 
 
 **Programming**
 
 | Topic | Reading | Lab Assignment (HW) | Due Date | Code Demos|
 | :---  | :---:  | :---:  | :---:  | :---: |
 | [Control Flow](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Functional%20Programming.pdf)|[Ch. 19 in R for Data Science](http://r4ds.had.co.nz/functions.html) | [HW5](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/HW5.pdf)| Friday, 4/19 | [Functions 1](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Functions1.R)|
 | [Writing Functions](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Functional%20Programming.pdf)| [Ch. 19 in R for Data Science](http://r4ds.had.co.nz/functions.html)| | | [Functions 2](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Functions2.R)|
 | [Functionals](https://github.com/codycarroll/Intro-DS-S24/blob/main/Lectures/Functional%20Programming.pdf)| [Ch. 18 in R for Data Science](http://r4ds.had.co.nz/functions.html)| | | [Functions 3](https://github.com/codycarroll/Intro-DS-S24/blob/main/CodeDemos/Functions3.R)
 



### Case Studies
| Case Study | Data | Date |
|:--- | :---  | :---:  |
| Practice Case Study ||Thursday, 2/15|
| CS 1:  ||Tuesday, 2/20|
|CS 2:   ||Tuesday, 4/2|
|CS 3: ||Tuesday, 4/30|

### Final Project
Final Presentation Dates: May 2nd, 7th, 9th.

| Description | Due Date |
|:--- | :---  |
|[Project Signup](https://github.com/codycarroll/Intro-DS-S24/) | 4/1 @ 11:59p |
|[Final Project Description](https://github.com/codycarroll/Intro-DS-S24/blob/main/Assignments/Final_Project_Spring_2024.pdf)| Slides: 5/1 @ 11:59p, Report: 5/16 @ 11:59p|



### Important Dates

- Tuesday, Jan 23rd - First day of class
- Friday, Jan 26th - Last day to add the class
- Friday, Feb 9th - Census date. Last day to withdraw with tuition reversal
- Tuesday & Thursday, March 12th & 14th - Spring break! (**no class**)
- Thursday, April 4th - Remote class - online lecture
- Monday, Apr 8th - Last day to withdraw
- Tuesday, Apr 9th - Final Project Workday - Meet with your teammates! (**No lecture.**)
- May 2nd, 7th, 9th - Final Presentations
- Thursday,  May 9th - Last day of class
- Thursday, May 10th - Review day

## Additional References


### Data Science News
* [Data Science Beginnings](https://open.spotify.com/show/5SY1TPw3FubdSxCqrxUKZv?si=a1eb2a858e384db3) A podcast hosted by me and Robert Clements, another prof in the MSDS program.
* [R Weekly](https://rweekly.org/). About R.
* [R-bloggers](https://www.r-bloggers.com/). About R.
* [Data Tau](https://www.datatau.com/). About the DS industry.

### Data Science Texts

* [Data Manipulation with R](https://link.springer.com/book/10.1007%2F978-0-387-74731-6) by Spector.
* [Data Science in R](http://www.crcnetbase.com/doi/book/10.1201/b18325) by Nolan & Temple Lang.
* [Computational and Inferential Thinking](https://www.inferentialthinking.com/) by Adhikari & DeNero. 

### Visualization

* [ggplot2: Elegant Graphics for Data Analysis](https://link.springer.com/book/10.1007%2F978-3-319-24277-4) by Wickham. The official reference for ggplot2.
* [R Graphics Cookbook](http://www.cookbook-r.com/Graphs/) ([library](http://proquest.safaribooksonline.com/9781449363086)) by Chang. Examples for ggplot2.
* [R Graph Gallery](http://www.r-graph-gallery.com/). 
* [R Data Visualization Cheat Sheets.](http://www.r-graph-gallery.com/portfolio/r-dataviz-cheatsheet/)
* [Color Oracle](https://colororacle.org/), a free colorblindness simulator.
* [Color Brewer 2](http://colorbrewer2.org/), a web app to help choose colors.

### Statistics

* [Introductory Statistics with Randomization and Simulation](https://www.openintro.org/stat/textbook.php?stat_book=isrs) by OpenIntro.
* [Introduction to Statistical Learning](http://www-bcf.usc.edu/~gareth/ISL/) by James, Witten, Hastie & Tibshirani. 
* [The Elements of Statistical Learning](https://web.stanford.edu/~hastie/ElemStatLearn/) by Hastie, Tibshirani, & Friedman. 


### Other R Resources

* [UC Davis' Statistical DS Course ](https://github.com/nick-ulle/2018-ucdavis-sta141a/) by Nick Ulle.
* [The R Inferno](http://www.burns-stat.com/documents/books/the-r-inferno/) by Burns. About the difficult and confusing parts of R.
* [UC Berkeley's STA 133 Lecture Notes](https://www.stat.berkeley.edu/classes/s133/schedule.html).
* [RStudio Cheat Sheets](https://www.rstudio.com/resources/cheatsheets/).


