# Binomial Probability Distribution

# Fixed number of trials - n
# For each trial there are 2 possible outcomes
# Probability of success remains same for all trials
# Trials are independant of each other
# We are interested in: prob of x # of successes in n trials

# Flipping 10 coins 5 times
rbinom(5, 10, 0.5)
# Flipping 1 coin 10 times
rbinom(10, 1, 0.5)
# Probability of getting 5 or less heads
pbinom(5, 10, 0.5)
# Prob of getting exactly 5 flips
pbinom(5, 10, 0.5) - pbinom(4, 10, 0.5) #or
dbinom(5, 10, 0.5) # vertical height at a point
# Prob of getting more than 5
pbinom(5, 10, 0.5, lower.tail = FALSE) # doesn't include 5
# Number of successes if the prob is 0.5 w/ 10 trials and 10 coins
qbinom(0.5, 10, 0.5)
# Used to see what number of successes is needed to hit a prob
qbinom(0.05, 10, 0.5)
# graph binomial
n <- c(0:10)
barplot(dbinom(n, 10, 0.5))
# graph using visualize (p <= 5) & (p >= 5)
visualize.binom(5, 10, 0.5)
visualize.binom(5, 10, 0.5, section = "upper")
# Probability of getting 4 or 5
visualize.binom(c(4,5), 10, 0.5, section = "bounded")
# Probability of getting (up to 3 and 6 or more) & (extreme vals)
visualize.binom(c(3,6), 10, 0.5, section = "tails")
visualize.binom(c(1,9), 10, 0.5, section = "tails")
