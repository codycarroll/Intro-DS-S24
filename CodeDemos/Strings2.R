library(stringr)

x = c("apple", "banana", "pear")

#gives every instance of a + any other 
#character in each string
str_view(x, "a.")

str_view(x, "pp")

str_view(x, ".a.")


#Using the alternation character | (stands for "or")

x = c("grey", "gray")

str_view(x, "gr(e|a)y")
str_view(x, "gr(ey|ay)") #also works


#Repetition
x = "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"

str_view(x, "CC?")
#the above searches for 1 - 2 instances of "C"
#the first C must be there, and the second can have
#0 - 1 instances

str_view(x, "CC")


str_view(x, "(CC)?")
#the above identifies the first time that "CC" happens
#0 or 1 time. It therefore gives the very first blank
#space at the beginning of the word


str_view(x, "CC+") #will identify the first instance
#that "C" is followed by "C" 1 or more times. 

str_view(x, "II+") 

str_view(x, "VI+") 

#
str_view(x, 'C[LX]+') #works like an "OR"

#starts with a C and searches next value to see if it
#is an "L" or an "X". Stops once there is no "L" or "X"

str_view(x, 'C(L|X)+') #this is equivalent to the above


#Using {} to specify the number of matches
str_view(x, "C{2}") #finds "C" exactly 2 times

str_view(x, "C{2,}") #finds "C" 2 or more times

#Key to finding these expressions:
#1) it searches for the first time an expression occurs
#2) it will return the maximum length expression matching your call
#example:
str_view(x, "C{0,3}") #returns first blank space
str_view(x, "C{1,3}") #returns 3 C's in the string

#If you want to return the minimum length expression
#matching your call, add a ? after the call.

str_view(x, "C{1,3}?") #returns a single C

str_view(x, 'C[LX]+?') #returns the expression "CL"



fruit #vector of fruits already stored in stringr package


##Backreferences

str_view(fruit, "(..)\\1", match = TRUE)
#first backslash refers back to the previous call (..)
#second backslash is a special character that indicates repetition 1 more time

str_view(fruit, "(c.)\\1", match = TRUE)

str_view(fruit, "(a.)\\1", match = TRUE)

str_view(fruit, "(.a)\\1", match = TRUE)


#String matches
x = c("apple", "banana", "pear")
str_detect(x, "e") #returns a logical stating 
#whether or not each string contains "e"

#counting words with certain matches

#number of words starting with a t
str_detect(words, "^t")

sum(str_detect(words, "^t"))

#rewrite the previous line (102) with pipes instead of nested functions

#reminder: the shortcut for pipes are %>% cmd+shift+M
words %>% 
  str_detect("^t") %>% 
  sum



# What proportion of common words end with a vowel?
mean(str_detect(words, "[aeiou]$"))
#> [1] 0.277
#> 

#pipe practice
words %>% 
  str_detect("[aeiou]$") %>% 
  mean

#What proportion of common words end with a consonant
mean(str_detect(words, "[^aeiou]$")) #the ^ means "except"


#Finding the words that have a match
#Two ways of doing the same thing:
#1) subsetting in a vector:
words[str_detect(words, "x$")]
#> [1] "box" "sex" "six" "tax"
#> 

idx = str_detect(words, "x$")
words[idx]

#2) using str_subset() function
str_subset(words, "x$")
#> [1] "box" "sex" "six" "tax"

##Identifying the number of matches in each string
x = c("apple", "banana", "pear")
str_count(x, "a")

str_count(x, "a.")

#This is useful for knowing the number of times 
# an expression appears in text.


#Note - string matches with regular expressions
# never overlap!
str_count("abababa", "aba")
#> [1] 2
str_view("abababa", "aba")
#identifes 2 not 3!

# On average, how many vowels per word?
mean(str_count(words, "[aeiou]"))
#> [1] 1.99

#with pipes:
words %>% 
  str_count("[aeiou]") %>% 
  mean


sentences #a collection of 720 sentences from
#the Harvard text data set. Available in stringr

#Exercise: 
#1.Find a partner
#2. Make up a question for them to answer using stringr functions
#3. Try to answer each other's questions

#How many sentences contain male pronouns?

pronouns = c("he", "him", "his")
pronoun_match = str_c(pronouns, collapse = "|")
pronoun_match

sentences %>% 
  str_detect(pronoun_match) %>% 
  mean

fpronouns = c("she", "her", "hers")
fpronoun_match = str_c(fpronouns, collapse = "|")
fpronoun_match

sentences %>% 
  str_detect(fpronoun_match) %>% 
  mean


nbpronouns = c("they", "their", "theirs")
nbpronoun_match = str_c(nbpronouns, collapse = "|")
nbpronoun_match

sentences %>% 
  str_detect(nbpronoun_match) %>% 
  mean



#Aim - identify all sentences with a color included

#1) create a regular expression of possible colors
colors = c("red", "orange", "yellow", "green", "blue", "purple")
color_match = str_c(colors, collapse = "|")
color_match

str_subset(sentences, color_match)


#the above gives any matches of colors 
#(which are sometimes at the end
#of a word). Let's specify exact matches
color_match2 = str_c("^(", color_match, ")$")

#2) Identify the subset with colors
has_color = str_subset(sentences, color_match2) 
#not working because
#it is searching for a sentence to match the color

color_match3 = str_c("\\s(", color_match, ")\\s")

has_color3 = str_subset(sentences, color_match3)

#3) Identify which colors
matches = str_extract(has_color3, color_match3)
head(matches)

table(matches)

#By default, str_extract only gets the first match. 
#To get all matches, use str_extract_all().
matches_all = str_extract_all(has_color3, color_match3)


##Identifying nouns with an article before them...
noun = "((A|a)|(T|t)he) ([^ ]+)"
has_noun = str_subset(sentences, noun)
str_extract(has_noun, noun)
#this kind of worked... but is also pulling out
#adjectives that describe nouns



#getting a matrix that splits the components of the match according to
#parentheses
match_matrix = str_match(has_noun, noun) #gives a matrix with 3 columns in this case
#nice way of dividing expressions

nouns = match_matrix[,5]

table(nouns)

## Replacing strings
x = c("apple", "pear", "banana")

str_replace(x, "[aeiou]", "-") #note - the first regexp is the thing to
#be replaced, and the second is what is replacing it. This will
#only replace the first instance
#> [1] "-pple"  "p-ar"   "b-nana"

#replace all instances, use str_replace_all()
str_replace_all(x, "[aeiou]", "-")
#> [1] "-ppl-"  "p--r"   "b-n-n-"

#Splitting strings
y = str_split(sentences[1], " ") #splitting the sentence according to
#spaces

z = str_split(sentences[1:5], " ")
z
zvec = unlist(z)

#Exercise: 
#Find all the periods and remove them.


rmp = str_replace_all(sentences, "\\.", "")

z = str_split(rmp[1:5], " ")
z
zvec = unlist(z)
