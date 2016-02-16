##Getting and Cleaning Data Project


#Description

Additional information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

#Source Data

A full description of the data used in this project can be found at The UCI Machine Learning Repository
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The source data for this project can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


#Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Attribute Information

For each record in the dataset it is provided: 
.Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
.Triaxial Angular velocity from the gyroscope. 
.A 561-feature vector with time and frequency domain variables. 
.Its activity label. 
.An identifier of the subject who carried out the experiment.

#Section 1. Merge the training and the test sets to create one data set.

After setting the source directory for the files, read into tables the data located in
.features.txt
.activity_labels.txt
.subject_train.txt
.x_train.txt
.y_train.txt
.subject_test.txt
.x_test.txt
.y_test.txt

Assign column names and merge to create one data set.

#Section 2. Extract only the measurements on the mean and standard deviation for each measurement.

Subset Name of Features by measurements on the mean and standard deviation
i.e taken Names of Features with "mean()" or "std()"

#Section 3. Use descriptive activity names to name the activities in the data set

Merge data subset with the activityType table to inlude the descriptive activity names

#Section 4. Appropriately label the data set with descriptive activity names.

Use gsub function for pattern replacement to clean up the data labels.

#Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Per the project instructions, we need to produce only a data set with the average of each veriable for each activity and subject

The tidy data set includes a data frame with 180 observations on the following 68 variables.

     'subject' a numeric vector

     'activity' a factor with levels 'WALKING' 'WALKING_UPSTAIRS'
          'WALKING_DOWNSTAIRS' 'SITTING' 'STANDING' 'LAYING'

     'timeBodyAccelerometer-mean()-X' a numeric vector

     'timeBodyAccelerometer-mean()-Y' a numeric vector

     'timeBodyAccelerometer-mean()-Z' a numeric vector

     'timeBodyAccelerometer-std()-X' a numeric vector

     'timeBodyAccelerometer-std()-Y' a numeric vector

     'timeBodyAccelerometer-std()-Z' a numeric vector

     'timeGravityAccelerometer-mean()-X' a numeric vector

     'timeGravityAccelerometer-mean()-Y' a numeric vector

     'timeGravityAccelerometer-mean()-Z' a numeric vector

     'timeGravityAccelerometer-std()-X' a numeric vector

     'timeGravityAccelerometer-std()-Y' a numeric vector

     'timeGravityAccelerometer-std()-Z' a numeric vector

     'timeBodyAccelerometerJerk-mean()-X' a numeric vector

     'timeBodyAccelerometerJerk-mean()-Y' a numeric vector

     'timeBodyAccelerometerJerk-mean()-Z' a numeric vector

     'timeBodyAccelerometerJerk-std()-X' a numeric vector

     'timeBodyAccelerometerJerk-std()-Y' a numeric vector

     'timeBodyAccelerometerJerk-std()-Z' a numeric vector

     'timeBodyGyroscope-mean()-X' a numeric vector

     'timeBodyGyroscope-mean()-Y' a numeric vector

     'timeBodyGyroscope-mean()-Z' a numeric vector

     'timeBodyGyroscope-std()-X' a numeric vector

     'timeBodyGyroscope-std()-Y' a numeric vector

     'timeBodyGyroscope-std()-Z' a numeric vector

     'timeBodyGyroscopeJerk-mean()-X' a numeric vector

     'timeBodyGyroscopeJerk-mean()-Y' a numeric vector

     'timeBodyGyroscopeJerk-mean()-Z' a numeric vector

     'timeBodyGyroscopeJerk-std()-X' a numeric vector

     'timeBodyGyroscopeJerk-std()-Y' a numeric vector

     'timeBodyGyroscopeJerk-std()-Z' a numeric vector

     'timeBodyAccelerometerMagnitude-mean()' a numeric vector

     'timeBodyAccelerometerMagnitude-std()' a numeric vector

     'timeGravityAccelerometerMagnitude-mean()' a numeric vector

     'timeGravityAccelerometerMagnitude-std()' a numeric vector

     'timeBodyAccelerometerJerkMagnitude-mean()' a numeric vector

     'timeBodyAccelerometerJerkMagnitude-std()' a numeric vector

     'timeBodyGyroscopeMagnitude-mean()' a numeric vector

     'timeBodyGyroscopeMagnitude-std()' a numeric vector

     'timeBodyGyroscopeJerkMagnitude-mean()' a numeric vector

     'timeBodyGyroscopeJerkMagnitude-std()' a numeric vector

     'frequencyBodyAccelerometer-mean()-X' a numeric vector

     'frequencyBodyAccelerometer-mean()-Y' a numeric vector

     'frequencyBodyAccelerometer-mean()-Z' a numeric vector

     'frequencyBodyAccelerometer-std()-X' a numeric vector

     'frequencyBodyAccelerometer-std()-Y' a numeric vector

     'frequencyBodyAccelerometer-std()-Z' a numeric vector

     'frequencyBodyAccelerometerJerk-mean()-X' a numeric vector

     'frequencyBodyAccelerometerJerk-mean()-Y' a numeric vector

     'frequencyBodyAccelerometerJerk-mean()-Z' a numeric vector

     'frequencyBodyAccelerometerJerk-std()-X' a numeric vector

     'frequencyBodyAccelerometerJerk-std()-Y' a numeric vector

     'frequencyBodyAccelerometerJerk-std()-Z' a numeric vector

     'frequencyBodyGyroscope-mean()-X' a numeric vector

     'frequencyBodyGyroscope-mean()-Y' a numeric vector

     'frequencyBodyGyroscope-mean()-Z' a numeric vector

     'frequencyBodyGyroscope-std()-X' a numeric vector

     'frequencyBodyGyroscope-std()-Y' a numeric vector

     'frequencyBodyGyroscope-std()-Z' a numeric vector

     'frequencyBodyAccelerometerMagnitude-mean()' a numeric vector

     'frequencyBodyAccelerometerMagnitude-std()' a numeric vector

     'frequencyBodyAccelerometerJerkMagnitude-mean()' a numeric vector

     'frequencyBodyAccelerometerJerkMagnitude-std()' a numeric vector

     'frequencyBodyGyroscopeMagnitude-mean()' a numeric vector

     'frequencyBodyGyroscopeMagnitude-std()' a numeric vector

     'frequencyBodyGyroscopeJerkMagnitude-mean()' a numeric vector

     'frequencyBodyGyroscopeJerkMagnitude-std()' a numeric vector

