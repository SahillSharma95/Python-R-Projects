# Iris dataset Machine Learning Project - Species Classification

# Import the iris.csv dataset
import pandas as pd
import numpy as np

data = pd.read_csv('Iris.csv')

print(data.head())

# Get values of the predictor and target variables into X and y arrays
X = data.loc[0: ,['Id', 'SepalLengthCm', 'PetalLengthCm', 'PetalWidthCm']].values # Do not flatten X as it needs to be the same number of observations as y
y = data.loc[0: ,['Species']].values
y = np.ravel(y) # flattened 1-D array of y

# get the shape
print(X.shape)
print(y.shape)

# Split the data using train_test_split. For this example, train = 0.7 and test = 0.3
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.3, random_state = 3, stratify = y)

print(X_train.shape)
print(y_train.shape)
print(X_test.shape)
print(y_test.shape)
# print(y_train)
# print(y_test)

# Standardize features from train and test datasets to mean 0 and variance 1
from sklearn.preprocessing import StandardScaler

sc = StandardScaler()

sc.fit(X_train) # only scale features not target
print(sc.mean_, sc.scale_)

X_train_scaled = sc.transform(X_train)

print('Train means:', X_train.mean(axis=0), X_train_scaled.mean(axis=0))
print('Train sigmas', X_train.std(axis=0), X_train_scaled.std(axis=0))

X_test_scaled = sc.transform(X_test)
print('Test means:', X_test.mean(axis=0), X_test_scaled.mean(axis=0))
print('Test sigmas', X_test.std(axis=0), X_test_scaled.std(axis=0))

# Fit classification models to the above test data and compare performance
# Logistic Regression with random_state = 11
from sklearn.linear_model import LogisticRegression
lr = LogisticRegression(random_state=11)
lr.fit(X_train_scaled, y_train)
lr_accuracy_test = print(f'LR Test Accuracy = {lr.score(X_test_scaled, y_test):.3f}')


# SVM_linear with C = 6.0, random_state = 11
from sklearn.svm import SVC

svm_linear = SVC(kernel='linear', C=6.0, random_state=11)
svm_linear.fit(X_train_scaled, y_train)
SVM_linear_accuracy_test = print(f'SVM Linear Test Accuracy = {svm_linear.score(X_test_scaled, y_test):.3f}')

# KNN with n_neighbors = 6, p = 3, metric = 'minkowski'

from sklearn.neighbors import KNeighborsClassifier
knn = KNeighborsClassifier(n_neighbors=6, p=3, metric='minkowski')

knn.fit(X_train_scaled, y_train)
knn_accuracy_test = print(f'KNN Test Accuracy = {knn.score(X_test_scaled, y_test):.3f}')







