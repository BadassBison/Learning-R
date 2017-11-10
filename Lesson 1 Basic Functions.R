# Where are my files going?
  getwd()
# Set working directory to the right folder
  setwd("/Users/Shawn/Desktop/R")
# "control + L" cleans your work space
  
# Height of students (Beginner lessons)
# Creates Vector c()
  student.height <- c(122,134,101,115,120,127,117)
  student.number <- c(1:10)      # 1st method
  student.number <- c(seq(1,10)) # 2nd method
# Vector of numbers that jump "by" 3
  num.a <- c(seq(1,15, by=3)) # 1,4,7,10,13
# Name the items in the vector
  names(student.height) <- c("a","b","c","d","e","f","g")
  student.height["c"]
# Pull specific items from a vector
  student.height[2]
  student.height[2,5]
# Set Variables (use <-)
  a <- 2
  b <- "Shawn is the best"
  c <- T # boolean
# Check data type class()
  class(a) # integer
  class(b) # characters
  class(c) # logical
# To remove contents of a variable
  remove(a, b, c)
# Mean of data
  mean(student.height)
# Median of data
  median(student.height)
# Gives help on the topic
  help("mean")
# Empty fields from excel will have NA
  student.height <- c(122,134,101,115,120,127,115,117,NA,1234)
# na.rm = T removes the NA's
  mean(student.height, na.rm = T)
# trim removes upper and lower bounds by a %
  mean(student.height, trim = 0.1, na.rm = T)
# sort() gives you the vales ascending
  sort(student.height)
# table() gives you a list of data and its number of occurances
  table(student.height)
# there is no mode function. For mode you must make a table and sort
# use decreasing to bring the largest value to the left and [1] to get 1st value
  a <- table(student.height)
  sort(a, decreasing = T)[1]
# range function, won't work with NA's
  range(student.height, na.rm = T)
# Quartiles (0,Q1,Q2,Q3,100)
  Quantile(student.height)
# Inner Quartile Range (Q3-Q1)
  IQR(student.height)
# Sample Standard Diviation
  sd(student.height)
# Population Standard Diviation
  sd(student.height) * sqrt((n-1)/n)
# Grab quartiles, mean, median, min & max
  summary(student.height)