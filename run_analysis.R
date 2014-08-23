# ------------------------------------------------------------------------------
# 1. Initialization
# ------------------------------------------------------------------------------
rm(list=ls())
# Note you need to set the path to the Samsung data set: 
setwd('/Users/Zerg/Downloads/UCI-HAR-Dataset/')

# ------------------------------------------------------------------------------
# 2. Load test set
# ------------------------------------------------------------------------------
X_test = read.table('./test/X_test.txt')
Y_test = read.table('./test/y_test.txt')
s_test = read.table('./test/subject_test.txt')   

# ------------------------------------------------------------------------------
# 3. Load training set
# ------------------------------------------------------------------------------
X_train = read.table('./train/X_train.txt')
Y_train = read.table('./train/y_train.txt')
s_train = read.table('./train/subject_train.txt') 

# ------------------------------------------------------------------------------
# 4. Merge test and training sets
# ------------------------------------------------------------------------------
X_total = rbind(X_test, X_train)
Y_total = rbind(Y_test, Y_train)
s_total = rbind(s_test, s_train)

# ------------------------------------------------------------------------------
# 5. Extracts only the measurements on the mean and standard deviation 
#    for each measurement
# ------------------------------------------------------------------------------
features = read.table('./features.txt')  
 
varNames = as.character(features[,2])
keyword = '-mean|-std'
idx = grepl(keyword, varNames)

X_raw = X_total[,idx]

# ------------------------------------------------------------------------------
# 6. Use discriptive activity names to name activities in the data set
# ------------------------------------------------------------------------------
activity = read.table('./activity_labels.txt')
Y_raw = sapply(Y_total, function(x) activity[x,2])
Y_raw = data.frame(Y_raw)

# ------------------------------------------------------------------------------
# 7. Appropriately label the data set with descriptive variable names
# ------------------------------------------------------------------------------
names(X_raw) = as.character(features[idx,2])
names(Y_raw) = 'Activity'
names(s_total) = 'Subject'
data = cbind(s_total, Y_raw, X_raw)

# ------------------------------------------------------------------------------
# 8. Creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject
# ------------------------------------------------------------------------------
tidy = aggregate( . ~ Activity + Subject, data, mean)
tidy = tidy[c(2,1,3:81)] 

# ------------------------------------------------------------------------------
# 9. Write tidy data set as a txt file 
# ------------------------------------------------------------------------------
write.table(tidy, file = 'tidySet.txt', row.names=F, append = F)
