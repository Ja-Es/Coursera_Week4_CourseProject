#################### download and load the data (not part of the script)
# 
# myurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# 
# # create folder and load data (if not already exist)
# if (!file.exists("UCI HAR Dataset")){
#     dir.create("UCI HAR Dataset")    }
# 
# if (!file.exists("./UCI HAR Dataset/zipfile.zip")) {
#     download.file(myurl, "./UCI HAR Dataset/zipfile.zip",method = "curl");
#     unzip("./UCI HAR Dataset/zipfile.zip")}
# 


#load data (included in the script as I use quite a lot of the files)
test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

featurenames <- read.table("./UCI HAR Dataset/features.txt")
labels_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
labels_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjects_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjects_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")



############

# Task 1: Merges the training and the test sets to create one data set.
combined <- rbind(train,test)
activity_labels <- rbind(labels_train,labels_test)
subject_labels <- rbind(subjects_train,subjects_test)
names(combined) <- featurenames[,2]


# Task 2: Extract only measurements on mean and standard deviation 
meanstdnames <- grep("mean\\(\\)|std\\(\\)",featurenames[,2])
combinedmeanstd <- combined[,meanstdnames]


library(dplyr)
#Task 3: Uses descriptive activity names to name the activities in the data set
combinedmeanstd <- mutate(combinedmeanstd, activitylabels=activity_labels[[1]])
combinedmeanstd$activitylabels <- 
    gsub("1","WALKING",combinedmeanstd$activitylabels)
combinedmeanstd$activitylabels <- 
    gsub("2","WALKING_UPSTAIRS",combinedmeanstd$activitylabels)
combinedmeanstd$activitylabels <- 
    gsub("3","WALKING_DOWNSTAIRS",combinedmeanstd$activitylabels)
combinedmeanstd$activitylabels <- 
    gsub("4","SITTING",combinedmeanstd$activitylabels)
combinedmeanstd$activitylabels <- 
    gsub("5","STANDING",combinedmeanstd$activitylabels)
combinedmeanstd$activitylabels <- 
    gsub("6","LAYING",combinedmeanstd$activitylabels)

#Task 4: Appropriately labels the data set with descriptive variable names. 
combinedmeanstd <- mutate(combinedmeanstd, subjectlabels=subject_labels[[1]])
names(combinedmeanstd) <- 
    gsub("tBody","bodytimedomainsignals",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("tGravity","gravitytimedomainsignals",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("fBody","bodyfouriertransform",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("fGravity","gravityfouriertransform",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("Acc","accelerometer",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("Gyro","gyroscope",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("Mag","magnitude",names(combinedmeanstd))
names(combinedmeanstd) <- 
    gsub("\\(\\)(-)?","",names(combinedmeanstd))

#Task 5: create second data set with the average of each variable for each activity and each subject.
averagedcombinedmeanstd <- 
    combinedmeanstd %>% 
    group_by(activitylabels,subjectlabels) %>% 
    summarise_each(list(mean = mean))

#save data set for submission
write.table(averagedcombinedmeanstd,file="tidyaveragedDataset.txt",row.name=FALSE)  
