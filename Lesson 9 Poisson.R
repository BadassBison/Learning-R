# Poisson Distribution
  # Used when calculating the # events (successes) in an interval

# Outcomes are success or failure
# Avg # of successes (mu) in the specific region (time, location) are known
  # Avg events in an interval = lambda (same as mu, used for notation)
# Outcomes are random
# Occurance of one outcome does not affect the outcome of the other
# Outcomes are rare compared to possible outcomes
# Function looks like -> P(x, mu)
# Need x & mu. x is what your after and mu is the avg
# Intervals need to be the same for x & mu (if not, make same)

# On a booking counter, on the average 3.6 people 
    # coming every 10 minutes on
    # weekend. What is the probability of 
    # getting 7 people in 10 minutes?

dpois(x = 7, lambda = 3.6) #or
dpois (7,3.6) #or
ppois(7,3.6) - ppois(6,3.6)

# make a graph for <=7, >=5, 3-6, <=2 & >=7
a <- c(0:10)
barplot(dpois(a, 3.6))
visualize.pois(stat = 7, lambda = 3.6)
visualize.pois(stat = 5, lambda = 3.6, section = "upper")
visualize.pois(stat = c(3,6), lambda = 3.6, section = "bounded")
visualize.pois(stat = c(2,7), lambda = 3.6, section = "tails")
# exactly 7
visualize.pois(stat = c(7,7), lambda = 3.6, section = "bounded")
