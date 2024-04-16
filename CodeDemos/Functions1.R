#Loops and Functional Programming

#for loops

for(i in 1:5){
  print(i^2)
}


for(i in 1:5) print("BSDS 100")

#for the safe side, let's use brackets. This is equivalent to the above
for(i in 1:5){
  print("BSDS 100")
}

#what's happening with i?

for(i in 1:5){
  print(i)
  print("BSDS 100")
}


for(i in 1:5){
  print(i)
  print(i^2)
}

#we don't have to iterate numerically, instead e.g., we can go through all 
#levels in a factor

values = factor(c("A", "A", "B", "C", "C", "C", "ZzZ"))

library(stringr)

for(v in values){
  print(str_c("Letter:", v))
}


levels(values)

for(k in levels(values)){
  print(k)
}

#we can update the seq for the looping variable and 
#it won't change the originally specified seq.

for(i in 1:10){
  i = i + 10
  print(i)
}

i 


##while loops
#printing "beep" 3 times
n = 3
while(n > 0){
  print("beep")
  n = n - 1
  print(str_c("Now the value of n is: ", n, "."))
}

#contrast this with the following
n = 3
while(n > 0){
  n = n - 1
  print("beep")
  print(str_c("Now the value of n is: ", n, "."))
}

#what happens in the following?
n = 3
while(n > 0){
  n = n + 1
  print("beep")
}
#ctrl + c  

#repeat loops
# will keep executing what is inside the loop until a "break" condition is met

x = 7
repeat{
  print(x)
  x = x + 2
  if(x > 10) break
}

#the above is equivalent to the following while() loop
x = 7
while(x <= 10){
  print(x)
  x = x + 2
}


x = -3
#if statement
if (x < 0){
  print("x is negative")
}


x = 0
#if else statement
if (x > 0){
  print("x is positive")
}else{ 
  #else must begin on the same line for which the if{} statement ends
  print("x is not positive")
}


#if else if statements

#x = 0
# x = -2
# x = 2
 x = "a"

if(x > 0){
  print("x is positive")
}else if(x < 0){
  print("x is negative")
}else{
  print("x is zero")
}

#trying the above on a vector will toss a warning
x = c(-1, 1)

if(x > 0){
  print("x is positive")
}else if(x < 0){
  print("x is negative")
}else{
  print("x is zero")
}

#vectorized if() else with ifelse()
x = c(-1, 1)

ifelse(x > 0, "x is positive", "x is not positive")
#first argument is the condition
#the second is the expression if condition is TRUE
#third argument is the expression if condition is FALSE
x = c(-1, 1, 0)
ifelse(x > 0, "x is positive", "x is not positive")




#to call it "x is zero" we can combine another ifelse() statement
#inside of this original one
x = c(-1, 1, 0)
ifelse(x > 0, "x is positive", 
       ifelse(x < 0, "x is negative", "x is zero"))

#or just change the text lol
x = c(-1, 1, 0)
ifelse(x > 0, "x is positive", "x is non-positive")


#the switch statement
grades = c("A", "D", "F")
for(i in grades){
  print(switch(i,
          A = "Well Done!",
          B = "Pretty good",
          C = "Decent enough",
          D = "Cutting it close...",
          F = "RIP")
  )
}

#update grades according to the above switch
grades2 = list()
for(i in grades){
  grades2[[i]] = switch(i,
                A = "Well Done!",
                B = "Pretty good",
                C = "Decent enough",
                D = "Cutting it close...",
                F = "RIP")
}

grades2


