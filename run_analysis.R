##Purpose of this script is to do the following:
##
## The goal is to prepare tidy data that can be used for later analysis.
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##Deliverables:
## 1) a tidy data set as described below
## 2) a link to a Github repository with your script for performing the analysis
## 3) a code book that describes the variables, the data, and any transformations 
##    or work that you performed to clean up the data called CodeBook.md.
##    You should also include a README.md in the repo with your scripts. 

##
## source data for this project:
##    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##
## set working directory
##
setwd("~/R/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
##
##  pull the files into a data frame
##
        trainx <- read.table("./train/X_train.txt")  ##reading from device for subjects training
        testx <- read.table("./test/x_test.txt")  ##reading from device for subjects during testing
        trainy <- read.table("./train/y_train.txt")  ##activity codes for what was done for the readings during training
        testy <- read.table("./test/y_test.txt")  ##activity codes for what was done during testing
        trainsub <- read.table("./train/subject_train.txt")  ##table of subjects that did training
        testsub <- read.table("./test/subject_test.txt")  ##table of subjects that did the testing
        features <- read.table("./features.txt")  ##table defining the readings accumulated during testing and training
        activity <- read.table("./activity_labels.txt")  ##user friendly decriptions of the activities performed
##
##create dataframe that gives user friendly terms for codes for the activities
##

        tatst <- merge(testy, activity)
        tatrn <- merge(trainy, activity)

##
## merge subjects with user frendly name of activity.
##
        test1 <- cbind( testx, tatst$V2)
        train1 <- cbind(trainx, tatrn$V2)

##
## Merge subjects with measurements
##
        test2 <- cbind( test1, testsub)
        train2 <- cbind(train1, trainsub)
##
## Add column to identify source of data for traceability
##
        test <-  cbind ( test2,'test')
        train <-  cbind ( train2, 'train')
##
##set column names
##
        colnames(test)[562] <- 'activity'  
        colnames(test)[563] <- 'source'  
        colnames(test)[564] <- 'subject'
        colnames(train)[562] <- 'activity'
        colnames(train)[563] <- 'source'
        colnames(train)[564] <- 'subject'
##
## Merge two sets together
##
        mergedata <- rbind(train, test)
##
##Grab columns that have mean, std and put them to new data set
##

##
##find which columns have mean or std
##
        testcrit <- grep("mean\\(|std\\(", features[,2])
        
        
##pull out columns
        temp_df <- mergedata[, testcrit]
##add activity to df
        finaldata <- cbind(temp_df, mergedata$activity)
        
        tempfeatures <- features[testcrit,]
        rm(features)
        rm(mergedata)
        rm(temp_df)
        rm(testcrit)
##
## add row for activities data point
##
        t_df <- data.frame('XXX','Activity')
        names(t_df) <- c("V1","V2")
        cols <- rbind(tempfeatures,t_df)
        rm(t_df)
##
## make new names without ()
##
        tf1 <- cbind(cols, gsub("\\(\\)", "" , cols$V2))
        rm(cols)
        write.csv(tf1, file='./column_name_translation.csv')
##
## add row for activities data point
##
        
        ##rbind(tempfeatures, c("999","activity"))
##
##add labels to the columns
##
        names(finaldata) <- tf1[, 3]
        rm(tf1)
        rm(tempfeatures)
        
##        
##write out tidy_file
##
        write.csv(finaldata, file='./tidydata.csv')
##
## clean up
##
        
        rm(testx)    ##temporary dataframe used for readings from device for subjects during testing
        rm(testy)    ##temporary dataframe used for activity codes for what was done during testing
        rm(trainx)   ##temporary dataframe used for readings from device for subjects training
        rm(trainy)   ##temporary dataframe used for activity codes for what was done for the readings during training
        rm(tatst)    ##temporary dataframe used during merging of activity codes and activity name for testing
        rm(tatrn)    ##temporary dataframe used during merging of activity codes and activity name for training
        rm(test1)    ##temporary dataframe used for combining activites names with measurements table
        rm(train1)   ##temporary dataframe used for combining activites names with measurements table
        rm(testsub)  ##temporary dataframe used for table of subjects that did testing
        rm(trainsub) ##temporary dataframe used for table of subjects that did training
        rm(test2)    ##temporary dataframe used when combining the subjects with combined the readings and activites
        rm(train2)   ##temporary dataframe used when combining the subjects with combined the readings and activites
        rm(activity) ##temporary dataframe used for user friendly decriptions of the activities performed
        
        rm(test)     ##final combined dataset for testing data.  Includes subject, activity name and measurements for those who tested
        rm(train)    ##final combined dataset for testing data.  Includes subject, activity name and measurements for those who trained
        
        