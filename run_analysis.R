rm(list=ls())

setwd('/Users/Zerg/Downloads/UCI-HAR-Dataset/')

# X_test = read.table('.\\test\\X_test.txt')
# Y_test = read.table('.\\test\\y_test.txt')
# s_test = read.table('.\\test\\subject_test.txt')   
# 
# X_train = read.table('.\\train\\X_train.txt')
# Y_train = read.table('.\\train\\y_train.txt')
# s_train = read.table('.\\train\\subject_train.txt') 
# 
# X_total = rbind(X_test, X_train)
# Y_total = rbind(Y_test, Y_train)
# s_total = rbind(s_test, s_train)
# 
# features = read.table('.\\features.txt')  
# activity = read.table('.\\activity_labels.txt') 

X_test = read.table('./test/X_test.txt')
Y_test = read.table('./test/y_test.txt')
s_test = read.table('./test/subject_test.txt')   

X_train = read.table('./train/X_train.txt')
Y_train = read.table('./train/y_train.txt')
s_train = read.table('./train/subject_train.txt') 

X_total = rbind(X_test, X_train)
Y_total = rbind(Y_test, Y_train)
s_total = rbind(s_test, s_train)

features = read.table('./features.txt')  
activity = read.table('./activity_labels.txt') 

chars = as.character(features[,2])
value = '-mean|-std'

idx = grepl(value, chars)

features[idx,2]
sum(idx)

X_raw = X_total[,idx]
Y_raw = sapply(Y_total, function(x) activity[x,2])
Y_raw = data.frame(Y_raw)

names(X_raw) = as.character(features[idx,2])
names(Y_raw) = 'Activity'
names(s_total) = 'Subject'

data = cbind(s_total, Y_raw, X_raw)

tidy1 = aggregate( . ~ Activity + Subject, data, mean )
tidy2 = tidy1[c(2,1,3:81)] 

tidy3 = aggregate( . ~ Subject + Activity, data, mean )