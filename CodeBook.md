CODEBOOK

#Background
This file describes the data and the processing of the data collected from a research study of wearable computing. A group of 30 volunteers within an age bracket of 19-48 years was involved in the study. 

#Data collection method
During the study each person had a Samsung Galaxy SII smartphone attached to their waist while performing six activities:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING
Using the smart phones embedded accelerometer and gyroscope, the research
team captured the 3-axial linear acceleration and the 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#Data files
The data is supplied as multiple .txt files, each with a different content.
These data files have not been included in this documentation, but constitute
the output of the gathering process and the input for the data
cleaning and processing process. These files are:
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

#Input data record structure
Each record contains:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Data processing
##Purpose
The aim of the data processing was to:
- Merge the training and the test sets to create one data set
- Extract only the mean and standard deviation for each measurement. The
  values calculated are:
* mean_tBodyAcc
* std_tBodyAcc
* mean_tGravityAcc
* std_tGravityAcc
* mean_tBodyAccJerk 
* std_tBodyAccJerk
* mean_tBodyGyro
* std_tBodyGyro
* mean_tBodyGyroJerk
* std_tBodyGyroJerk
* mean_tBodyAccMag
* std_tBodyAccMag
* mean_tGravityAccMag
* std_tGravityAccMag
* mean_tBodyAccJerkMag
* std_tBodyAccJerkMag
* mean_tBodyGyroMag
* std_tBodyGyroMag
* mean_tBodyGyroJerkMag
* std_tBodyGyroJerkMag
* mean_fBodyAcc
* std_fBodyAcc
* mean_fBodyAccJerk
* std_fBodyAccJerk
* mean_fBodyGyro
* std_fBodyGyro
* mean_fBodyAccMag
* std_fBodyAccMag
* mean_fBodyBodyAccJerkMag
* std_fBodyBodyAccJerkMag
* mean_fBodyBodyGyroMag
* std_fBodyBodyGyroMag
* mean_fBodyBodyGyroJerkMag
* std_fBodyBodyGyroJerkMag

- Use descriptive activity names to name the activities in the data set. The
  activity names are:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

- Appropriately label the data set with descriptive variable names
- Create a second, independent tidy data set with the average of each variable for each activity and each subject

##R code
The R script that performs the above transformation is called *run_analysis.R*.
The code:
- reads the *features.txt* file and converts the column names into valid R
  variable names by eliminating the characters: ( ) and ,
- reads the test data set from the *X_test.txt*, *y_test.txt* and *subject_test.txt* files supplied and merges them into a *X_test_DF* data
frame. This data frame contains all the original features plus the *subjectNo* and *activityNo* columns
- reads the training data set from the *X_training.txt*, *y_training.txt* and
  *subject_training.txt* files supplied and merges them into a *X_test_DF* data
frame. This data frame contains all the original features plus the *subjectNo* and *activityNo* columns
- merges the test and training data frames into one data frame called
  *X_merge*
- calculates the mean and standard deviation of the list of variables
  specified in the previous section
- reads the *activity_labels.txt* file and merges its data with *X_merge*
- calculates the mean of all the variables, makes the data tidy and writes it into a file using the space separator

##Output data
The tidy data is written into a space separated text file called *tidydata.txt*. This file contains
the means of the acceleration and angular measurements for each of the six
activities and for each of the 30 persons.

### Output data fields
All the fields except the "activityName" are numeric and represent the
measurements taken from the sensors. 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAccXYZ
- tGravityAccXYZ
- tBodyAccJerkXYZ
- tBodyGyroXYZ
- tBodyGyroJerkXYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAccXYZ
- fBodyAccJerkXYZ
- fBodyGyroXYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window
- angle(): Angle between to vectors

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The list of fields created in the tidy data set is:
- "activityName" - this is a character vector whose values can be one of the
  six values:
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING
- "subjectNo" - this is an integer value representing the patient number and
  can be between 1 to 30
