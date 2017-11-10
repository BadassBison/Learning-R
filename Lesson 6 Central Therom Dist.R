# Central Therom Distribution

# generate 10000 random #'s (uniform distribution)
  r <- runif(10000)
  hist(r)
  meanr <- round(mean(r), digits = 4) 
  sdr <- round(sd(r), digits = 4)
  sample(r,4) # Samples 4 #'s 
  mean(sample(r,4)) # avg of 4 #'s
# put sample mean into a var
  cl4 <- mean(sample(r,4))
# Make a "for" loop to do this 1000 times
  for (i in 1:1000) {
    cl4 <- c(cl4, mean(sample(r,4)))
  }
# show histogram of this and store it in var's
  hist(cl4)
  meancl4 <- round(mean(cl4), digits = 4)
  sdcl4 <- round(sd(cl4), digits = 4)
# with 9 samples
  cl9 <- mean(sample(r,9))
  for (i in 1:1000) {
    cl9 <- c(cl9, mean(sample(r,9)))
  }
  hist(cl9)
  meancl9 <- round(mean(cl9), digits = 4)
  sdcl9 <- round(sd(cl9), digits = 4)
# with 100 samples
  cl100 <- mean(sample(r,100))
  for (i in 1:1000) {
    cl100 <- c(cl100, mean(sample(r,100)))
  }
  hist(cl100)
  meancl100 <- round(mean(cl100), digits = 4)
  sdcl100 <- round(sd(cl100), digits = 4)
# compare these in 4 windows
  par(mfrow = c(2,2))
  hist(r, main = "1 sample")
    sdrlab <- paste("sd:",sdr) # sd label var
    meanrlab <- paste("mean:",meanr) # mean label var
    mtext(sdrlab, side = 3)
    mtext(meanrlab, side = 4)
  hist(cl4, main = "4 samples")
    sdcl4lab <- paste("sd:",sdcl4)
    meancl4lab <- paste("mean:",meancl4)
    mtext(sdcl4lab, side = 3)
    mtext(meancl4lab, side = 4)
  hist(cl9, main = "9 samples")
    sdcl9lab <- paste("sd:",sdcl9)
    meancl9lab <- paste("mean:",meancl9)
    mtext(sdcl9lab, side = 3)
    mtext(meancl9lab, side = 4)
  hist(cl100, main = "100 samples")
    sdcl100lab <- paste("sd:",sdcl100)
    meancl100lab <- paste("mean:",meancl100)
    mtext(sdcl100lab, side = 3)
    mtext(meancl100lab, side = 4)
      