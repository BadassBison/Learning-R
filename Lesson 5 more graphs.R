# Scotter plot graph
  plot() # refer to lesson 4 for assistance

# Histogram
  hist(data[specificCol == itsName], breaks = 10) # 10 bars in the graph

# Box and Whisker Plot
  boxplot(data)
  
# Compare different graphs in one window
  par(mfrow = c(2,2)) # 2 row, 2 col
  plot(distance[carrier == "UA"], main = "UA", ylim = c(0,5000))
  plot(distance[carrier == "AA"], main = "AA", ylim = c(0,5000))
  hist(distance[carrier == "UA"], main = "UA", breaks = c(0,1000,2000,
                3000,4000,5000), xlim = c(0,5000), ylim = c(0,30000)) # lim's for scale
  hist(distance[carrier == "AA"], main = "AA", breaks = c(0,1000,2000,
                3000,4000,5000), xlim = c(0,5000), ylim = c(0,30000))
  
  # make graphs by a perticular col
    boxplot(distance ~ carrier)
  
  # Using package "pysch". Must "library()" it to use it
  # more detailed summary for 1 col
    describe(distance)
  
  # info on mulitiple col's (3 in this case)
    demo <- cbind(arr_delay, dep_delay, distance) # makes matrix
    head(demo) # to view the matrix
    colnames(demo) <- c("Arrival Delay","Departure Delay","Distance") # to use col names
    describe(demo)
  
  # Describe info for specific groups
    describeBy(distance, group = carrier)
    
  # Plot 2 sample test data (perfume csv)
    boxplot(x = Perfume_volumes_2)
    
    hist(x = Perfume_volumes_2$Machine.1, 
         col = rgb(0,1,0), 
         main = "Machine 1 vs Machine 2",
         xlim = c(140,160),
         ylim = c(0,25),
         xlab = "Volume (cc)",
         ylab = "Frequency"
    )
    hist(x = Perfume_volumes_2$Machine.2, 
         col = rgb(1,0,0,0.5),
         xlim = c(140,160),
         ylim = c(0,25),
         add = T   #add overlaps graphs
    ) 
    text(x = 143, y = 19, label = "Machine 1", col = rgb(0,1,0))
    text(x = 143, y = 17, label = "Machine 2", col = rgb(1,0,0))
    