- "tBodyAccmeanX"
- "tBodyAccmeanY"
- "tBodyAccmeanZ"
- "tBodyAccstdX"
- "tBodyAccstdY"
- "tBodyAccstdZ"
- "tBodyAccmadX"
- "tBodyAccmadY"
- "tBodyAccmadZ"
- "tBodyAccmaxX"
- "tBodyAccmaxY"
- "tBodyAccmaxZ"
- "tBodyAccminX"
- "tBodyAccminY"
- "tBodyAccminZ"
- "tBodyAccsma"
- "tBodyAccenergyX"
- "tBodyAccenergyY"
- "tBodyAccenergyZ"
- "tBodyAcciqrX"
- "tBodyAcciqrY"
- "tBodyAcciqrZ"
- "tBodyAccentropyX"
- "tBodyAccentropyY"
- "tBodyAccentropyZ"
- "tBodyAccarCoeffX.1"
- "tBodyAccarCoeffX.2"
- "tBodyAccarCoeffX.3"
- "tBodyAccarCoeffX.4"
- "tBodyAccarCoeffY.1"
- "tBodyAccarCoeffY.2"
- "tBodyAccarCoeffY.3"
- "tBodyAccarCoeffY.4"
- "tBodyAccarCoeffZ.1"
- "tBodyAccarCoeffZ.2"
- "tBodyAccarCoeffZ.3"
- "tBodyAccarCoeffZ.4"
- "tBodyAcccorrelationX.Y"
- "tBodyAcccorrelationX.Z"
- "tBodyAcccorrelationY.Z"
- "tGravityAccmeanX"
- "tGravityAccmeanY"
- "tGravityAccmeanZ"
- "tGravityAccstdX"
- "tGravityAccstdY"
- "tGravityAccstdZ"
- "tGravityAccmadX"
- "tGravityAccmadY"
- "tGravityAccmadZ"
- "tGravityAccmaxX"
- "tGravityAccmaxY"
- "tGravityAccmaxZ"
- "tGravityAccminX"
- "tGravityAccminY"
- "tGravityAccminZ"
- "tGravityAccsma"
- "tGravityAccenergyX"
- "tGravityAccenergyY"
- "tGravityAccenergyZ"
- "tGravityAcciqrX"
 -"tGravityAcciqrY"
