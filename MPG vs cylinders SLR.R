# Simple Linear Regression analysis on the sample mtcars dataset

# Written by Sahill S Sharma - 23/12/2023

library(datasets)

data()

data <- mtcars

# Question - is the number of cylinders a car has, a statistically significant predictor of a car's MPG (miles per gallon?)

plot(mtcars$cyl, mtcars$mpg, xlab = "Cylinders", 
                              ylab = "Miles per Gallon", 
                              main = "Scatterplot of MPG vs Cylinders") # appears to be a strong negative trending relationship here - linear assumption met

?plot
cars.lm <- lm(mpg ~ cyl, data = data)
summary(cars.lm)

# check for all assumptions
par(mfrow = c(2, 2))
plot(cars.lm)
# all assumptions look fine, residuals (i.e. predicted - actual) are distributed normally. 

# Regression equation: MPG = 37.8846 - 2.8758cyl (for every 1 unit inc in MPG, expect a 2.9 unit decrease in cyl - 
                                                  # makes sense as less cylinders generally equate to better MPG)

# Adjusted R-squared of 0.72 suggests very strong statistical relationship between cylinder and MPG. P-value of 
# 6.113e-10 < 5% sig level, so can reject the null, and accept that there is a relationship present. 