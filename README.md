Hi, here i'm going to explain how my code works. Have fun.

First thing i load the features.

###### Train Data and Subject Names ######

Here i just load the files to make the Train data set: the data, the activities and the subjects. 
Then i bind them together to the rownames(features) and name de firts two rows.

###### Test Data and Subject Names ######

Here i just load the files to make the Test data set: the data, the activities and the subjects. 
Then i bind them together to the rownames(features) and name de firts two rows.

###### Creating one data set ######

First i create a new column that identify the origin of each row: train or test, and set as the 
first column.
Then i bind the two data sets into one with all the data.

###### Mean and Standard Deviation ######

Here i identify which are the features about mean and standard deviation, i use this features to
create a new table.

###### Activity Names ######

Replaces the value in the "activity" column by his relative name.

####### Mean table #######

Create 180 groups defined by the "subject" and "activity" and sumarize their mean in all features.

###### END ######
