### Variance Testing

  # Chi-square test
    # Used to test one sample variance against the population variance
      # 1 sample proportion test, goodness of fit test, & contingency tables
      # rchisq(), pchisq(), qchisq(), dchisq()

  # F-test
    # Used to test two sample variances against the population variance
      # rf(), pf(), qf(), df()  

  # ANOVA
    # Used to test 3 or more sample variances against the population variance
      # aov()

### Chi-square test
  
  #formula
    # x^2 = (n - 1)sd^2/sigma^2

  # Example: A sample of 25 bottles was selected. The variance of these 25
  #           bottles was 5cc. Has it increased from the established 4cc?
    # 95% confidence level
    # Ho: sd^2 = sigma^2
    # Ha: sd^2 ~= sigma^2
      # x^2 = 24 * 5 / 4 = 30 (use chart or see below)
      # x^2-crit = 36.42
      # x^2-cal = 30
      # 30 < 36.42 (fail to reject Null)

  # To check the variance of a sample (if this was a sample)
    var(perfume_volumes$Machine.1) # calculate variance
    varTest(x = perfume_volumes$Machine.1, 
            sigma.squared = 4, alternative = "greater")

  # To find the critical value of Chi-square
    chi.crit <- qchisq(p = 0.05, df = 24, lower.tail = F)

  # Plot Chi-square distribution
    x <- seq(1, 50, by = 1)
    y <- dchisq(x, 24)
    plot(y, type = "l", xlab = "Chi-square", ylab = "f(Chi-square)")
    abline(v=30)
    text(30, 0.5, "Calculated") 
    abline(v=chi.crit)
    text(chi.crit, 0.035, "Critical")
    # Conclusion: no significant var at 95% confidence

        
  ## Goodness of Fit test
    # Formula
      # x^2 = summation(observed - expected)^2 / expected
    
      # Example 1: flip a coin 100x, get H 40x
    
        # Ho: Data followed a specific distribution
        # Ha: Data did not follow a specific distribution
      
        # H: 50 expected, 40 observered
        # T: 50 expected, 60 observered
        
        # Maual Calc
          # H: 40 - 50 = -10^2 = 100 / 50 = 2
          # T: 60 - 50 =  10^2 = 100 / 50 = 2
          # 2 + 2 = 4
          # x^2 = 4
          # crit = 3.84 (use chart)
        # Conclusion: reject Null, coin is biased
      
    ## Using R for above
        flip <- c(40, 60)
        chisq.test(x = flip, p = c(0.5,0.5))
        
      # chi-square calculated
        ch.cal <- (((40 - 50)^2)/50) + (((60 - 50)^2)/50)
        
      # chi-square critical
        ch.crit <- qchisq(p = 0.05, df = 1, lower.tail = F)
        
      # graph using visualize
        visualize.chisq(stat = 4, df = 1, section = "upper")
      
    # Example 2: Shirt manufacturor has the following expectations
    #           expected      s = 20%, m = 40%, l = 30%, xl = 10%
    #           actual        s = 211, m = 402, l = 297, xl = 80
    # Is there significant difference between expected and actual?
        
        sh.p <- c(0.2, 0.4, 0.3, 0.1)
        sh.a <- c(211, 402, 297, 80)
        
        chisq.test(x = sh.a, p = sh.p)
        qchisq(p = 0.05, df = 3, lower.tail = F) # check the crit vs cal
        
        visualize.chisq(stat = 4.59, df = 3, section = "upper")
        
