Coursera - Getting and Cleaning Data - Week 4 - Course Project

Code Book

Following data were used as the basis for the analysis:

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

Description of the original data set

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Step 1: Merge the training and the test sets to create one data set.

Following data sets were red into the tables:

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

The corresponding coloumn names were assigned. The data sets were merged.

Step 2: Extract only the measurements on the mean and standard deviation for each measurement

Get the activity labels and features (as character) and select only the mean and standard deviation.
The variable "activity_labels_char" contains the labels of the activity in the data class character.
The variable "features_labels_char" contains the labels of the features in the data class character.

Step 3: Use descriptive activity names to name the activities in the data set

Assign the name vector from step 2 to the activities data

Step 4. Appropriately label the data set with descriptive activity names

The labels of the data were correspondingly adjusted with the function gsub.

Step 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

The tidy data set was created with the help of the functions aggregate from the plyr package. The according clean data was stored in the variable Data2. The name of the corresponding tidy data set is tidydata.txt.




