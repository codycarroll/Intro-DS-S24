rm(list=ls())
myFunc_21 <- function(arg_01) myFunc_22(arg_01)
myFunc_22 <- function(arg_02) myFunc_23(arg_02)
myFunc_23 <- function(arg_03) myFunc_24(arg_03)
myFunc_24 <- function(arg_04) cat("myString", arg_04)


myFunc_21()


myFunc_21(arg_01 = "abc")