- "tGravityAcciqrZ"
- "tGravityAccentropyX"
- "tGravityAccentropyY"
- "tGravityAccentropyZ"
- "tGravityAccarCoeffX.1"
- "tGravityAccarCoeffX.2"
- "tGravityAccarCoeffX.3"
- "tGravityAccarCoeffX.4"
- "tGravityAccarCoeffY.1"
- "tGravityAccarCoeffY.2"
- "tGravityAccarCoeffY.3"
- "tGravityAccarCoeffY.4"
- "tGravityAccarCoeffZ.1"
- "tGravityAccarCoeffZ.2"
- "tGravityAccarCoeffZ.3"
- "tGravityAccarCoeffZ.4"
- "tGravityAcccorrelationX.Y"
- "tGravityAcccorrelationX.Z"
- "tGravityAcccorrelationY.Z"
- "tBodyAccJerkmeanX"
- "tBodyAccJerkmeanY"
- "tBodyAccJerkmeanZ"
- "tBodyAccJerkstdX"
- "tBodyAccJerkstdY"
- "tBodyAccJerkstdZ"
- "tBodyAccJerkmadX"
- "tBodyAccJerkmadY"
- "tBodyAccJerkmadZ"
- "tBodyAccJerkmaxX"
- "tBodyAccJerkmaxY"
- "tBodyAccJerkmaxZ"
- "tBodyAccJerkminX"
- "tBodyAccJerkminY"
- "tBodyAccJerkminZ"
- "tBodyAccJerksma"
- "tBodyAccJerkenergyX"
- "tBodyAccJerkenergyY"
- "tBodyAccJerkenergyZ"
- "tBodyAccJerkiqrX"
- "tBodyAccJerkiqrY"
- "tBodyAccJerkiqrZ"
- "tBodyAccJerkentropyX"
- "tBodyAccJerkentropyY"
- "tBodyAccJerkentropyZ"
- "tBodyAccJerkarCoeffX.1"- 
- "tBodyAccJerkarCoeffX.2"
- "tBodyAccJerkarCoeffX.3"
- "tBodyAccJerkarCoeffX.4"
- "tBodyAccJerkarCoeffY.1"
- "tBodyAccJerkarCoeffY.2"- 
- "tBodyAccJerkarCoeffY.3"
- "tBodyAccJerkarCoeffY.4"
- "tBodyAccJerkarCoeffZ.1"
- "tBodyAccJerkarCoeffZ.2"
- "tBodyAccJerkarCoeffZ.3"
- "tBodyAccJerkarCoeffZ.4"
- "tBodyAccJerkcorrelationX.Y"
- "tBodyAccJerkcorrelationX.Z"
- "tBodyAccJerkcorrelationY.Z"
- "tBodyGyromeanX"
- "tBodyGyromeanY"
- "tBodyGyromeanZ"
- "tBodyGyrostdX"
- "tBodyGyrostdY"
- "tBodyGyrostdZ"- 
- "tBodyGyromadX"
- "tBodyGyromadY"
- "tBodyGyromadZ"
- "tBodyGyromaxX"
- "tBodyGyromaxY"
- "tBodyGyromaxZ"
- "tBodyGyrominX"
- "tBodyGyrominY"
- "tBodyGyrominZ"
- "tBodyGyrosma"
- "tBodyGyroenergyX"
- "tBodyGyroenergyY"
- "tBodyGyroenergyZ"
- "tBodyGyroiqrX"- 
- "tBodyGyroiqrY"
- "tBodyGyroiqrZ"
- "tBodyGyroentropyX"
- "tBodyGyroentropyY"
- "tBodyGyroentropyZ"
- "tBodyGyroarCoeffX.1"
- "tBodyGyroarCoeffX.2"
- "tBodyGyroarCoeffX.3"
- "tBodyGyroarCoeffX.4"
- "tBodyGyroarCoeffY.1"
- "tBodyGyroarCoeffY.2"
- "tBodyGyroarCoeffY.3"
- "tBodyGyroarCoeffY.4"
- "tBodyGyroarCoeffZ.1"
- "tBodyGyroarCoeffZ.2"
- "tBodyGyroarCoeffZ.3"
- "tBodyGyroarCoeffZ.4"
- "tBodyGyrocorrelationX.Y"- 
- "tBodyGyrocorrelationX.Z"
- "tBodyGyrocorrelationY.Z"
- "tBodyGyroJerkmeanX"
- "tBodyGyroJerkmeanY"
- "tBodyGyroJerkmeanZ"
- "tBodyGyroJerkstdX"
- "tBodyGyroJerkstdY"
- "tBodyGyroJerkstdZ"
- "tBodyGyroJerkmadX"
- "tBodyGyroJerkmadY"
- "tBodyGyroJerkmadZ"
- "tBodyGyroJerkmaxX"
- "tBodyGyroJerkmaxY"
- "tBodyGyroJerkmaxZ"
- "tBodyGyroJerkminX"- 
- "tBodyGyroJerkminY"
- "tBodyGyroJerkminZ"
- "tBodyGyroJerksma"
- "tBodyGyroJerkenergyX"
- "tBodyGyroJerkenergyY"
- "tBodyGyroJerkenergyZ"
- "tBodyGyroJerkiqrX"
- "tBodyGyroJerkiqrY"
- "tBodyGyroJerkiqrZ"
- "tBodyGyroJerkentropyX"
- "tBodyGyroJerkentropyY"
- "tBodyGyroJerkentropyZ"
- "tBodyGyroJerkarCoeffX.1"
- "tBodyGyroJerkarCoeffX.2"
- "tBodyGyroJerkarCoeffX.3"
- "tBodyGyroJerkarCoeffX.4"
- "tBodyGyroJerkarCoeffY.1"
- "tBodyGyroJerkarCoeffY.2"
- "tBodyGyroJerkarCoeffY.3"
- "tBodyGyroJerkarCoeffY.4"
- "tBodyGyroJerkarCoeffZ.1"
- "tBodyGyroJerkarCoeffZ.2"
- "tBodyGyroJerkarCoeffZ.3"
- "tBodyGyroJerkarCoeffZ.4"
- "tBodyGyroJerkcorrelationX.Y"
- "tBodyGyroJerkcorrelationX.Z"
- "tBodyGyroJerkcorrelationY.Z"
- "tBodyAccMagmean"
- "tBodyAccMagstd"
- "tBodyAccMagmad"
- "tBodyAccMagmax"
- "tBodyAccMagmin"
- "tBodyAccMagsma"
- "tBodyAccMagenergy"
- "tBodyAccMagiqr"
- "tBodyAccMagentropy"
- "tBodyAccMagarCoeff1"
- "tBodyAccMagarCoeff2"
- "tBodyAccMagarCoeff3"
- "tBodyAccMagarCoeff4"
- "tGravityAccMagmean"
- "tGravityAccMagstd"
- "tGravityAccMagmad"
- "tGravityAccMagmax"
- "tGravityAccMagmin"
- "tGravityAccMagsma"
- "tGravityAccMagenergy"
- "tGravityAccMagiqr"
- "tGravityAccMagentropy"
- "tGravityAccMagarCoeff1"
- "tGravityAccMagarCoeff2"
- "tGravityAccMagarCoeff3"
- "tGravityAccMagarCoeff4"
- "tBodyAccJerkMagmean"
- "tBodyAccJerkMagstd"
- "tBodyAccJerkMagmad"
- "tBodyAccJerkMagmax"
- "tBodyAccJerkMagmin"
- "tBodyAccJerkMagsma"
- "tBodyAccJerkMagenergy"
- "tBodyAccJerkMagiqr"
- "tBodyAccJerkMagentropy"
- "tBodyAccJerkMagarCoeff1"
- "tBodyAccJerkMagarCoeff2"
- "tBodyAccJerkMagarCoeff3"
- "tBodyAccJerkMagarCoeff4"
- "tBodyGyroMagmean"
- "tBodyGyroMagstd"
- "tBodyGyroMagmad"
- "tBodyGyroMagmax"
- "tBodyGyroMagmin"
- "tBodyGyroMagsma"
- "tBodyGyroMagenergy"
- "tBodyGyroMagiqr"- 
- "tBodyGyroMagentropy"
- "tBodyGyroMagarCoeff1"
- "tBodyGyroMagarCoeff2"
- "tBodyGyroMagarCoeff3"
- "tBodyGyroMagarCoeff4"
- "tBodyGyroJerkMagmean"
- "tBodyGyroJerkMagstd"
- "tBodyGyroJerkMagmad"
- "tBodyGyroJerkMagmax"
- "tBodyGyroJerkMagmin"
- "tBodyGyroJerkMagsma"
- "tBodyGyroJerkMagenergy"
- "tBodyGyroJerkMagiqr"
- "tBodyGyroJerkMagentropy"
- "tBodyGyroJerkMagarCoeff1"
- "tBodyGyroJerkMagarCoeff2"
- "tBodyGyroJerkMagarCoeff3"
- "tBodyGyroJerkMagarCoeff4"
- "fBodyAccmeanX"
- "fBodyAccmeanY"
- "fBodyAccmeanZ"
- "fBodyAccstdX"
- "fBodyAccstdY"
- "fBodyAccstdZ"
- "fBodyAccmadX"
- "fBodyAccmadY"
- "fBodyAccmadZ"
- "fBodyAccmaxX"
- "fBodyAccmaxY"
- "fBodyAccmaxZ"
- "fBodyAccminX"
- "fBodyAccminY"
- "fBodyAccminZ"
- "fBodyAccsma"
- "fBodyAccenergyX"
- "fBodyAccenergyY"
- "fBodyAccenergyZ"
- "fBodyAcciqrX"
- "fBodyAcciqrY"
- "fBodyAcciqrZ"
- "fBodyAccentropyX"
- "fBodyAccentropyY"
- "fBodyAccentropyZ"
- "fBodyAccmaxIndsX"
- "fBodyAccmaxIndsY"
- "fBodyAccmaxIndsZ"
- "fBodyAccmeanFreqX"
- "fBodyAccmeanFreqY"
- "fBodyAccmeanFreqZ"
- "fBodyAccskewnessX"
- "fBodyAcckurtosisX"
- "fBodyAccskewnessY"
- "fBodyAcckurtosisY"
- "fBodyAccskewnessZ"
- "fBodyAcckurtosisZ"
- "fBodyAccbandsEnergy1.8"
- "fBodyAccbandsEnergy9.16"
- "fBodyAccbandsEnergy17.24"
- "fBodyAccbandsEnergy25.32"
- "fBodyAccbandsEnergy33.40"
- "fBodyAccbandsEnergy41.48"
- "fBodyAccbandsEnergy49.56"
- "fBodyAccbandsEnergy57.64"
- "fBodyAccbandsEnergy1.16"
- "fBodyAccbandsEnergy17.32"
- "fBodyAccbandsEnergy33.48"
- "fBodyAccbandsEnergy49.64"
- "fBodyAccbandsEnergy1.24"
- "fBodyAccbandsEnergy25.48"
- "fBodyAccbandsEnergy1.8.1"
- "fBodyAccbandsEnergy9.16.1"
- "fBodyAccbandsEnergy17.24.1"
- "fBodyAccbandsEnergy25.32.1"
- "fBodyAccbandsEnergy33.40.1"
- "fBodyAccbandsEnergy41.48.1"
- "fBodyAccbandsEnergy49.56.1"
- "fBodyAccbandsEnergy57.64.1"
- "fBodyAccbandsEnergy1.16.1"
- "fBodyAccbandsEnergy17.32.1"
- "fBodyAccbandsEnergy33.48.1"
- "fBodyAccbandsEnergy49.64.1"
- "fBodyAccbandsEnergy1.24.1"
- "fBodyAccbandsEnergy25.48.1"
- "fBodyAccbandsEnergy1.8.2"
- "fBodyAccbandsEnergy9.16.2"
- "fBodyAccbandsEnergy17.24.2"
- "fBodyAccbandsEnergy25.32.2"
- "fBodyAccbandsEnergy33.40.2"
- "fBodyAccbandsEnergy41.48.2"
- "fBodyAccbandsEnergy49.56.2"
- "fBodyAccbandsEnergy57.64.2"
- "fBodyAccbandsEnergy1.16.2"
- "fBodyAccbandsEnergy17.32.2"
- "fBodyAccbandsEnergy33.48.2"
- "fBodyAccbandsEnergy49.64.2"
- "fBodyAccbandsEnergy1.24.2"
- "fBodyAccbandsEnergy25.48.2"
- "fBodyAccJerkmeanX"
- "fBodyAccJerkmeanY"- 
- "fBodyAccJerkmeanZ"
- "fBodyAccJerkstdX"
- "fBodyAccJerkstdY"
- "fBodyAccJerkstdZ"
- "fBodyAccJerkmadX"
- "fBodyAccJerkmadY"
- "fBodyAccJerkmadZ"
- "fBodyAccJerkmaxX"
- "fBodyAccJerkmaxY"
- "fBodyAccJerkmaxZ"
- "fBodyAccJerkminX"
- "fBodyAccJerkminY"
- "fBodyAccJerkminZ"
- "fBodyAccJerksma"
- "fBodyAccJerkenergyX"
- "fBodyAccJerkenergyY"
- "fBodyAccJerkenergyZ"
- "fBodyAccJerkiqrX"
- "fBodyAccJerkiqrY"
- "fBodyAccJerkiqrZ"
- "fBodyAccJerkentropyX"
- "fBodyAccJerkentropyY"
- "fBodyAccJerkentropyZ"
- "fBodyAccJerkmaxIndsX"
- "fBodyAccJerkmaxIndsY"
- "fBodyAccJerkmaxIndsZ"
- "fBodyAccJerkmeanFreqX"
- "fBodyAccJerkmeanFreqY"
- "fBodyAccJerkmeanFreqZ"
- "fBodyAccJerkskewnessX"
- "fBodyAccJerkkurtosisX"
- "fBodyAccJerkskewnessY"
- "fBodyAccJerkkurtosisY"
- "fBodyAccJerkskewnessZ"
- "fBodyAccJerkkurtosisZ"
- "fBodyAccJerkbandsEnergy1.8"
- "fBodyAccJerkbandsEnergy9.16"
- "fBodyAccJerkbandsEnergy17.24"
- "fBodyAccJerkbandsEnergy25.32"
- "fBodyAccJerkbandsEnergy33.40"
- "fBodyAccJerkbandsEnergy41.48"
- "fBodyAccJerkbandsEnergy49.56"
- "fBodyAccJerkbandsEnergy57.64"
- "fBodyAccJerkbandsEnergy1.16"
- "fBodyAccJerkbandsEnergy17.32"
- "fBodyAccJerkbandsEnergy33.48"
- "fBodyAccJerkbandsEnergy49.64"
- "fBodyAccJerkbandsEnergy1.24"
- "fBodyAccJerkbandsEnergy25.48"
- "fBodyAccJerkbandsEnergy1.8.1"
- "fBodyAccJerkbandsEnergy9.16.1"
- "fBodyAccJerkbandsEnergy17.24.1"
- "fBodyAccJerkbandsEnergy25.32.1"
- "fBodyAccJerkbandsEnergy33.40.1"
- "fBodyAccJerkbandsEnergy41.48.1"
- "fBodyAccJerkbandsEnergy49.56.1"
- "fBodyAccJerkbandsEnergy57.64.1"
- "fBodyAccJerkbandsEnergy1.16.1"
- "fBodyAccJerkbandsEnergy17.32.1"
- "fBodyAccJerkbandsEnergy33.48.1"
- "fBodyAccJerkbandsEnergy49.64.1"
- "fBodyAccJerkbandsEnergy1.24.1"
- "fBodyAccJerkbandsEnergy25.48.1"
- "fBodyAccJerkbandsEnergy1.8.2"
- "fBodyAccJerkbandsEnergy9.16.2"
- "fBodyAccJerkbandsEnergy17.24.2"
- "fBodyAccJerkbandsEnergy25.32.2"
- "fBodyAccJerkbandsEnergy33.40.2"
- "fBodyAccJerkbandsEnergy41.48.2"
- "fBodyAccJerkbandsEnergy49.56.2"
- "fBodyAccJerkbandsEnergy57.64.2"
- "fBodyAccJerkbandsEnergy1.16.2"
- "fBodyAccJerkbandsEnergy17.32.2"
- "fBodyAccJerkbandsEnergy33.48.2"
- "fBodyAccJerkbandsEnergy49.64.2"
- "fBodyAccJerkbandsEnergy1.24.2"
- "fBodyAccJerkbandsEnergy25.48.2"
- "fBodyGyromeanX"
- "fBodyGyromeanY"
- "fBodyGyromeanZ"
- "fBodyGyrostdX"
- "fBodyGyrostdY"
- "fBodyGyrostdZ"
- "fBodyGyromadX"
- "fBodyGyromadY"
- "fBodyGyromadZ"
- "fBodyGyromaxX"
- "fBodyGyromaxY"
- "fBodyGyromaxZ"
- "fBodyGyrominX"
- "fBodyGyrominY"
- "fBodyGyrominZ"
- "fBodyGyrosma"
- "fBodyGyroenergyX"
- "fBodyGyroenergyY"
- "fBodyGyroenergyZ"
- "fBodyGyroiqrX"
- "fBodyGyroiqrY"
- "fBodyGyroiqrZ"
- "fBodyGyroentropyX"
- "fBodyGyroentropyY"
- "fBodyGyroentropyZ"
- "fBodyGyromaxIndsX"
- "fBodyGyromaxIndsY"
- "fBodyGyromaxIndsZ"
- "fBodyGyromeanFreqX"
- "fBodyGyromeanFreqY"
- "fBodyGyromeanFreqZ"
- "fBodyGyroskewnessX"
- "fBodyGyrokurtosisX"
- "fBodyGyroskewnessY"
- "fBodyGyrokurtosisY"
- "fBodyGyroskewnessZ"
- "fBodyGyrokurtosisZ"
- "fBodyGyrobandsEnergy1.8"
- "fBodyGyrobandsEnergy9.16"
- "fBodyGyrobandsEnergy17.24"
- "fBodyGyrobandsEnergy25.32"
- "fBodyGyrobandsEnergy33.40"
- "fBodyGyrobandsEnergy41.48"
- "fBodyGyrobandsEnergy49.56"
- "fBodyGyrobandsEnergy57.64"
- "fBodyGyrobandsEnergy1.16"
- "fBodyGyrobandsEnergy17.32"
- "fBodyGyrobandsEnergy33.48"
- "fBodyGyrobandsEnergy49.64"
- "fBodyGyrobandsEnergy1.24"
- "fBodyGyrobandsEnergy25.48"
- "fBodyGyrobandsEnergy1.8.1"
- "fBodyGyrobandsEnergy9.16.1"
- "fBodyGyrobandsEnergy17.24.1"
- "fBodyGyrobandsEnergy25.32.1"
- "fBodyGyrobandsEnergy33.40.1"
- "fBodyGyrobandsEnergy41.48.1"
- "fBodyGyrobandsEnergy49.56.1"
- "fBodyGyrobandsEnergy57.64.1"
- "fBodyGyrobandsEnergy1.16.1"
- "fBodyGyrobandsEnergy17.32.1"
- "fBodyGyrobandsEnergy33.48.1"
- "fBodyGyrobandsEnergy49.64.1"
- "fBodyGyrobandsEnergy1.24.1"
- "fBodyGyrobandsEnergy25.48.1"
- "fBodyGyrobandsEnergy1.8.2"
- "fBodyGyrobandsEnergy9.16.2"
- "fBodyGyrobandsEnergy17.24.2"
- "fBodyGyrobandsEnergy25.32.2"
- "fBodyGyrobandsEnergy33.40.2"
- "fBodyGyrobandsEnergy41.48.2"
- "fBodyGyrobandsEnergy49.56.2"
- "fBodyGyrobandsEnergy57.64.2"
- "fBodyGyrobandsEnergy1.16.2"
- "fBodyGyrobandsEnergy17.32.2"
- "fBodyGyrobandsEnergy33.48.2"
- "fBodyGyrobandsEnergy49.64.2"
- "fBodyGyrobandsEnergy1.24.2"
- "fBodyGyrobandsEnergy25.48.2"
- "fBodyAccMagmean"
- "fBodyAccMagstd"
- "fBodyAccMagmad"
- "fBodyAccMagmax"
- "fBodyAccMagmin"
- "fBodyAccMagsma"
- "fBodyAccMagenergy"
- "fBodyAccMagiqr"
- "fBodyAccMagentropy"
- "fBodyAccMagmaxInds"
- "fBodyAccMagmeanFreq"
- "fBodyAccMagskewness"
- "fBodyAccMagkurtosis"
- "fBodyBodyAccJerkMagmean"
- "fBodyBodyAccJerkMagstd"
- "fBodyBodyAccJerkMagmad"
- "fBodyBodyAccJerkMagmax"
- "fBodyBodyAccJerkMagmin"
- "fBodyBodyAccJerkMagsma"
- "fBodyBodyAccJerkMagenergy"
- "fBodyBodyAccJerkMagiqr"
- "fBodyBodyAccJerkMagentropy"
- "fBodyBodyAccJerkMagmaxInds"
- "fBodyBodyAccJerkMagmeanFreq"
- "fBodyBodyAccJerkMagskewness"
- "fBodyBodyAccJerkMagkurtosis"
- "fBodyBodyGyroMagmean"
- "fBodyBodyGyroMagstd"
- "fBodyBodyGyroMagmad"
- "fBodyBodyGyroMagmax"
- "fBodyBodyGyroMagmin"
- "fBodyBodyGyroMagsma"
- "fBodyBodyGyroMagenergy"
- "fBodyBodyGyroMagiqr"
- "fBodyBodyGyroMagentropy"
- "fBodyBodyGyroMagmaxInds"
- "fBodyBodyGyroMagmeanFreq"
- "fBodyBodyGyroMagskewness"
- "fBodyBodyGyroMagkurtosis"
- "fBodyBodyGyroJerkMagmean"
- "fBodyBodyGyroJerkMagstd"
- "fBodyBodyGyroJerkMagmad"
- "fBodyBodyGyroJerkMagmax"
- "fBodyBodyGyroJerkMagmin"
- "fBodyBodyGyroJerkMagsma"
- "fBodyBodyGyroJerkMagenergy"
- "fBodyBodyGyroJerkMagiqr"
- "fBodyBodyGyroJerkMagentropy"
- "fBodyBodyGyroJerkMagmaxInds"
- "fBodyBodyGyroJerkMagmeanFreq"
- "fBodyBodyGyroJerkMagskewness"
- "fBodyBodyGyroJerkMagkurtosis"
- "angletBodyAccMean.gravity"
- "angletBodyAccJerkMean.gravityMean"
- "angletBodyGyroMean.gravityMean"
- "angletBodyGyroJerkMean.gravityMean"
- "angleX.gravityMean"
- "angleY.gravityMean"
- "angleZ.gravityMean"
##Measurement units
The acceleration signal from the smartphone accelerometers X, Y and Z axis are
measured in standard gravity units 'g'.
The angular velocity vector measured by the gyroscope for each window sample
is measured in 'radians/second'. 
