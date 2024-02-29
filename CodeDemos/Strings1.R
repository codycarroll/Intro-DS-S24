#String Analysis Part 1

library(stringr)

#or
library(tidyverse)

string = "this is a string"

#note - if you forget a quotation mark, then the string will
# contain \n which represents a new line.

#creating strings with quotations inside
string_w_quotations = "Bob said \"Hello, my name is Bob\" "
writeLines(string_w_quotations)

double_quote = " \" " #includes slash, but this is not the string itself
#to view the string, use the function writeLines

writeLines(double_quote)

double_quote2 = '""'

writeLines(double_quote2)

single_quote = " \' "
writeLines(single_quote)


#look up a list of special characters in R
?"'"

#printing a mu to the screen
x = "\u00b5"
x

backslash = " \\ "
writeLines(backslash)

#counting the number of characters in each string of a 
#vector
x = c("a", "R for data science", NA)

str_length(x)
#Note - this does count white space

#compare the above with getting the length of a vector
length(x)

##Combining strings

str_c("x", "y")
#returns "xy"


str_c("x", "y", "z")
# returns "xyz"

#separating the concatenated strings using the sep argument

#a comma and then a space
str_c("x", "y", sep = ", ")

str_c("x", "y", "z", sep = ", ")

#a colon
str_c("x", "y", sep = ":")

#a tilde
str_c("x", "y", sep = "~")

#a space
str_c("x", "y", sep = " ")

#a tab
xy = str_c("x", "y", sep = "\t") #note here the \t is included. To
writeLines(xy)
#see what the string actually looks like, use writeLines()

writeLines(str_c("x", "y", sep = "\t"))
writeLines(str_c("x", "y", sep = "\n"))
writeLines(str_c("x", "y", sep = "\r"))


#writing out NA in the text object
x = c("abc", NA)
x

str_c("|-", x, "-|")
#> [1] "|-abc-|" NA

y = c("a", "b", "c")

str_c("|-", y, "-|")

str_c("|-", str_replace_na(x), "-|")
#> [1] "|-abc-|" "|-NA-|"

x = c("abc", "de")
#what if our aim is to print "|-abc, de-|" ?

#part 1: create "abc, de"
#part 2: add the fancy lines around it

str_c(c("|-", x[1] , ", " ,  x[2], "-|"))

#part 1: create "abc, de"
str_c(x[1], x[2], sep = ", ")

#part 2: add the fancy lines around it
str_c("|-", str_c(x[1], x[2], sep = ", "), "-|")






trial1 = str_c("|-", x[1], x[2], "-|") #close but no commas
trial1
trial2 = str_c("|-", str_c(x[1], x[2], sep = ", "), "-|")
trial2
#so trial2 works here. 
#Note - str_c() expects individual entries not vectors


str_c( "|-", x[1] , ", " ,  x[2], "-|" )




##a quick trial with an if() statement

name = "Hadley"
time_of_day = "morning"
birthday = FALSE

str_c(
  "Good ", time_of_day, " ", name,     #prints Good morning Hadley
  if (birthday) " and HAPPY BIRTHDAY", #if birthday == TRUE, then this prints
  "."                                  #and HAPPY BIRTHDAY
)

birthday = TRUE
str_c(
  "Good ", time_of_day, " ", name,     #prints Good morning Hadley
  if (birthday) " and HAPPY BIRTHDAY", #if birthday == TRUE, then this prints
  "."                                  #and HAPPY BIRTHDAY
)


##collapsing an entire vector of strings into a single string
vec = c("x", "y", "z")
str_c(vec, collapse = ", ")
#> [1] "x, y, z"

str_c(vec, collapse = ":")



##Revisiting the previous example
x = c("abc", NA)

#aim: typing "|-abc, NA-|"
trial2 = str_c("|-", str_c(str_replace_na(x), collapse = ", "), "-|")

#comment - go through the above function from the ***inside out*** to
#make sure you understand what is happening with each functional call



##------ Subsetting strings-------- ##
x = c("Apple", "Banana", "Pear")

#will give us the 1st through 3rd entry of each string in the vector x

str_sub("Apple", 1, 4)

str_sub(x, 1, 3)
str_sub(x, 2, 3)
str_sub(x, 2, -1) #shortcut for stop at the last character

?str_sub


#> [1] "App" "Ban" "Pea"

#can use str_sub as an assignment
#example - replacing capital letters with lower case letters
x

str_to_lower("C")

str_to_lower(str_sub(x, 1, 1))


y = c("apple", "banana", "pear")

#going back and capitalizing the first entries
str_to_upper(str_sub(y, 1, 1))


#----- Pattern matching ------#

#Case 1 - Exact matching
x = c("apple", "banana", "pear")
str_view(x, "an") #note - will give the first instance of a match!
str_view(x, "ea")

#something not in the vector
str_view(x, "re")

#exact matching is case-sensitive
str_view(x, "Ap")

#Important note - it is difficult to catch all
#grammatical errors, misspellings, and mis-capitalizations
#with exact match.

#matching "any" character using .
str_view(x, ".a.") 
#identifies any sequence of 3 characters _a_


#to match the special character ".", we need to use
#a double escape or "\\."


# And this tells R to look for an explicit .
str_view(c("abc", "a.c", "bef", "bla.cat"), "a\\.c")

#does a single escape work?
str_view(c("abc", "a.c", "bef"), "a\.c")
#throws an error because it escapes from the text

# searching for \ in text requires searching with
# four backslashes! i.e., we search with "\\\\"

x = "a\\b"
writeLines(x)
#> a\b

str_view(x, "\\\\")
str_view(x, ".\\\\.")

#Searching for characters that start a string
#use the special character ^ which is the anchor
#to the beginning of a string

x = c("apple", "banana", "pear")
#give all matches where "a" starts the string
str_view(x, "^a")

#use the special character $ to anchor the end of 
# a string. 

#give all matches where "a" ends the string
str_view(x, "a$")
str_view(x, "e$")

#identifying instances that are exactly a word.
x = c("apple pie", "apple", "apple cake")

#first, give all matches of "apple"
str_view(x, "apple")

#give exact matches of "apple" where that is the only
#sequence in the string

str_view(x, "^apple$")

#Exercises:

#1. In your own words, describe the difference 
# between the sep and collapse arguments to str_c().

#2. Use str_length() and str_sub() to extract 
# the middle character from the variable `xyz` below. 
# What will you do if the string has an even number
# of characters?
xyz = "12345678"

n = str_length(xyz)

#odd length strings
#if n is odd:
if(n %% 2 == 1){
  idx = ceiling(n/2)
  str_sub(xyz, idx, idx)
}

#even length strings
#if n is even:
if(n %% 2 == 0){
  idx = ceiling(n/2)
  str_sub(xyz, idx, idx+1)
}









  
#3. What does str_wrap() do? When might you want to use it?
  

#4. Write code that turns  a vector  
# (e.g.) c("a", "b", "c") into the string 
# "a, b, and c". Think carefully about what it 
# should do if given a vector of length 0, 1, 2, 
# or n, n > 2. 




