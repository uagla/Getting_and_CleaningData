# Getting and Cleaning Data

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## run_analysis.r code description
### Before running
* Download the file from the website:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*Unzip it and save the unzipped folder with the UCI HAR Dataset name  in a working directory. This will be the working directory for the script. If it is not the default R working directory, please change it.
### Code running

#### Functions:
* ReadAppendSet(folder): Reads and appends the datasets within the directory named folder, and the called features.txt and activity_labels.txt files. The result contains only the measurements  relative to mean and standard deviation. 
* MergeSet(data1,data2): it merges the two datasets data1 and data2. The output is a full merged data set with 10299 rows and 68 cols. 
* MeltedData(data1): it computes the average of each variable for each activity and each subject of the dataset data1.  The output is data set with 180 rows and 68 cols.
* MainTidy(file1,file2): it calls the aforementioned three functions in order to get as result the file1 (the one obtained after running MergeSet() function) and file2 (after executing MeltedData() function, the averaged data set). Both are .txt files. 
