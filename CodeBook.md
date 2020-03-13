---
title: "CodeBook.md"
author: "Janina Esins"
date: "Date: 13 March 2020"
output: html_document
---

This code book describes the variables, the data, and any transformations or work that was performed to clean up the data.

## Original data set

The original data was downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file contains an explanation on the variables (called "features_info.txt").

## Script "run_analysis.R"

The script "run_analysis.R" takes the original data and

1. Merges the training and the test sets to create one data set called "combined".
It also adds the activity labels and subject labels for each row as two extra columns (taken from the original data). Furthermore the column names are added.
2. Extracts only the measurements on the mean and standard deviation for each measurement. This is done by filtering all columns with "mean()" or "std()" in the name. The result is saved in a new data frame "combinedmeanstd".
3. Uses descriptive activity names to name the activities in the data set. For this the numbers 1 to 6 in column activitylabels are replaced by descriptive names as denoted in file "activity_labels.txt" of the original data.
4. Appropriately labels the data set with descriptive variable names. For this the abbrevations are written full as explained in "features_info.txt" in the original data.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This data frame is called "averagedcombinedmeanstd" in the script and saved as "tidyaveragedDataset.txt".

## Data set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


The set of variables that were estimated from these signals are:

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values.
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.



Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

These variables where then reduced to only those variables being mean and std of the measurements. Furthermore the variable names became more descriptive (variables 1 to 66). In addition the lables of activity and subkect were added (Variables 67 and 68):

 [1] "bodytimedomainsignalsaccelerometer-meanX"               
 [2] "bodytimedomainsignalsaccelerometer-meanY"               
 [3] "bodytimedomainsignalsaccelerometer-meanZ"               
 [4] "bodytimedomainsignalsaccelerometer-stdX"                
 [5] "bodytimedomainsignalsaccelerometer-stdY"                
 [6] "bodytimedomainsignalsaccelerometer-stdZ"                
 [7] "gravitytimedomainsignalsaccelerometer-meanX"            
 [8] "gravitytimedomainsignalsaccelerometer-meanY"            
 [9] "gravitytimedomainsignalsaccelerometer-meanZ"            
[10] "gravitytimedomainsignalsaccelerometer-stdX"             
[11] "gravitytimedomainsignalsaccelerometer-stdY"             
[12] "gravitytimedomainsignalsaccelerometer-stdZ"             
[13] "bodytimedomainsignalsaccelerometerJerk-meanX"           
[14] "bodytimedomainsignalsaccelerometerJerk-meanY"           
[15] "bodytimedomainsignalsaccelerometerJerk-meanZ"           
[16] "bodytimedomainsignalsaccelerometerJerk-stdX"            
[17] "bodytimedomainsignalsaccelerometerJerk-stdY"            
[18] "bodytimedomainsignalsaccelerometerJerk-stdZ"            
[19] "bodytimedomainsignalsgyroscope-meanX"                   
[20] "bodytimedomainsignalsgyroscope-meanY"                   
[21] "bodytimedomainsignalsgyroscope-meanZ"                   
[22] "bodytimedomainsignalsgyroscope-stdX"                    
[23] "bodytimedomainsignalsgyroscope-stdY"                    
[24] "bodytimedomainsignalsgyroscope-stdZ"                    
[25] "bodytimedomainsignalsgyroscopeJerk-meanX"               
[26] "bodytimedomainsignalsgyroscopeJerk-meanY"               
[27] "bodytimedomainsignalsgyroscopeJerk-meanZ"               
[28] "bodytimedomainsignalsgyroscopeJerk-stdX"                
[29] "bodytimedomainsignalsgyroscopeJerk-stdY"                
[30] "bodytimedomainsignalsgyroscopeJerk-stdZ"                
[31] "bodytimedomainsignalsaccelerometermagnitude-mean"       
[32] "bodytimedomainsignalsaccelerometermagnitude-std"        
[33] "gravitytimedomainsignalsaccelerometermagnitude-mean"    
[34] "gravitytimedomainsignalsaccelerometermagnitude-std"     
[35] "bodytimedomainsignalsaccelerometerJerkmagnitude-mean"   
[36] "bodytimedomainsignalsaccelerometerJerkmagnitude-std"    
[37] "bodytimedomainsignalsgyroscopemagnitude-mean"           
[38] "bodytimedomainsignalsgyroscopemagnitude-std"            
[39] "bodytimedomainsignalsgyroscopeJerkmagnitude-mean"       
[40] "bodytimedomainsignalsgyroscopeJerkmagnitude-std"        
[41] "bodyfouriertransformaccelerometer-meanX"                
[42] "bodyfouriertransformaccelerometer-meanY"                
[43] "bodyfouriertransformaccelerometer-meanZ"                
[44] "bodyfouriertransformaccelerometer-stdX"                 
[45] "bodyfouriertransformaccelerometer-stdY"                 
[46] "bodyfouriertransformaccelerometer-stdZ"                 
[47] "bodyfouriertransformaccelerometerJerk-meanX"            
[48] "bodyfouriertransformaccelerometerJerk-meanY"            
[49] "bodyfouriertransformaccelerometerJerk-meanZ"            
[50] "bodyfouriertransformaccelerometerJerk-stdX"             
[51] "bodyfouriertransformaccelerometerJerk-stdY"             
[52] "bodyfouriertransformaccelerometerJerk-stdZ"             
[53] "bodyfouriertransformgyroscope-meanX"                    
[54] "bodyfouriertransformgyroscope-meanY"                    
[55] "bodyfouriertransformgyroscope-meanZ"                    
[56] "bodyfouriertransformgyroscope-stdX"                     
[57] "bodyfouriertransformgyroscope-stdY"                     
[58] "bodyfouriertransformgyroscope-stdZ"                     
[59] "bodyfouriertransformaccelerometermagnitude-mean"        
[60] "bodyfouriertransformaccelerometermagnitude-std"         
[61] "bodyfouriertransformBodyaccelerometerJerkmagnitude-mean"
[62] "bodyfouriertransformBodyaccelerometerJerkmagnitude-std" 
[63] "bodyfouriertransformBodygyroscopemagnitude-mean"        
[64] "bodyfouriertransformBodygyroscopemagnitude-std"         
[65] "bodyfouriertransformBodygyroscopeJerkmagnitude-mean"    
[66] "bodyfouriertransformBodygyroscopeJerkmagnitude-std"     
[67] "activitylabels"                                         
[68] "subjectlabels" 


The final data set was then averaged for each activity and each subject over every variable. As there are 6 activities and 30 subjects the final data set contains 6*30 = 180 measurements of 66 variables.
