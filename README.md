# Course_projet_clear_data
Code for performing analysis of the course project
1. Set the working directory in the first code line with setwd("here_write_the_path_where_the_folder_UCI HAR Dataset_ist")
2. Run the code

##CODEBOOK

activity_lab : integer, used to create the categorical variable activity label     
tBodyAcc_mean_X : mean of the  time domain signals body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  X direction
tBodyAcc_mean_Y : mean of the  time domain signals body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  Y direction
tBodyAcc_mean_Z : mean of the  time domain signals body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  Z direction
tGravityAcc_mean_X : mean of the  time domain signals gravity acceleration in the  X direction
tGravityAcc_mean_Y : mean of the  time domain signals gravity acceleration in the  Y direction
tGravityAcc_mean_Z : mean of the  time domain signals gravity acceleration in the  Z direction
tBodyAccJerk_mean_X : mean of the  time domain signals  in the  X direction
tBodyAccJerk_mean_Y : mean of the  time domain signals  in the  Y direction
tBodyAccJerk_mean_Z : mean of the  time domain signals body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  Z direction
tBodyGyro_mean_X : mean of the  time domain signals  in the  X direction
tBodyGyro_mean_Y : mean of the  time domain signals  in the  Y direction
tBodyGyro_mean_Z : mean of the  time domain signals  in the  Z direction
tBodyGyroJerk_mean_X : mean of the  time domain signals  in the  X direction
tBodyGyroJerk_mean_Y : mean of the  time domain signals  in the  Y direction
tBodyGyroJerk_mean_Z : mean of the  time domain signals  in the  Z direction
tBodyAccMag_mean : mean of the  time domain signals body acceleration  
tGravityAccMag_mean : mean of the  time domain signals gravity acceleration  
tBodyAccJerkMag_mean : mean of the  time domain signals   
tBodyGyroMag_mean : mean of the  time domain signals   
tBodyGyroJerkMag_mean : mean of the  time domain signals   
fBodyAcc_mean_X : mean of the  Fast Fourier transform body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  X direction
fBodyAcc_mean_Y : mean of the  Fast Fourier transform body acceleration in the  Y direction
fBodyAcc_mean_Z : mean of the  Fast Fourier transform body acceleration in the  Z direction
fBodyAcc_meanFreq_X : mean of the  Fast Fourier transform body acceleration in the  X direction
fBodyAcc_meanFreq_Y : mean of the  Fast Fourier transform body acceleration in the  Y direction
fBodyAcc_meanFreq_Z : mean of the  Fast Fourier transform body acceleration in the  Z direction
fBodyAccJerk_mean_X : mean of the  Fast Fourier transform body acceleration in the  X direction
fBodyAccJerk_mean_Y : mean of the  Fast Fourier transform body acceleration in the  Y direction
fBodyAccJerk_mean_Z : mean of the  Fast Fourier transform body acceleration in the  Z direction
fBodyAccJerk_meanFreq_X : mean of the  Fast Fourier transform body acceleration in the  X direction
fBodyAccJerk_meanFreq_Y : mean of the  Fast Fourier transform body acceleration in the  Y direction
fBodyAccJerk_meanFreq_Z : mean of the  Fast Fourier transform  in the  Z direction
fBodyGyro_mean_X : mean of the  Fast Fourier transform  in the  X direction
fBodyGyro_mean_Y : mean of the  Fast Fourier transform  in the  Y direction
fBodyGyro_mean_Z : mean of the  Fast Fourier transform  in the  Z direction
fBodyGyro_meanFreq_X : mean of the  Fast Fourier transform  in the  X direction
fBodyGyro_meanFreq_Y : mean of the  Fast Fourier transform  in the  Y direction
fBodyGyro_meanFreq_Z : mean of the  Fast Fourier transform  in the  Z direction
fBodyAccMag_mean : mean of the  Fast Fourier transform   
fBodyAccMag_meanFreq : mean of the  Fast Fourier transform   
fBodyBodyAccJerkMag_mean : mean of the  Fast Fourier transform body acceleration  
fBodyBodyAccJerkMag_meanFreq : mean of the  Fast Fourier transform body acceleration  
fBodyBodyGyroMag_mean : mean of the  Fast Fourier transform   
fBodyBodyGyroMag_meanFreq : mean of the  Fast Fourier transform   
fBodyBodyGyroJerkMag_mean : mean of the  Fast Fourier transform   
fBodyBodyGyroJerkMag_meanFreq : mean of the  Fast Fourier transform   
tBodyAcc_std_X : standar deviation of the  time domain signals body acceleration obtained by subtracting the gravity from the total acceleration  of a signal in the  X direction
tBodyAcc_std_Y : standar deviation of the  time domain signals  in the  Y direction
tBodyAcc_std_Z : standar deviation of the  time domain signals  in the  Z direction
tGravityAcc_std_X : standar deviation of the  time domain signals gravity acceleration in the  X direction
tGravityAcc_std_Y : standar deviation of the  time domain signals gravity acceleration in the  Y direction
tGravityAcc_std_Z : standar deviation of the  time domain signals gravity acceleration in the  Z direction
tBodyAccJerk_std_X : standar deviation of the  time domain signals  in the  X direction
tBodyAccJerk_std_Y : standar deviation of the  time domain signals  in the  Y direction
tBodyAccJerk_std_Z : standar deviation of the  time domain signals  in the  Z direction
tBodyGyro_std_X : standar deviation of the  time domain signals  in the  X direction
tBodyGyro_std_Y : standar deviation of the  time domain signals  in the  Y direction
tBodyGyro_std_Z : standar deviation of the  time domain signals  in the  Z direction
tBodyGyroJerk_std_X : standar deviation of the  time domain signals  in the  X direction
tBodyGyroJerk_std_Y : standar deviation of the  time domain signals  in the  Y direction
tBodyGyroJerk_std_Z : standar deviation of the  time domain signals  in the  Z direction
tBodyAccMag_std : standar deviation of the  time domain signals body acceleration  
tGravityAccMag_std : standar deviation of the  time domain signals gravity acceleration  
tBodyAccJerkMag_std : standar deviation of the  time domain signals body acceleration  
tBodyGyroMag_std : standar deviation of the  time domain signals   
tBodyGyroJerkMag_std : standar deviation of the  time domain signals   
fBodyAcc_std_X : standar deviation of the  Fast Fourier transform  in the  X direction
fBodyAcc_std_Y : standar deviation of the  Fast Fourier transform  in the  Y direction
fBodyAcc_std_Z : standar deviation of the  Fast Fourier transform  in the  Z direction
fBodyAccJerk_std_X : standar deviation of the  Fast Fourier transform  in the  X direction
fBodyAccJerk_std_Y : standar deviation of the  Fast Fourier transform  in the  Y direction
fBodyAccJerk_std_Z : standar deviation of the  Fast Fourier transform  in the  Z direction
fBodyGyro_std_X : standar deviation of the  Fast Fourier transform  in the  X direction
fBodyGyro_std_Y : standar deviation of the  Fast Fourier transform  in the  Y direction
fBodyGyro_std_Z : standar deviation of the  Fast Fourier transform  in the  Z direction
fBodyAccMag_std : standar deviation of the  Fast Fourier transform   
fBodyBodyAccJerkMag_std : standar deviation of the  Fast Fourier transform   
fBodyBodyGyroMag_std : standar deviation of the  Fast Fourier transform   
fBodyBodyGyroJerkMag_std : standar deviation of the  Fast Fourier transform   
subject : subject, integer.     
activity_lab : label of the activity mesured, categorical variable     

