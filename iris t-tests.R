# One and two tailed t-test using the sample iris dataset #

######################################

# Written by Sahill S Sharma - 25/12/2023 #

######################################

# load the iris data
library(datasets)

iris
irisdata <- iris

# summary statistics for the iris data
summary(iris)
hist(iris$Petal.Width) # not norm dist
hist(iris$Sepal.Length) #looks roughly bell-shaped
hist(iris$Sepal.Width) # looks very bell-shaped
hist(iris$Petal.Length) # not norm dist

# lets run t-tests on sepal.length and sepal.width, as these look the most normally distributed in sample

##################################################################################################################

#Q1
# (For sepal.length) H0: Population mean = 6
#                    H1: Population mean != 6

# calculate t-statistic (xbar - mu)/(s/sqrt(n))
sdseplnth <- sd(iris$Sepal.Length)
tstat <- ((5.843 - 6)/(0.823/sqrt(150)))
tstat
# abs(t-statistic) = 2.336391 (149 df)

# get the critical value, at 5% level of significance
?qt
qt(p=.05/2, df=149, lower.tail=FALSE)
# critical value = 1.976013

# Since 2.34 > 1.98 (2 d.p), we reject H0 and conclude there is sufficient evidence at 5% significance level
# to conclude that the population mean for Sepal Length is NOT 6. 

##################################################################################################################

#Q2
# (For sepal.width) H0: Population mean = 3
#                    H1: Population mean != 3

# calculate t-statistic (xbar - mu)/(s/sqrt(n))

sdsepwdth # sample st.dev = 0.4358663
tstatwidth <- ((3.057 - 3)/(0.4359/sqrt(150)))
tstatwidth
# abs(t-statistic) = 1.601525 (149 df)

qt(p=.05/2, df=149, lower.tail=FALSE)
# critical value = 1.976013

# Conclusion: as the test statistic of 1.60 < critical value of 1.98 (2 d.p), we fail to reject the null hypothesis
# and conclude that the population mean for sepal width could indeed be 3. 



# For sepal length, proven with statistical significance above the pop mean cannot be 6. 
# Run a one-tailed t-test to see if it could be greater/less than 6. 

##################################################################################################################

#Q3a
# (For sepal.length) H0: Population mean = 6
#                    H1: Population mean > 6

# calculate t-statistic (xbar - mu)/(s/sqrt(n))
sdseplnth <- sd(iris$Sepal.Length)
tstat <- ((5.843 - 6)/(0.823/sqrt(150)))
tstat
# abs(t-statistic) = 2.336391 (149 df)

# test statistic (p=0.05 as we are testing one tail only)
qt(p=.05, df=149, lower.tail=FALSE)
# critical value = 1.65

# 2.34 > 1.65, therefore reject H0, conclude population mean could be greater than 6. 



