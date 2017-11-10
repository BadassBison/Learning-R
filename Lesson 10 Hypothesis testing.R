# Inferential Statistics - Hypothesis Testing

  # Functions in R have r, p, q, d
    # r - randome
    # p - probability
    # q - quartile (gives you the x value)
    # d - vertical (gives you the y value)


  # Basic terms and symbol names in statistics
    #              Population --- Sample
    #Size             N             n
    #Mean            Mu           x-bar
    #SD             Sigma           s
    #Proportion       P             p
    #Proportion'      Q             q
    #Corr Coff       rho            r
    #Avg events    lambda

# Ho = Null Hypothesis
# Ha = Alternantive Hypothesis

# Type 1 Error = Reject Null when Null is "true" (alpha)
  # Also called false alarm or producers risk
# Type 2 Error = Fail to reject Null when Null is "false" (beta)
  # Also called consumers risk

# 1 - (alpha) = C (Confidence level)
# (alpha) = 1 - C (Level of Significance)
# 1 - (beta) = Power of the test (Likelihood to reject Null when Null is false)
  # Power is the ability to correctly reject the Null

# P-value states the probability of getting that sample
  # p < alpha reject Null. alpha is split in half on 2 tail
  # If P is low, Null must go/ If P is high, Null must fly

# Testing
  # 1) State Alternate Hypothesis. Ha: mean ~= 150cc
  # 2) State Null Hypothesis. Ho: mean = 150cc
  # 3) Select Probability error (alpha) level. Generally 0.05 (5%)
  # 4) Select and compute test statistic. z, t, or other
  # 5) Critical test statistic
  # 6) Interpret results. Failed to reject (accept) or Reject Null

# 2 tail test
  # Ho: Mu = 150cc
  # Ha: Mu ~= 150cc
# 1 tail test (lower)
  # Ho: Mu >= 150cc
  # Ha: Mu < 150cc
# 1 tail test (upper)
  # Ho: Mu <= 150cc
  # Ha: Mu > 150cc
### TIP!!! Ha or Alternate points towards the tail. Null is always equal to
### TIP!!! Never accept Null, you fail to reject Null

# Calculating Test Statistic (z.test() w/ BSDA package)
  
  # Single Sample z-test
    # z = (stat - mu) / sigma
  # Multiple Samples z-test
    # z = (x-bar - mu) / (sigma / sqrt(n))
  
  # t-test (use sample sd & degrees of freedom (df))
    # t = (x-bar - mu) / (sd / sqrt(n)), df = n - 1

### TIP!! Z-test when you have sigma
### TIP!! T-test when you don't have sigma 

# Find z critical value. Gives 1-tail, for 2-tail divide error by 2
qnorm(p=.005) # 1% 2-tail (99% Confidence)
qnorm(p=.01) # 1% 1-tail or 2% 2-tail

# Example: Test perfume machine that fills bottles to 150cc with 95% confidence
  # Mu = 150, sigma = 2, Critical Values: z = -1.96 & 1.96
    # Ho: Mu = 150cc
    # Ha: Mu ~= 150cc
    
    # 1 sample = 153cc
      # z = (153 - 150) / 2 = 1.5
      # -1.96 < "1.5" < 1.96 (accept or fail to reject Null)
    
    # 4 sample avg = 153cc
      # z = (153 - 150) / (2 / sqrt(4)) = 3
      # 3 > 1.96 (reject the Null)
   
    # 100 sample avg = 152cc (Perfume Volume.csv)
      # z = (152 - 150) / (2 / sqrt(100)) = 10
      # 10 > 1.96 (reject the Null)

### TIP!! With package BSDA, there is a z-test (z.test)
z.test(x = perfume_volumes$Machine.1, alternative = "greater", 
       mu = 150, sigma.x = 2)

  # Same example as above without the sigma (use t-test)
    # 4 sample avg = 151cc
    # t = (151 - 150) / (2 / sqrt(4)) = 1, df = 3 (go to chart)
    # t-crit = 3.182
    # 1 < 3.182 (fail to reject Null)
vol <- c(151, 152, 150, 151)
t.test(x = vol, mu = 150, conf.level = 0.95)
    # p-value = 0.09172 > 0.025 (accept Null)
    
  # with a new sample, avg 152
vol <- c(151, 152, 153, 152)
t.test(x = vol, mu = 150, conf.level = 0.95)
    # p-value = 0.01628 < 0.025 (reject Null)
    # graph using visualize (stat is t-value)
visualize.t(stat = c(-4.899,4.899), df = 3, section = "tails")

# graphing t distributions

  # make a sequence
q <- seq(-4.0, 4.0, by = 0.1)
  # use sequence with df of 19
