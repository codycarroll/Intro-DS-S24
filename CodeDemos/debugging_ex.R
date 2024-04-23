rm(list=ls())
myFunc_21 <- function(arg_01) myFunc_22(arg_01)
myFunc_22 <- function(arg_02) myFunc_23(arg_02)
myFunc_23 <- function(arg_03) myFunc_24(arg_03)
myFunc_24 <- function(arg_04) cat("myString", arg_04)


myFunc_21()


myFunc_21(arg_01 = "abc")


myFunc_21("abc")



rm(list=ls())
myFunc_31 <- function(arg_01) myFunc_32(arg_01)
myFunc_32 <- function(arg_02) myFunc_33(arg_02)
myFunc_33 <- function(arg_03) myFunc_34(arg_03)
myFunc_34 <- function(arg_04) {
  print("is my error here?")
  
  2 + 5 
  
  print("how about here?")
  
  5^2

  print("maybe after this???")
  
  2 + arg_04
}

myFunc_31()

