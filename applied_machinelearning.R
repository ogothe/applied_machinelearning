#Load Library
library(caret)

#Load Data
data <- read.csv("pml-training.csv")
quiz_data <- read.csv("pml-testing.csv")

#Partition Data
train_ind = createDataPartition(data$classe,p=0.50,list=FALSE)
training <- data[train_ind,]
testing <- data[-train_ind,]

#Train Model
mod = train(training$classe~total_accel_belt+total_accel_arm+total_accel_dumbbell+total_accel_forearm+pitch_forearm+pitch_belt+pitch_dumbbell+pitch_arm+yaw_belt+yaw_forearm+yaw_dumbbell+yaw_arm+,method='ranger',training)

#Find Accuracy
predict(mod,test_ts_removed,na.action=na.omit)
confusionMatrix(predict(mod,testing),testing$classe)

