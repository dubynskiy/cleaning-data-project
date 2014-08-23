<<<<<<< HEAD
=======
cleaning-data-project
=====================

>>>>>>> FETCH_HEAD
The project submission includes the following files:
--------------------------------------------------------
- 'README.md'

- 'CodeBook.md': List the variables used and their description

- 'run_analysis.R': R script to generate tidy set as described below


For each record it is provided:
--------------------------------------------------------
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Data set costruction:
--------------------------------------------------------
1. Initialization (clear workspace, setup path to dataset)
2. Load test set
    * X_test - 561-feature vector from test set. Loaded from Test set: 'test/X_test.txt'
    * Y_test - activity label (range 1-6). Loaded from Test labels: 'test/y_test.txt'
    * s_test - an identifier of the subject who carried out the experiment  

3. Load training set
    * varible descriptions are equivalen to test set step

4. Merge test and training sets
    * use rbind() to clip data together

5. Extract only the measurements on the mean and standard deviation 
for each measurement
    * use grepl function with matching keyword = '-mean|-std'. It will 
    return indeces of features with '-mean' or '-std' in their names. 
    * note: both 'mean()' and 'meanFreq()' are returned
     
6. Use discriptive activity names to name activities in the data set (e.g "Walking" and "Walking Up")
    * descriptive activity names obtained from 'activity_labels.txt' in the original dataset  
    and mapped to vector of activity labels Y_total, where Y total is the combined vector of activity labels from training and test sets 

7. Appropriately label the data set with descriptive variable names
    * list of variable names with their describtion is in 'CodeBook.md'

8. Create a second, independent tidy data set with the average 
of each variable for each activity and each subject

9. Write tidy data set to the file 'tidySet.txt'


Notes: 
--------------------------------------------------------
- Features in the original set were normalized and bounded within [-1,1].
<<<<<<< HEAD
=======

>>>>>>> FETCH_HEAD
