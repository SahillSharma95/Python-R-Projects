# ML Project - predicting credit card defaults for 10,000 customers (classification ML)

######################################

# Written by Sahill S Sharma - 25/12/2023 #

######################################

# Import the CC dataset (Taiwan cc customers from 04/2005 - 09/2005, limit to 10k records for processing purposes)
library(readxl)
library(tidyverse)

install.packages("caret")

CCdata = read_excel("UCI_Credit_Card.xlsx")

# First ML model to use - Logistic Regression
# Dependent variable (y) = DEFAULT
# Independent/predictor variables (x) = all the rest


# Train test split the data (train = 80% (0.8), test = 20% (0.2))
#make this example reproducible
set.seed(1)

#use 70% of dataset as training set and 30% as test set
dt = sort(sample(nrow(CCdata), nrow(CCdata)*.7))
train<-CCdata[dt,]
test<-CCdata[-dt,]

dim(train)
dim(test)

# fit the training data to logistic regression model
trainmodel <- glm(DEFAULT ~.,family=binomial(link='logit'),data=train)

summary(trainmodel)

# make predictions on the test data
prob_default <- predict(trainmodel,
                      new_data = test,
                      type = "response")

default.pred = rep(0, dim(train)[1])
default.pred[prob_default > .5] = 1

default.pred

table(default.pred, train$DEFAULT)

mean(default.pred == train$DEFAULT)

library(caret)

example <- confusionmatrix()

prob_default

?rep

?predict

# Logistic regression model can predict whether a CC customer will default with about 80% accuracy, using a 70/30 train/test split. 
# Statistically significant predictors (y) in the model were: Education, Marriage status, September 05 payment status,
# July 05 payment status, September 05 bill amount, September 05 payment amount, with the rest being statistically insignificant. 
