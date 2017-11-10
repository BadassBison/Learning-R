# More statements to use
# ** TIP! use "control+enter" to run highlighted code
  a <- 4
  b <- "Shawn"
  c <- T
  d <- 2+3i
# make a list (groups elements together, then names them)
  my.list <- list(a,b,c,d)
  my.list.n <- list(integer = a, character = b, logical = c, imaginary = d)
# check data types ("is" will return a T or F)
  is.numeric(a)
  is.character(b)
  is.logical(c)
  is.complex(d)
# will tell the data type
  class(a) 
# will convert data and show it
  as.numeric(c)
# to permanently convert data
  c <- as.numeric(c)
# changing a vector to factor (this makes categories)
  airports <- c("Cal","Del","NYC","Cal","Del","Del")
  airport.fact <- factor(airports)
  summary(airport.fact) # nominal data
# making ordinal data have order using levels
  birth.month <- c("September","October","April","June",
                   "August","November","January","February",
                   "December","April","September","May","March",
                   "January","September","June","April","September",
                   "February","April","June","February","January",
                   "March","July","January","April","March")
  birth.month.fact <- factor(birth.month, ordered = T, levels = c("January",
                    "February","March","April","May","June","July","August",
                    "September","October","November","December"))
  summary(birth.month.fact)
  