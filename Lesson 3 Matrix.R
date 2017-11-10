# Vectors to make a matrix
  stu.hours <- c(20,34,45,35,24,46,56,34,56,26,36,23,14)
  stu.marks <- c(40,55,64,60,42,61,84,55,78,31,50,49,22)
# Combine both vectors into one
  stu.data <- c(stu.hours,stu.marks)
# Turn the data vector into a matrix (set row limit or all date will be in one column)
  stu.matrix <- matrix(stu.data, nrow = 13)
  stu.matrix
# Naming row and columns
  colnames(stu.matrix) <- c("hours","marks")
  rownames(stu.matrix) <- c(1:13)
# Import a CSV file
  read.csv("quotes.csv")
# Made a data frame with multiple vectors
  stu.hours <- c(20,24,46,62,22,37,45,27,65,23)
  stu.marks <- c(40,55,69,83,27,44,61,33,71,37)
  stu.data <- data.frame(stu.hours,stu.marks)
  stu.data
# Make a scatter plot graph
  plot(stu.hours,stu.marks) # or
  plot(stu.data)