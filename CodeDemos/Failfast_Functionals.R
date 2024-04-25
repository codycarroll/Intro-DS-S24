#fail fast demos
library(tidyverse)
library(magrittr)

#Fail Fast principles
myVec <- c("aaa", "bcd", "efg")
if(length(unique(nchar(myVec))) != 1) {
  stop("Error: Elements of your input vector do not have the
  same length!")
}


stopifnot(length(unique(nchar(myVec))) != 1,
          "Error: Elements of your input vector HAVE the same length!")

stopifnot(1 == 1,  all.equal(pi, 3.14159265), 1 < 2) # all TRUE

stopifnot(1 == 2, all.equal(pi, 3.14159265), 1 < 2) # first is FALSE

stopifnot(1 == 1, all.equal(pi, 3.14159265), 1 > 2) # third is FALSE

stopifnot(1 == 2, all.equal(pi, 3.14159265), 1 > 2) # first & third is FALSE, only see first



### Functionals
#ex df
myDataFrame_01 = data.frame(A = c(1,10,7,2,1,6),
                            B = c(6,4,9,9,10,2),
                            C = c(1,4,5,3,5,1),
                            D = c(5,-99,4,8,9,3),
                            E = c(-99,9,1,6,8,8),
                            F = c(1,3,4,8,6,5))

#goal: replace all -99s with NA

myDataFrame_01


#why is this bad?
runbadex = FALSE
if(runbadex == TRUE){
  myDataFrame_01$A[myDataFrame_01$A == -99] <- NA
  myDataFrame_01$B[myDataFrame_01$B == -99] <- NA
  #...
  myDataFrame_01$F[myDataFrame_01$F == -99] <- NA
}

#DRY principle - don't repeat yourself 

#will this work?
fix99s_byCol <- function(myCol) {
  myCol[myCol == -99] <- NA
}
#how to fix it?



fix99s_byCol <- function(myCol) {
  (myCol[myCol == -99] <- NA)
  myCol
}

#how to apply to each col?

for(i in 1:ncol(myDataFrame_01)){
  myDataFrame_01[,i] = fix99s_byCol(myDataFrame_01[,i])
}

myDataFrame_01



#
#
#
#
#
#functionals avoid loops
#is this what we want?

myDataFrame_01 = data.frame(A = c(1,10,7,2,1,6),
                            B = c(6,4,9,9,10,2),
                            C = c(1,4,5,3,5,1),
                            D = c(5,-99,4,8,9,3),
                            E = c(-99,9,1,6,8,8),
                            F = c(1,3,4,8,6,5))

output = lapply(myDataFrame_01, fix99s_byCol) 

str(output)


#to df 
myDataFrame_01 = lapply(myDataFrame_01, fix99s_byCol) %>% 
                 as.data.frame()


#What if different columns employed different coding schemes for
#missing values, e.g., -99, -999 and -8888888?

myDataFrame_02 = data.frame(A = c(1,10,-999,2,1,6),
                            B = c(6,4,9,9,10,2),
                            C = c(1,4,5,-8888888,5,1),
                            D = c(5,-99,4,8,9,3),
                            E = c(-99,9,1,6,8,8),
                            F = c(1,3,4,8,6,5))








####
fixMissing <- function(myCol, myValue) {
  myCol[myCol == myValue] <- NA
  myCol
}


myValue = c(-99,-999,-8888888)

#first check: does it work on 1col w 1 value at a time?
fixMissing(myCol = myDataFrame_02$A, myValue = -999)

#second check: does it work on 1col w many replacement values at a time? 
fixMissing(myCol = myDataFrame_02$C, myValue = myValue)
#not yet... let's try to do this later down the line!





x = -998

x %in% myValue

missingval_key = c(-99,-999,-8888888)

myDataFrame_02 = data.frame(A = c(1,10,-999,2,1,6),
                            B = c(6,4,9,9,10,2),
                            C = c(1,4,5,-8888888,5,1),
                            D = c(5,-99,4,8,9,3),
                            E = c(-99,9,1,6,8,8),
                            F = c(1,3,4,8,6,5))

missingval_key = c(-999,-999,-8888888,-99,-99,-99)

mapply(myDataFrame_02, 
       FUN = fixMissing, 
       myValue = missingval_key) %>% 
  as.data.frame()

?mapply

#example of mapply

mapply(rep, c(1,2,3,4), c(4,3,2,1))



myDataFrame_02 = data.frame(A = c(1,10,-999,2,1,6),
                            B = c(6,4,9,9,10,2),
                            C = c(1,4,5,-8888888,5,1),
                            D = c(5,-99,4,8,9,3),
                            E = c(-99,9,1,6,8,8),
                            F = c(1,3,4,8,6,5))

fixMissing2 <- function(myCol, myValue) {
  myCol[myCol %in% myValue] <- NA
  myCol
}

lapply(myDataFrame_02, FUN = fixMissing2, myValue = myValue) %>% 
  as.data.frame()




#Notice that since the function needed another argument (myValue)
#we had to provide that to apply. Because of that, I had to
#specify later arguments with exact matching to prevent misparsing.
#Also I had to use mapply() instead of lapply()
#to allow myValue to range over itselements as a vector.

?apply




### Anonymous Functions

#sometimes you only need to use a function once and it's really simple.
#in that case anonymous functions can be useful.

myDataFrame_01

#########################
#anonymous
lapply(myDataFrame_01, function(x) x + 3) %>% 
  as.data.frame()

#named version
named_fun <- function(myCol) {
  myCol <- myCol + 3
  myCol
}

lapply(myDataFrame_01, named_fun) %>% 
  as.data.frame()


###LAB EXERCISE###
#Create a compact and robust function which, 
#when passed an n × m numeric data frame, 
#returns, for each numeric column, the
#1. Mean
#2. Median
#3. Standard Deviation
#4. Variance
#5. Quantiles (Q1 & Q3)
#6. IQR.
#If the column is non-numeric, return a vector of NAs.
#Try to make it as efficient and nonredundant as possible. 
x = 1:10
mean(x)
median(x)
var(x)
sd(x)
quantile(x, probs = 0.25) #Q1
quantile(x, probs = 0.75) #Q3
quantile(x, probs = 0.75) - quantile(x, probs = 0.25) #IQR = Q3 - Q1
IQR(x) #or this


getstats = function(mycol){
  if(!is.numeric(mycol)){
    stop("The column needs to be numeric!")
  }
  
  #handle missing data
  mycol = mycol[!is.na(mycol)]
  
  #compute stats & output
  output = c(mean = mean(mycol), 
             med = median(mycol), 
             sd = sd(mycol),
             var = var(mycol),
             q1 = quantile(mycol, probs = 0.25),
             q3 = quantile(mycol, probs = 0.75),
             iqr = IQR(mycol))
  return(output)
}

library(palmerpenguins)
penguins

getstats(penguins$body_mass_g)

penguins %>% head

lapply(penguins[,3:6], getstats) %>% as.data.frame()



#To test it out, use the Palmer penguin data. 
library(palmerpenguins)
penguins

#start here 4/25

#ex functional
myFunctional_01 <- function(myFuncArg) myFuncArg(runif(1000), na.rm = TRUE)

#the function generates 1000 random numbers between 0 and 1 
#and then applies the function you provide as `myFuncArg`

myFunctional_01(mean)
myFunctional_01(min)
myFunctional_01(sd)
                                                 

#introduce state data
?state.x77
state.region

state.x77 = state.x77 %>% as.data.frame()

colnames(state.x77)


#review the idea of correlation
library(ggplot2)

df = as.data.frame(state.x77)
ggplot(df, aes(x = Income,
               y = Illiteracy)) + 
  geom_point()

cor(df$Income, df$Illiteracy)


ggplot(df, aes(x = Income,
               y = Population)) + 
  geom_point()

cor(df$Income, df$Population)


ggplot(df, aes(x = Population,
               y = Population)) + 
  geom_point()

cor(df$Population, df$Population)

?cor

####LAB 
lapply_res = lapply(state.x77, FUN = cor, y = state.x77$Population)

str(lapply_res)

sapply_res = sapply(state.x77, FUN = cor, y = state.x77$Population)

str(sapply_res)

tapply_res = tapply(state.x77$Area, state.region, sum)
tapply_res

####Benchmarking
library(microbenchmark)

set.seed(100)
x = runif(min = 0, max = 1, n = 100)
micro = microbenchmark(sqrt(x), x^0.5, x^0.25, x^2, sin(x), times = 1000)
micro


1614.744/661.863

#Interpretation:
#It takes roughly 271.133 ns on avg to compute the square root of 100 numbers 
#using sqrt(). That means that if you repeated that operation a 
#million times, i.e., compute the square root on 10,000,000 numbers,
# it would take 0.271 seconds.

#On the other hand, it takes roughly 1564.396 ns on avg to compute 
#the square root of 100 numbers using x^0.5. That means that if you 
#repeated that operation a million times, i.e., compute the square root 
#on 10,000,000 numbers, it would take ~1.564 seconds.

#On average, sqrt() is about 1564.396/271.133 = 5-6x faster than x^0.5.
1564.396/271.133

