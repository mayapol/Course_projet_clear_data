##Cours project
#Read the datasets
?file
setwd("C:\\Users\\maya\\Desktop\\Data scientist 1_files\\clear_data\\course_project\\UCI HAR Dataset")
#Get the Test set
X_test<-read.table(".\\test\\X_test.txt", header=FALSE,stringsAsFactors=FALSE)
head(X_test)
nrow(X_test)
ncol(X_test)
#get subjects of the Test set
subject_test<-read.table(".\\test\\subject_test.txt", header=FALSE,stringsAsFactors=FALSE)
nrow(subject_test)
x_test<-cbind(X_test,subject_test)
head(x_test)
nrow(x_test)
names(x_test)[562]<-paste("subject")
head(x_test)

#get activities labels
y_test<-read.table(".\\test\\y_test.txt", header=FALSE,stringsAsFactors=FALSE)
names(y_test)<-"activity_lab"
head(y_test)
nrow(y_test)
#dataset which includes the activity label
x1_test<-cbind(x_test,y_test)
head(x1_test)
ncol(x1_test)


#Get the Training set
X_train<-read.table(".\\train\\X_train.txt", header=FALSE,stringsAsFactors=FALSE)
head(X_train)
nrow(X_train)
ncol(X_train)
#get subjects
subject_test2<-read.table(".\\train\\subject_train.txt", header=FALSE,stringsAsFactors=FALSE)
nrow(subject_test2)
head(x_test2)
x_test2<-cbind(X_train,subject_test2)
ncol(x_test2)
head(x_test2)
names(x_test2)[562]<-paste("subject")
head(x_test2)

#Getting activities labels for the trainig data set
y_train<-read.table(".\\train\\y_train.txt", header=FALSE,stringsAsFactors=FALSE)
names(y_train)<-"activity_lab"
#dataset which includes the activity label
x_train<-cbind(x_test2,y_train)
head(x_train)
ncol(x_train)

#Binding rows
db1<-rbind(x1_test,x_train)
nrow(db1)
head(db1[,561:563])
ncol(db1)

#Get variables names from dataset features.txt
#Name the 561 measurements
features<-read.table(".\\features.txt",header=FALSE)
f1<-features[,2]
var_names<-as.matrix(f1)
names(db1)<-var_names
head(db1)
ncol(db1)
#Label activity variable
names(db1)[563]<-paste("activity_lab")
names(db1)[562]<-paste("subject")
head(db1)