### F-test
    
    # Formula
    #   F = var1 / var2 (which ever var is higher becomes numerator)
    
    # Ho: var1 = var2
    # Ha: var1 ~= var2
    
    # Example: 8 sample from mca and 5 from mcb. F-test at 90% confidence
      mca <- c(150, 150, 151, 149, 151, 151, 148, 151)
      mcb <- c(152, 146, 152, 150, 155)
      
      var.a <- var(mca)
      var.b <- var(mcb) # larger of the 2 becomes x   
      var.test(x = mcb, y = mca, ratio = 1, conf.level = 0.90)
      Fcal <- var.b/var.a # F calculated value
      Fcrit <- qf(p = 0.05, df1 = 4, df2 = 7, lower.tail = F)

    # Graph F distribution
      x <- seq(0, 10)
      df(x, df1 = 4, df2 = 7)
      
      plot(df(x, df1 = 4, df2 = 7), type = "l", xlab = "F Value", 
           ylab = "Density")
      abline(v=Fcal)
      text(Fcal, 0.35, label = "Calculated")
      abline(v=Fcrit)
      text(Fcrit, 0.27, label = "Critical")
      
      boxplot(mca,mcb) # visual of the variance
      
      
### ANOVA - Analysis of Variance
      
      # Formula for variance
        # var or sd^2 = sumation(stat - x-bar)^2 / n-1
        # numerator is "Sum of Squares (SS) formula"
      # SST = Total of Sum of Squares
        # (SS between machines- "treatment") + (SS within machine - "error")
      # Ratio = SS treatment / SS error
      # Mean SS (MS) = SS / df
     
    ## Doing ANOVA manually 
      # Compare 3 machines
        mc1 <- c(150,151,152,152,151,150)
        mc2 <- c(153,152,148,151,149,152)
        mc3 <- c(156,154,155,156,157,155)
      # quick visual
        boxplot(mc1, mc2, mc3) 
        
      # find the means
        mc1.mean <- mean(mc1)
        mc2.mean <- mean(mc2)
        mc3.mean <- mean(mc3)
      # mean of means
        ovr.mean <- mean(c(mc1.mean,mc2.mean,mc3.mean)) 
        
      # Total samples
        tot.samp <- length(c(mc1, mc2, mc3))
        
      # total treatments (use mean to get value of 1 for each treatment)
        tot.treat <- length(c(mc1.mean, mc2.mean, mc3.mean)) 
      
      # SS between   
        mc1.ss.be <- ((mc1.mean - ovr.mean)^2)*length(mc1)    
        mc2.ss.be <- ((mc2.mean - ovr.mean)^2)*length(mc2)
        mc3.ss.be <- ((mc3.mean - ovr.mean)^2)*length(mc2)
        
        ss.be <- mc1.ss.be + mc2.ss.be + mc3.ss.be
        
      # SS within
        mc1.ss.wi <- sum((mc1 - mc1.mean)^2)         
        mc2.ss.wi <- sum((mc2 - mc2.mean)^2)
        mc3.ss.wi <- sum((mc3 - mc3.mean)^2)
        
        ss.wi <- mc1.ss.wi + mc2.ss.wi + mc3.ss.wi
        
      # Total Sum of Squares and Ratio
        sst <- ss.be + ss.wi
        ss.ratio <- ss.be / ss.wi
        
      # degrees of freedom
        df.treat <- tot.treat - 1
        df.error <- tot.samp - tot.treat
        df.tot <- df.treat + df.error
        
      # Mean Sum of Squares
        ms.treat <- ss.be / df.treat
        ms.error <- ss.wi / df.error

      # F-value
        Fcal <- ms.treat / ms.error
        Fcrit <- qf(p = 0.05, df1 = df.treat, df2 = df.error, lower.tail = F)
        
        Fcal < Fcrit # comes back false, reject Null
        
    # Using R to do ANOVA
      # Compare 3 machines
        mc1 <- c(150,151,152,152,151,150)
        mc2 <- c(153,152,148,151,149,152)
        mc3 <- c(156,154,155,156,157,155)
        
      # data prep - creat a data frame
        volume <- c(mc1, mc2, mc3)

        machine <- rep(c("machine1", "machine2", "machine3"),
                       times = c(length(mc1),length(mc2),length(mc3))
                       )        
        
        vol.mc <- data.frame(volume, machine)
        
      # ANOVA in R is function aov()
        mc.aov <- aov(data = vol.mc, formula = volume ~ machine)
        summary(mc.aov) 
        
      # Use a Post-hoc test to determine which machine is bad
        TukeyHSD(x = mc.aov)
        