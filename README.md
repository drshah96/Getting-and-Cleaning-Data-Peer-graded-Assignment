# Getting-and-Cleaning-Data-Peer-graded-Assignment

## UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set 

### Purpose:
The goal is to prepare tidy data that can be used for later analysis:


### UCI HAR Dataset Description:

--------------------------------------------
Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### File Descriptions:
Getting and Cleaning Data Peer graded Assignment: This is .Rproj File. It contains the entire flow of project.

run_analysis: This is a RFile containing Code of Processing and Cleaning UCI HAR Dataset for later analysis. This file contains data cleaning in 5 steps: </br>
<ul> 
  <li> Step 1: Merging Dataset </li>
  <li> Step 2: Extracting Mean and Standard Deviation Functions from Features Deatils </li>
  <li> Step 3: Naming Activity Labels </li>
  <li> Step 4: Naming Column Name </li>
  <li> Step 5: Second Independent Tidy Dataset </li>
</ul>

Tidy_Data_Table: It is Text File containing the cleaned Dataset