#Took just the variables which have mean or std in any part of the variable name
#the variables wich have names "angle" are not taken in account
mean_vars<-as.data.frame(grep("mean",f1,value=TRUE))
mean_vars
std_vars<-grep("std",f1,value=TRUE)
std_vars
#HElping me with a .txt file I do a list in order to subset the file db1
#I subset the dataframe according to the variable names
db2<-db1[,c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y"
             ,"tBodyAcc-mean()-Z","tGravityAcc-mean()-X"
             ,"tGravityAcc-mean()-Y","tGravityAcc-mean()-Z"
             ,"tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y"
             ,"tBodyAccJerk-mean()-Z","tBodyGyro-mean()-X"
             ,"tBodyGyro-mean()-Y","tBodyGyro-mean()-Z"             
             ,"tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y"
             ,"tBodyGyroJerk-mean()-Z","tBodyAccMag-mean()"
             ,"tGravityAccMag-mean()","tBodyAccJerkMag-mean()"
             ,"tBodyGyroMag-mean()","tBodyGyroJerkMag-mean()"
             ,"fBodyAcc-mean()-X","fBodyAcc-mean()-Y"
             ,"fBodyAcc-mean()-Z","fBodyAcc-meanFreq()-X"
             ,"fBodyAcc-meanFreq()-Y","fBodyAcc-meanFreq()-Z"
             ,"fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y"
             ,"fBodyAccJerk-mean()-Z","fBodyAccJerk-meanFreq()-X"
             ,"fBodyAccJerk-meanFreq()-Y","fBodyAccJerk-meanFreq()-Z"
             ,"fBodyGyro-mean()-X","fBodyGyro-mean()-Y"
             ,"fBodyGyro-mean()-Z","fBodyGyro-meanFreq()-X"
             ,"fBodyGyro-meanFreq()-Y","fBodyGyro-meanFreq()-Z"
             ,"fBodyAccMag-mean()","fBodyAccMag-meanFreq()"
             ,"fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-meanFreq()"
             ,"fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-meanFreq()"
             ,"fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-meanFreq()"
             ,"tBodyAcc-std()-X", "tBodyAcc-std()-Y",
            "tBodyAcc-std()-Z", "tGravityAcc-std()-X",       
            "tGravityAcc-std()-Y", "tGravityAcc-std()-Z",       
            "tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y",      
            "tBodyAccJerk-std()-Z","tBodyGyro-std()-X",         
            "tBodyGyro-std()-Y","tBodyGyro-std()-Z",         
            "tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y",     
            "tBodyGyroJerk-std()-Z","tBodyAccMag-std()",         
            "tGravityAccMag-std()","tBodyAccJerkMag-std()",     
            "tBodyGyroMag-std()","tBodyGyroJerkMag-std()",    
            "fBodyAcc-std()-X","fBodyAcc-std()-Y",          
            "fBodyAcc-std()-Z","fBodyAccJerk-std()-X",      
            "fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z",      
            "fBodyGyro-std()-X","fBodyGyro-std()-Y",         
            "fBodyGyro-std()-Z","fBodyAccMag-std()",         
            "fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-std()",    
            "fBodyBodyGyroJerkMag-std()","subject","activity_lab")]

#My new data frame has 10299 records and 81 variables
nrow(db2)
ncol(db2)
tail(db2)
names(db2)

#Uses descriptive activity names to name the activities in the data set
#I open the file activity_labels.txt to obtain label activities
activity_lab<-read.table(".\\activity_labels.txt", header=FALSE,stringsAsFactors=FALSE)
names(activity_lab)[1]<-paste("activity_lab")
activity_lab

#merge to obtain a new variable with the activity labels
library(plyr)
db3<-merge(db2,activity_lab,by="activity_lab",all=FALSE)
head(db3)
nrow(db3)
ncol(db3)
names(db3)[82]<-paste("activity_label")
head(db3)


