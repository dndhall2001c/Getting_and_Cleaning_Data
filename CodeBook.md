The purpose of this set of code is to perform the following:

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


The origional source of this data is:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Steps performed to this data:
 1)  Retreived the data from the above website and unzipped the file into a working directory
 2)  Pulled the data from the files into dataframes
 3)  Combined activity codes with actvity names (seperately for train and for testing data sets)
 4)  Combined data readings with only the activity names from step 3 (seperately for train and for testing data sets)
 5)  Combined the subjects with table from step 4 (seperately for train and for testing data sets)
 6)  Added and identifier to each data set to identify a row with either test or training data sets
 7)  Set column labels for each of the newly added columns to step 8 will function
 8)  Verified column codes for both test and train data sets were identical
 9)  Combined test and train datasets into one data set
10)  Identified which columns in the data sets had standard deviation or mean
11)  Extracted only the columns found in step 10 to a new dataframe
12)  Added in the activity information to the new dataframe (it's name did not have std or mean in it)
13)  Selected the selected column names from the feature table/dataframe
13)  Added a new feature name for the activity column which was derived from the activites table
14)  Made a new names for the columns from the feature table without ()
15)  Created a csv with a conversion from the origional names to the cleaned up names
16)  Labeled the columns with the new names
17)  Wrote out the new dataset


Variables used in the R script with a description:

        testx    ##temporary dataframe used for readings from device for subjects during testing
        testy    ##temporary dataframe used for activity codes for what was done during testing
        trainx   ##temporary dataframe used for readings from device for subjects training
        trainy   ##temporary dataframe used for activity codes for what was done for the readings during training
        tatst    ##temporary dataframe used during merging of activity codes and activity name for testing
        tatrn    ##temporary dataframe used during merging of activity codes and activity name for training
        test1    ##temporary dataframe used for combining activites names with measurements table
        train1   ##temporary dataframe used for combining activites names with measurements table
        testsub  ##temporary dataframe used for table of subjects that did testing
        trainsub ##temporary dataframe used for table of subjects that did training
        test2    ##temporary dataframe used when combining the subjects with combined the readings and activites
        train2   ##temporary dataframe used when combining the subjects with combined the readings and activites
        activity ##temporary dataframe used for user friendly decriptions of the activities performed
        cols     ##temporary dataframe used for column names
        tdf      ##temporary dataframe used to store and add XXX and Activity to the column names
        tf1      ##temporary dataframe used to remove the () out of the column names
        testcrit ##temporary variable used to retreive the columns that had std or mean - used in conjunction with tempfeatures
        tempfeatures  ##temporary dataframe used to get only columns that had std or mean in the name
        features ##temporary dataframe used to store feature names
        test     ##final combined dataset for testing data.  Includes subject, activity name and measurements for those who tested
        train    ##final combined dataset for testing data.  Includes subject, activity name and measurements for those who trained
        mergedata##temporary dataframe used to all merged data from train and test data sets        
        tempdf  ##temporary dataframe used to pull out select columns readings from all data  