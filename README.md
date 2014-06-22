##Purpose of this script is to do the following:
##
## The goal is to prepare tidy data that can be used for later analysis.
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 

Make sure the Samsung data is in you working directory.

Then source the run.analysis.R

You should have 3 files writen to your working directory
1- tidydata.csv - a csv of the data that has standard deviation and mean values
2- tidydata.txt - a text version of the csv
3- column_name_translation.csv - a csv file of the origional names to the translation names

You should only have one dataframe left in r - called finaldata.  This is a dataframe of the tidydata dataset.