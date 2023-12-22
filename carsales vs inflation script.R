## Test statistical significance between inflation (x) and Australian car sales (y)##

## Written by Sahill S Sharma - 21/12/2023 ##

library(tidyverse)
library(readxl)
library(lubridate)
library(sqldf)

## We will use a linear regression analysis to see the relationship ##

## Import year-ended car sales and year-ended unemployment data (Sep 2003 - Sep 2023 for simplicity) ##

# set wd
wd <- setwd("~/Desktop/SAHILL/Master_of_Business_Analytics/R Projects/Car sales vs inflation")

# carsales data
carsales <- read_excel("Carsales_data_05_22.xlsx")

# inflation data
inflation <- read_excel("inflationRates_05_22_monthly.xls")


# as the RBA inflation data was provided on a monthly basis, will have to group these by year and get the average inflation rate/year #
inflation_year <- inflation %>%
  group_by(year = year(Date)) %>%
  summarise(avg_infrate = mean(`Inflation Rate`))


# join the inflation data and carsales data using SQL within R to make one useable table (join on year)

inflation_carsales <- sqldf("select a.*, b.carsales
                              FROM inflation_year as a
                              LEFT JOIN carsales as b on a.year = b.Year")

# assumption check for a SLR - linearity

summary(inflation_carsales)

str(inflation_carsales)

plot(inflation_carsales$avg_infrate, inflation_carsales$Carsales) # there is no linear relationship here at all


inflation_carsales$Carsales = unlist(inflation_carsales$Carsales)

inflation.carsales.lm <- lm(Carsales ~ avg_infrate, data = inflation_carsales)
summary(inflation.carsales.lm)


# in conclusion, SLR is not a good predictor/model for car sales vs inflation, as the R-squared is so low (-0.01535). A p-value of ~0.40 also suggests
# that there is no statistically significant relationship present between car sales and inflation, at the 5% significance level. 

            