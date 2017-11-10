### Contingency Tables
  ## Chi-square test

    # Null Hypothesis: No relationship between row and column
    # Alternate Hypothesis : Is a relationship between row and column

    ### df is calculated by (# of rows - 1) * (# of col's - 1)

  ## Example: 3 operators working 3 shifts. 

        op1 <- c(22, 28, 72)
        op2 <- c(26, 62, 22)
        op3 <- c(23, 26, 66)
    
      # make data frame
        opr <- data.frame(op1, op2, op3, 
                          row.names = c("shift 1", "shift 2", "shift 3")
                          )
      
      # run Chi-square test & compare test stat vs critical
        chisq.test(opr)
        qchisq(p = 0.05, df = 4, lower.tail = F)
        
      # Conclusion: Reject Null
        
  ## Example 2: more complicated data
        
        library(gmodels) # package to use
        library(nycflights13) # data set
        
      # make a variable for easier referencing
        fl <- nycflights13::flights
        head(fl) # will show first 6 rows of a table to get col names
        
      # flights by year - 2013
        CrossTable(x = fl$carrier, y = fl$year)
        
      # flights by month
        CrossTable(x = fl$carrier, y = fl$month, prop.chisq = F, 
                   prop.r = F, prop.c = F, prop.t = F, chisq = T)
            # returns very small p-value, reject Null
            # Conclusion: there is a relation to the carrier and the month of the year
        