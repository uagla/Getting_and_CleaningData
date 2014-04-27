#  Code book 
##Instructions of the run_analysis.r code. 
1. Before running the code: 
* Download the file from the website:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*Unzip it and save the unzipped folder in a working directory. This will be the working directory for the script. If it is not the default R working directory, please change it.
2.  Reads and Appends the datasets from the train data set section (using ReadAppendSet() 
     function):
*X_train.txt:  it has the data with the features names in columns.
* y_train.txt: contains the activity labels
* subject_train.txt:  it includes the subject/participant id number. 
* features.txt: list of the registered features. 
After reading the aforementioned datasets, we append them to a one set (named data1) and considering only the needed measurements (mean and standard deviation) from the features.  
3.  Reads and Appends the datasets from the test data set section (using ReadAppendSet() 
     function):
* X_test.txt:  it has the data with the features names in columns.
* y_test.txt: contains the activity labels
*subject_test.txt:  it includes the subject/participant id number. 
*features.txt: list of the registered features. 
After reading the aforementioned datasets, we append them to a one set (named data2) and considering only the needed measurements (mean and standard deviation) from the features.  
4.  Merges train (data1) and test (data2) sets by means of MergeSet(data1,data2) function. 
The result is a merged data set named datamerged. 
5. Finally, a second data set (dataMelted) is created with the average of each variable for each activity and each subject. It contains 180 rows and 68 columns, indicating for each and each activity what the average of each measure is. 
6. Data sets created in sections 4 and 5 are delivered to the following  .txt files: 
* tidy.txt : the merged data set 
* tidy_average.txt : the average values of tidy.txt 

### Appendix: list of the variables within the data sets:
Subject: Subject's id.
ActName: Type of activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,  SITTING, STANDING,  LAYING).
Feature Selection: 
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
The latter set of variables that were estimated from these signals are: 
mean: Mean value
std: Standard deviation
