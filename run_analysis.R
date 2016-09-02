run_analysis.R

# Coursera Getting and Cleaning Data Course Project

# 1.Merge the training and the test sets to create one data set.
# 1a. set the appropriate working directory
setwd("C:/Users/michael/OneDrive/Coursera_Data Science/Getting and cleaning data/Getting and cleaning data - week 4/Course Project/getdata%2Fprojectfiles%2FUCI HAR Dataset")



# 1b. read in the single "train" data sets (as data frame)

train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# 1c. combine the three "train" data sets to one

train_merged <- cbind(subject_train, Y_train, train)

#1d. read in the single "test" data sets (as data frame)

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# 1e. combine the three "train" data sets to one
test_merged <- cbind(subject_test, Y_test, X_test)

# 1f. connect the data sets with each other
merged <- rbind(train_merged, test_merged)

# 2. Extract only the measurements on the mean and standard deviation for each measurement (from the data set "merged")

# 2.1 get the activity labels and features (as char)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
# choose only the second coloumn but all rows:
activity_labels_char <- as.character(activityLabels[,2])
features_labels <- read.table("UCI HAR Dataset/features.txt")
features_labels_char <- as.character(features[,2])

# 2.2 select only the data on mean and standard deviation
features_mean_std <- grep(".*mean.*|.*std.*", features_labels_char)
features_mean_std.names <- features[features_mean_std,2]
features_mean_std.names = gsub('-mean', 'Mean', features_mean_std.names)
features_mean_std.names = gsub('-std', 'Std', features_mean_std.names)
features_mean_std.names <- gsub('[-()]', '', features_mean_std.names)

# 3. Use descriptive activity names to name the activities in the data set
colnames(merged) <- c("subject", "activity", features_mean_std.names)


# 4. Appropriately label the data set with descriptive variable names

# Cleaning up the variable names
for (i in 1:length(colnames(merged))) 
{
  colnames(merged)[i] = gsub("\\()","",colnames(merged)[i])
  colnames(merged)[i] = gsub("-std$","StdDev",colnames(merged)[i])
  colnames(merged)[i] = gsub("-mean","Mean",colnames(merged)[i])
  colnames(merged)[i] = gsub("^(t)","time",colnames(merged)[i])
  colnames(merged)[i] = gsub("^(f)","freq",colnames(merged)[i])
  colnames(merged)[i] = gsub("([Gg]ravity)","Gravity",colnames(merged)[i])
  colnames(merged)[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(merged)[i])
  colnames(merged)[i] = gsub("[Gg]yro","Gyro",colnames(merged)[i])
  colnames(merged)[i] = gsub("AccMag","AccMagnitude",colnames(merged)[i])
  colnames(merged)[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colnames(merged)[i])
  colnames(merged)[i] = gsub("JerkMag","JerkMagnitude",colnames(merged)[i])
  colnames[i](merged) = gsub("GyroMag","GyroMagnitude",colnames(merged)[i])
}

#5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr);
Data2<-aggregate(. ~subject + activity, merged, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