#Step 4, descriptive names 
#in each of the variables, so I go to the next step
names(db3)
names(db3)[1]=paste("activity_lab")
names(db3)[2]=paste("tBodyAcc_mean_X")
names(db3)[3]=paste("tBodyAcc_mean_Y")
names(db3)[4]=paste("tBodyAcc_mean_Z")
names(db3)[5]=paste("tGravityAcc_mean_X")
names(db3)[6]=paste("tGravityAcc_mean_Y")
names(db3)[7]=paste("tGravityAcc_mean_Z")
names(db3)[8]=paste("tBodyAccJerk_mean_X")
names(db3)[9]=paste("tBodyAccJerk_mean_Y")
names(db3)[10]=paste("tBodyAccJerk_mean_Z")
names(db3)[11]=paste("tBodyGyro_mean_X")
names(db3)[12]=paste("tBodyGyro_mean_Y")
names(db3)[13]=paste("tBodyGyro_mean_Z")
names(db3)[14]=paste("tBodyGyroJerk_mean_X")
names(db3)[15]=paste("tBodyGyroJerk_mean_Y")
names(db3)[16]=paste("tBodyGyroJerk_mean_Z")
names(db3)[17]=paste("tBodyAccMag_mean")
names(db3)[18]=paste("tGravityAccMag_mean")
names(db3)[19]=paste("tBodyAccJerkMag_mean")
names(db3)[20]=paste("tBodyGyroMag_mean")
names(db3)[21]=paste("tBodyGyroJerkMag_mean")
names(db3)[22]=paste("fBodyAcc_mean_X")
names(db3)[23]=paste("fBodyAcc_mean_Y")
names(db3)[24]=paste("fBodyAcc_mean_Z")
names(db3)[25]=paste("fBodyAcc_meanFreq_X")
names(db3)[26]=paste("fBodyAcc_meanFreq_Y")
names(db3)[27]=paste("fBodyAcc_meanFreq_Z")
names(db3)[28]=paste("fBodyAccJerk_mean_X")
names(db3)[29]=paste("fBodyAccJerk_mean_Y")
names(db3)[30]=paste("fBodyAccJerk_mean_Z")
names(db3)[31]=paste("fBodyAccJerk_meanFreq_X")
names(db3)[32]=paste("fBodyAccJerk_meanFreq_Y")
names(db3)[33]=paste("fBodyAccJerk_meanFreq_Z")
names(db3)[34]=paste("fBodyGyro_mean_X")
names(db3)[35]=paste("fBodyGyro_mean_Y")
names(db3)[36]=paste("fBodyGyro_mean_Z")
names(db3)[37]=paste("fBodyGyro_meanFreq_X")
names(db3)[38]=paste("fBodyGyro_meanFreq_Y")
names(db3)[39]=paste("fBodyGyro_meanFreq_Z")
names(db3)[40]=paste("fBodyAccMag_mean")
names(db3)[41]=paste("fBodyAccMag_meanFreq")
names(db3)[42]=paste("fBodyBodyAccJerkMag_mean")
names(db3)[43]=paste("fBodyBodyAccJerkMag_meanFreq")
names(db3)[44]=paste("fBodyBodyGyroMag_mean")
names(db3)[45]=paste("fBodyBodyGyroMag_meanFreq")
names(db3)[46]=paste("fBodyBodyGyroJerkMag_mean")
names(db3)[47]=paste("fBodyBodyGyroJerkMag_meanFreq")
names(db3)[48]=paste("tBodyAcc_std_X")
names(db3)[49]=paste("tBodyAcc_std_Y")
names(db3)[50]=paste("tBodyAcc_std_Z")
names(db3)[51]=paste("tGravityAcc_std_X")
names(db3)[52]=paste("tGravityAcc_std_Y")
names(db3)[53]=paste("tGravityAcc_std_Z")
names(db3)[54]=paste("tBodyAccJerk_std_X")
names(db3)[55]=paste("tBodyAccJerk_std_Y")
names(db3)[56]=paste("tBodyAccJerk_std_Z")
names(db3)[57]=paste("tBodyGyro_std_X")
names(db3)[58]=paste("tBodyGyro_std_Y")
names(db3)[59]=paste("tBodyGyro_std_Z")
names(db3)[60]=paste("tBodyGyroJerk_std_X")
names(db3)[61]=paste("tBodyGyroJerk_std_Y")
names(db3)[62]=paste("tBodyGyroJerk_std_Z")
names(db3)[63]=paste("tBodyAccMag_std")
names(db3)[64]=paste("tGravityAccMag_std")
names(db3)[65]=paste("tBodyAccJerkMag_std")
names(db3)[66]=paste("tBodyGyroMag_std")
names(db3)[67]=paste("tBodyGyroJerkMag_std")
names(db3)[68]=paste("fBodyAcc_std_X")
names(db3)[69]=paste("fBodyAcc_std_Y")
names(db3)[70]=paste("fBodyAcc_std_Z")
names(db3)[71]=paste("fBodyAccJerk_std_X")
names(db3)[72]=paste("fBodyAccJerk_std_Y")
names(db3)[73]=paste("fBodyAccJerk_std_Z")
names(db3)[74]=paste("fBodyGyro_std_X")
names(db3)[75]=paste("fBodyGyro_std_Y")
names(db3)[76]=paste("fBodyGyro_std_Z")
names(db3)[77]=paste("fBodyAccMag_std")
names(db3)[78]=paste("fBodyBodyAccJerkMag_std")
names(db3)[79]=paste("fBodyBodyGyroMag_std")
names(db3)[80]=paste("fBodyBodyGyroJerkMag_std")
names(db3)[81]=paste("subject")
names(db3)[82]=paste("activity_label")