dt(q, 19)
plot(q, dt(q, 19), type = "l", lty = "solid", main = "t graph", xlab = "t", ylab = "f(t)")
lines(q, dt(q, 9), type = "l", lty = "dashed")
lines(q, dt(q, 4), type = "l", lty = "dotted")

# Two Sample Z-test (taking samples from 2 different populations)
  # Ho: Mu1 = Mu2
  # Ha: Mu1 ~= Mu2

  # Formula 
  # (x-bar1 - x-bar2) / sqrt((var1 / stat1) + (var2 / stat2))  or
  # ((x-bar1 - x-bar2) - (Mu1 - Mu2)) / sqrt((var1 / stat1) + (var2 / stat2))

  # Using data pulled from csv
  # Find the means and variances of both machines
    mean1 <- mean(Perfume_volumes_2$Machine.1)
    var1 <- var(Perfume_volumes_2$Machine.1)
    mean2 <- mean(Perfume_volumes_2$Machine.2)
    var2 <- var(Perfume_volumes_2$Machine.2)
  # Find our critical value for 95% confidence
    crit.upper <- qnorm(p=0.975)
    crit.lower <- qnorm(p=0.025)
  # simplify formula by doing top then bottom
    top <- mean1-mean2
    bottom <- sqrt((var1/100)+(var2/100))
    z2 <- top/bottom
  # test against critical value
    z2 > crit.upper
    z2 < crit.lower
  # if both are false the you fail to reject Null, otherwise reject
  # by rejecting we are saying that there is a statistical difference in means

# 2 sample z-test using BSDA
    # Ho: Mu1 - Mu2 = 0
    # Ha: Mu1 - Mu2 ~= 0
    z.test(x = Perfume_volumes_2$Machine.1, y = Perfume_volumes_2$Machine.2, 
           sigma.x = sd(Perfume_volumes_2$Machine.1), 
           sigma.y = sd(Perfume_volumes_2$Machine.2)
           ) # reject Null
    
# 2 sample z-test when difference in Mu is -1
    # Ho: Mu1 - Mu2 = -1
    # Ha: Mu1 - Mu2 ~= -1
    z.test(x = Perfume_volumes_2$Machine.1, y = Perfume_volumes_2$Machine.2, 
           sigma.x = sd(Perfume_volumes_2$Machine.1), 
           sigma.y = sd(Perfume_volumes_2$Machine.2), mu = -1.0
           ) # accept Null
    
# 2 sample t-test var's are "equal" (no pop mean or Mu)
   
    # Formula
    #   Pooled Variance (if var is same from both samples)
    #       pvar = ((n1 - 1)(var1) + (n2 - 1)(var2)) / n1 + n2 - 2
    #          t = (x-bar1 - x-bar2) / (pvar * sqrt((1/n1) + (1/n2)))
  
      mc1 <- c(150,152,154,152,151)
      mc2 <- c(156,158,155,155,154)
      
    # Check to see if var's are same with 95% confidence (default)
      
      var.test(x = mc1, y = mc2, conf.level = 0.95) # check p-value
      
    # if var is same, do t-test at 95% confidence
      
      t.test(x = mc1, y = mc2, var.equal = T)
      boxplot(mc1, mc2)

    # Conclusion: these 2 machines need to be readjusted
      
# 2 sample t-test var's are "not equal"
      
      mc1 <- c(150, 152, 154, 152, 151)
      mc3 <- c(144, 162, 177, 150, 140)
      
      var.test(x = mc1, y = mc3)
      
      t.test(x = mc1, y = mc3, var.equal = F)
      boxplot(mc1, mc3)
      
    # Conclusion: Our test could not confirm due to too much variation in mc3
    #               Null will stand until proof to reject
      

# Paired t-test (samples are dependant on each other. ex. before and after)
     
      # Formula
      #   Find the differences between 2 set of readings = d1, d2,... dn
      #   Find mean and sd (or var) of those differences
      #   t = d-bar / sqrt(var / n)
      
      # BP's taken before and after medicine. Is there a difference in BP?
      #   5 patients
      #     d-bar = 1.4, sd = 4.56, n = 5
      #     t = 1.4 / sqrt(4.56^2 / 5) 
      #     t-cal  = 0.70
      #     t-crit = +- 2.766 (2 tail, alpha 5% is 2.5 at each tail. Use chart)
      #     t-cal falls within the range for t-crit
      # Conclusion: There is no evidence of signifcant change in BP (Accept Null)
      
    # Paired t-test with R
      bp.before <- c(120, 122, 143, 100, 109)
      bp.after <- c(122, 120, 141, 109, 109)
      
      var.test(x = bp.before, y = bp.after)
      t.test(x = bp.before, y = bp.after, paired = T)
      
    # Graph above
      bp.diff <- bp.after - bp.before
      boxplot(bp.diff, main = "Effects of medicine on BP", 
              ylab = "Post medicine BP differenc")      
      