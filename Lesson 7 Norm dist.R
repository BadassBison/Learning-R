# Normal Probability Distribution 

# Random Numbers. defaults: mean = 0, sd = 1 (std norm dist)
  rnorm(10) # 10 random #'s
  rnorm(10, mean = 100, sd = 2) # diff mean & sd
# determine the probability of area to the left
  pnorm(0) # use z-value
  pnorm(-1.96) # approx 2.5%
  pnorm(-1.64) # approx 5%
# determine the z-value know the percent
  qnorm(0.025) 
  qnorm(0.05)
# determine the vertical distance on the graph
  dnorm(0) # use z-value
# collect dnorm val's to plot a graph
  zval <- c(seq(-4, 4, by = 0.1))
  plot(zval, dnorm(zval))  
  plot(zval, dnorm(zval), type = "l") # l changes dots to line
# Using the package "visualize". Graph enhancer
  visualize.norm(-2) # graph with area shaded
  visualize.norm(c(2,-2), section = "tails") # outside
  visualize.norm(stat = c(73,78), mu = 75, sd = 1, section = "bounded") 
  visualize.norm(stat = 76, mu = 75, sd = 1, section = "upper")
  visualize.norm(stat = 76, mu = 75, sd = 1, section = "lower")