#Step 5
#creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

names(db3)
db4<-group_by(db3,subject,activity_label)
tidy_ds<-summarise(db4,mean_tBodyAcc_mean_X=mean(tBodyAcc_mean_X),
          mean_tBodyAcc_mean_Y=mean(tBodyAcc_mean_Y),
          mean_tBodyAcc_mean_Z=mean(tBodyAcc_mean_Z),
          mean_tGravityAcc_mean_X=mean(tGravityAcc_mean_X),
          mean_tGravityAcc_mean_Y=mean(tGravityAcc_mean_Y),
          mean_tGravityAcc_mean_Z=mean(tGravityAcc_mean_Z),
          mean_tBodyAccJerk_mean_X=mean(tBodyAccJerk_mean_X),
          mean_tBodyAccJerk_mean_Y=mean(tBodyAccJerk_mean_Y),
          mean_tBodyAccJerk_mean_Z=mean(tBodyAccJerk_mean_Z),
          mean_tBodyGyro_mean_X=mean(tBodyGyro_mean_X),
          mean_tBodyGyro_mean_Y=mean(tBodyGyro_mean_Y),
          mean_tBodyGyro_mean_Z=mean(tBodyGyro_mean_Z),
          mean_tBodyGyroJerk_mean_X=mean(tBodyGyroJerk_mean_X),
          mean_tBodyGyroJerk_mean_Y=mean(tBodyGyroJerk_mean_Y),
          mean_tBodyGyroJerk_mean_Z=mean(tBodyGyroJerk_mean_Z),
          mean_tBodyAccMag_mean=mean(tBodyAccMag_mean),
          mean_tGravityAccMag_mean=mean(tGravityAccMag_mean),
          mean_tBodyAccJerkMag_mean=mean(tBodyAccJerkMag_mean),
          mean_tBodyGyroMag_mean=mean(tBodyGyroMag_mean),
          mean_tBodyGyroJerkMag_mean=mean(tBodyGyroJerkMag_mean),
          mean_fBodyAcc_mean_X=mean(fBodyAcc_mean_X),
          mean_fBodyAcc_mean_Y=mean(fBodyAcc_mean_Y),
          mean_fBodyAcc_mean_Z=mean(fBodyAcc_mean_Z),
          mean_fBodyAcc_meanFreq_X=mean(fBodyAcc_meanFreq_X),
          mean_fBodyAcc_meanFreq_Y=mean(fBodyAcc_meanFreq_Y),
          mean_fBodyAcc_meanFreq_Z=mean(fBodyAcc_meanFreq_Z),
          mean_fBodyAccJerk_mean_X=mean(fBodyAccJerk_mean_X),
          mean_fBodyAccJerk_mean_Y=mean(fBodyAccJerk_mean_Y),
          mean_fBodyAccJerk_mean_Z=mean(fBodyAccJerk_mean_Z),
          mean_fBodyAccJerk_meanFreq_X=mean(fBodyAccJerk_meanFreq_X),
          mean_fBodyAccJerk_meanFreq_Y=mean(fBodyAccJerk_meanFreq_Y),
          mean_fBodyAccJerk_meanFreq_Z=mean(fBodyAccJerk_meanFreq_Z),
          mean_fBodyGyro_mean_X=mean(fBodyGyro_mean_X),
          mean_fBodyGyro_mean_Y=mean(fBodyGyro_mean_Y),
          mean_fBodyGyro_mean_Z=mean(fBodyGyro_mean_Z),
          mean_fBodyGyro_meanFreq_X=mean(fBodyGyro_meanFreq_X),
          mean_fBodyGyro_meanFreq_Y=mean(fBodyGyro_meanFreq_Y),
          mean_fBodyGyro_meanFreq_Z=mean(fBodyGyro_meanFreq_Z),
          mean_fBodyAccMag_mean=mean(fBodyAccMag_mean),
          mean_fBodyAccMag_meanFreq=mean(fBodyAccMag_meanFreq),
          mean_fBodyBodyAccJerkMag_mean=mean(fBodyBodyAccJerkMag_mean),
          mean_fBodyBodyAccJerkMag_meanFreq=mean(fBodyBodyAccJerkMag_meanFreq),
          mean_fBodyBodyGyroMag_mean=mean(fBodyBodyGyroMag_mean),
          mean_fBodyBodyGyroMag_meanFreq=mean(fBodyBodyGyroMag_meanFreq),
          mean_fBodyBodyGyroJerkMag_mean=mean(fBodyBodyGyroJerkMag_mean),
          mean_fBodyBodyGyroJerkMag_meanFreq=mean(fBodyBodyGyroJerkMag_meanFreq),
          mean_tBodyAcc_std_X=mean(tBodyAcc_std_X),
          mean_tBodyAcc_std_Y=mean(tBodyAcc_std_Y),
          mean_tBodyAcc_std_Z=mean(tBodyAcc_std_Z),
          mean_tGravityAcc_std_X=mean(tGravityAcc_std_X),
          mean_tGravityAcc_std_Y=mean(tGravityAcc_std_Y),
          mean_tGravityAcc_std_Z=mean(tGravityAcc_std_Z),
          mean_tBodyAccJerk_std_X=mean(tBodyAccJerk_std_X),
          mean_tBodyAccJerk_std_Y=mean(tBodyAccJerk_std_Y),
          mean_tBodyAccJerk_std_Z=mean(tBodyAccJerk_std_Z),
          mean_tBodyGyro_std_X=mean(tBodyGyro_std_X),
          mean_tBodyGyro_std_Y=mean(tBodyGyro_std_Y),
          mean_tBodyGyro_std_Z=mean(tBodyGyro_std_Z),
          mean_tBodyGyroJerk_std_X=mean(tBodyGyroJerk_std_X),
          mean_tBodyGyroJerk_std_Y=mean(tBodyGyroJerk_std_Y),
          mean_tBodyGyroJerk_std_Z=mean(tBodyGyroJerk_std_Z),
          mean_tBodyAccMag_std=mean(tBodyAccMag_std),
          mean_tGravityAccMag_std=mean(tGravityAccMag_std),
          mean_tBodyAccJerkMag_std=mean(tBodyAccJerkMag_std),
          mean_tBodyGyroMag_std=mean(tBodyGyroMag_std),
          mean_tBodyGyroJerkMag_std=mean(tBodyGyroJerkMag_std),
          mean_fBodyAcc_std_X=mean(fBodyAcc_std_X),
          mean_fBodyAcc_std_Y=mean(fBodyAcc_std_Y),
          mean_fBodyAcc_std_Z=mean(fBodyAcc_std_Z),
          mean_fBodyAccJerk_std_X=mean(fBodyAccJerk_std_X),
          mean_fBodyAccJerk_std_Y=mean(fBodyAccJerk_std_Y),
          mean_fBodyAccJerk_std_Z=mean(fBodyAccJerk_std_Z),
          mean_fBodyGyro_std_X=mean(fBodyGyro_std_X),
          mean_fBodyGyro_std_Y=mean(fBodyGyro_std_Y),
          mean_fBodyGyro_std_Z=mean(fBodyGyro_std_Z),
          mean_fBodyAccMag_std=mean(fBodyAccMag_std),
          mean_fBodyBodyAccJerkMag_std=mean(fBodyBodyAccJerkMag_std),
          mean_fBodyBodyGyroMag_std=mean(fBodyBodyGyroMag_std),
          mean_fBodyBodyGyroJerkMag_std=mean(fBodyBodyGyroJerkMag_std)     
          )

#Step5, write a .txt file 
write.table(tidy_ds,file=".\\tidy_ds.txt",row.name=FALSE)

