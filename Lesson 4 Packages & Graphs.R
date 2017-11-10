# Look at base packages in R
  installed.packages()
# To install new packages and use it for this session
  install.packages("nycflights13")
  library("nycflights13")
# To look at the data frames (or tables) in the package
  nycflights13::flights
# Attach the package to the session to use column names only
  attach(nycflights13::flights)
# Plot a scatter graph using column names only
  plot(arr_delay,dep_delay) # (indendant var, dependant var)
# Add names to title (main), x-axis (xlab), & y-axis (ylab)
  plot(arr_delay,dep_delay, main = "Arrival and Departure Delays", 
       xlab = "Arrival Delay", ylab = "Departure Delay")
# Plot a line to show linear relationship (y-int,slope)
  abline(0,1)
  abline(h=100) # horizontal line
  abline(v=200) # vertical line
# Change the plot characters with pch = #
  # 1 Circle, 2 Triangle, 3 Plus, 4 Cross, 5 Diamond, 
  # 6 Rev Triangle, 7 Box and Cross
  # You can also have characters (ex. "s"). pch = plot character
  plot(xcoord, ycoord, main = "Title of Graph", xlab = "X-axis label",
       ylab = "y-axis label", pch = 3)
# Change the color of the plots. Using "points" overlays your graph
  plot(arr_delay[carrier=="UA"], dep_delay[carrier=="UA"], 
       main = "Arrival and Departure Delays of UA & AA", col="green",
       xlab = "Arrival Delay", ylab = "Departure Delay")
  points(arr_delay[carrier=="AA"], dep_delay[carrier=="AA"], col="red")
# Change the size of the plots (cex = %)
  plot(arr_delay[carrier=="UA"], dep_delay[carrier=="UA"], 
       main = "Arrival and Departure Delays of UA & AA", cex = 0.5)
# Change color and font of text on the graph
  plot(arr_delay[carrier=="UA"], dep_delay[carrier=="UA"], 
       main = "Arrival and Departure Delays of UA & AA", cex = 0.5, 
       col = "red", col.main = "blue", font.main = 3)
# Partition - multiple frame rows (side by side graphs)
  par(mfrow = c(1,2)) # 1 row, 2 columns 
  plot(arr_delay[carrier=="UA"], dep_delay[carrier=="UA"], main = "UA",
       xlim = c(0,1000), ylim = c(0,1000)) # for scale
  plot(arr_delay[carrier=="AA"], dep_delay[carrier=="AA"], main = "AA",
       xlim = c(0,1000), ylim = c(0,1000))
  par(mfrow = c(1,1)) # returns the plot window to normal
# Pairs allows us to look at multiple scatter plots and compare
  pairs(arr_delay,dep_delay,distance,air.time) # brings a 4x4 to compare all
# Add text in a graph (defaults with the point in the middle of the text)
  text(x = 100, y = 400, label = "R is fun!")
  text(x = 100, y = 400, label = "R is fun!", adj = 1) # point is on the right
# Add text outside the graph (default centers on side)
  mtext(text = "UA = United Airlines", side = 3) # top, center
  mtext(text = "in minutes", side = 2, adj = 1) # left, shifted right
# To made a sentence or statement. no spaces needed 
  age <- 31
  paste("I am", age, "years old")
  