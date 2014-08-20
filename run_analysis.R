rm(list=ls())

X_test = read.table('.\\test\\X_test.txt')
Y_test = read.table('.\\test\\y_test.txt')
s_test = read.table('.\\test\\subject_test.txt')   

X_train = read.table('.\\train\\X_train.txt')
Y_train = read.table('.\\train\\y_train.txt')
s_train = read.table('.\\train\\subject_train.txt') 

X_total = rbind(X_test, X_train)
Y_total = rbind(Y_test, Y_train)
s_total = rbind(s_test, s_train)

features = read.table('.\\features.txt')  
activity = read.table('.\\activity_labels.txt') 

chars = as.character(features[,2])
value = '-mean|-std'

idx = grepl(value, chars)

features[idx,2]
sum(idx)

X_raw = X_total[,idx]
Y_raw = sapply(Y_total, function(x) as.factor(activity[x,2]))

names(X_raw) = as.character(features[idx,2])
names(Y_raw) = 'Activity'
names(s_total) = 'Subject'

data = cbind(s_total, Y_raw, X_raw)

tidy = aggregate( data[,-c(1,2)] ~ data$Subject+data$Activity, data[,-c(1,2)], mean )
