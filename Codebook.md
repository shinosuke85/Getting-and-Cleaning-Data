---
title: "Project for Getting and Cleaning data course"
author: "GM"
date: "26/07/2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of the project is to demonstrate ability to collect, work with, and clean a data set.

##Study design and data processing

###Collection of the raw data
The data was obtained from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
It was then unzipped and saved in a folder.

###Notes on the original (raw) data 
The data represent data collected from the accelerometers from the Samsung Galaxy S smarthpone.

##Creating the tidy datafile

###Guide to create the tidy data file
The script "run_analysis.R" carries out the full process from downloading the data to producing the final tidy dataset.
To download and run the script run the following code in R, ensuring that the script is in your current working directory: 
```{r}
        source("run_analysis.r")
        run_analysis.r()
```

###Cleaning of the data
The cleaning script is called "run_analysis.R" and is saved in the main data folder described above.

The script does the following:
1. There are 8 different files that need to be read and transformed into data tables
2. From these, 6 are merged into a single data set. Namely, 
        + the 2 files corresponding to the training and test measurements; 
        + the 2 files corresponding to the training and test activities, and
        + the 2 files corresponding to the subjects who performed each activity for the training and test sets.
3. The "features.txt" file is used to name the columns of the merged dataset.
4. Once merged, only the columns which correspond to the measurements on the mean and standard deviation are extracted.
5. The activities performed by each subject are represented by numbers in the data set. The file "activity_labels.txt" is used to substitute the numbers for their corresponding descriptive labels (e.g. 1 substituted for WALKING)
6. Descriptive names are given to each of the labels in the data set
7. A new data set is created which contains the average of each variable in the clean dataset for each activity and each subject.

A detailed description of the script run_analysis.R can be found here:
 [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tidy_data.txt file


General description of the file including:
 * Dimensions of the dataset: 180 rows x 68 columns
 * Summary of the data: 
   subjectid                  activity  tbodyaccmeanx    tbodyaccmeany       tbodyaccmeanz      tgravityaccmeanx  tgravityaccmeany   tgravityaccmeanz  
 Min.   : 1.0   WALKING           :30   Min.   :0.2216   Min.   :-0.040514   Min.   :-0.15251   Min.   :-0.6800   Min.   :-0.47989   Min.   :-0.49509  
 1st Qu.: 8.0   WALKING_UPSTAIRS  :30   1st Qu.:0.2712   1st Qu.:-0.020022   1st Qu.:-0.11207   1st Qu.: 0.8376   1st Qu.:-0.23319   1st Qu.:-0.11726  
 Median :15.5   WALKING_DOWNSTAIRS:30   Median :0.2770   Median :-0.017262   Median :-0.10819   Median : 0.9208   Median :-0.12782   Median : 0.02384  
 Mean   :15.5   SITTING           :30   Mean   :0.2743   Mean   :-0.017876   Mean   :-0.10916   Mean   : 0.6975   Mean   :-0.01621   Mean   : 0.07413  
 3rd Qu.:23.0   STANDING          :30   3rd Qu.:0.2800   3rd Qu.:-0.014936   3rd Qu.:-0.10443   3rd Qu.: 0.9425   3rd Qu.: 0.08773   3rd Qu.: 0.14946  
 Max.   :30.0   LAYING            :30   Max.   :0.3015   Max.   :-0.001308   Max.   :-0.07538   Max.   : 0.9745   Max.   : 0.95659   Max.   : 0.95787  
 tbodyaccjerkmeanx tbodyaccjerkmeany    tbodyaccjerkmeanz   tbodygyromeanx     tbodygyromeany     tbodygyromeanz     tbodygyrojerkmeanx tbodygyrojerkmeany
 Min.   :0.04269   Min.   :-0.0386872   Min.   :-0.067458   Min.   :-0.20578   Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.15721   Min.   :-0.07681  
 1st Qu.:0.07396   1st Qu.: 0.0004664   1st Qu.:-0.010601   1st Qu.:-0.04712   1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.10322   1st Qu.:-0.04552  
 Median :0.07640   Median : 0.0094698   Median :-0.003861   Median :-0.02871   Median :-0.07318   Median : 0.08512   Median :-0.09868   Median :-0.04112  
 Mean   :0.07947   Mean   : 0.0075652   Mean   :-0.004953   Mean   :-0.03244   Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.09606   Mean   :-0.04269  
 3rd Qu.:0.08330   3rd Qu.: 0.0134008   3rd Qu.: 0.001958   3rd Qu.:-0.01676   3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.09110   3rd Qu.:-0.03842  
 Max.   :0.13019   Max.   : 0.0568186   Max.   : 0.038053   Max.   : 0.19270   Max.   : 0.02747   Max.   : 0.17910   Max.   :-0.02209   Max.   :-0.01320  
 tbodygyrojerkmeanz  tbodyaccmagmean   tgravityaccmagmean tbodyaccjerkmagmean tbodygyromagmean  tbodygyrojerkmagmean fbodyaccmeanx     fbodyaccmeany     
 Min.   :-0.092500   Min.   :-0.9865   Min.   :-0.9865    Min.   :-0.9928     Min.   :-0.9807   Min.   :-0.99732     Min.   :-0.9952   Min.   :-0.98903  
 1st Qu.:-0.061725   1st Qu.:-0.9573   1st Qu.:-0.9573    1st Qu.:-0.9807     1st Qu.:-0.9461   1st Qu.:-0.98515     1st Qu.:-0.9787   1st Qu.:-0.95361  
 Median :-0.053430   Median :-0.4829   Median :-0.4829    Median :-0.8168     Median :-0.6551   Median :-0.86479     Median :-0.7691   Median :-0.59498  
 Mean   :-0.054802   Mean   :-0.4973   Mean   :-0.4973    Mean   :-0.6079     Mean   :-0.5652   Mean   :-0.73637     Mean   :-0.5758   Mean   :-0.48873  
 3rd Qu.:-0.048985   3rd Qu.:-0.0919   3rd Qu.:-0.0919    3rd Qu.:-0.2456     3rd Qu.:-0.2159   3rd Qu.:-0.51186     3rd Qu.:-0.2174   3rd Qu.:-0.06341  
 Max.   :-0.006941   Max.   : 0.6446   Max.   : 0.6446    Max.   : 0.4345     Max.   : 0.4180   Max.   : 0.08758     Max.   : 0.5370   Max.   : 0.52419  
 fbodyaccmeanz     fbodyaccjerkmeanx fbodyaccjerkmeany fbodyaccjerkmeanz fbodygyromeanx    fbodygyromeany    fbodygyromeanz    fbodyaccmagmean  
 Min.   :-0.9895   Min.   :-0.9946   Min.   :-0.9894   Min.   :-0.9920   Min.   :-0.9931   Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9868  
 1st Qu.:-0.9619   1st Qu.:-0.9828   1st Qu.:-0.9725   1st Qu.:-0.9796   1st Qu.:-0.9697   1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9560  
 Median :-0.7236   Median :-0.8126   Median :-0.7817   Median :-0.8707   Median :-0.7300   Median :-0.8141   Median :-0.7909   Median :-0.6703  
 Mean   :-0.6297   Mean   :-0.6139   Mean   :-0.5882   Mean   :-0.7144   Mean   :-0.6367   Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.5365  
 3rd Qu.:-0.3183   3rd Qu.:-0.2820   3rd Qu.:-0.1963   3rd Qu.:-0.4697   3rd Qu.:-0.3387   3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.1622  
 Max.   : 0.2807   Max.   : 0.4743   Max.   : 0.2767   Max.   : 0.1578   Max.   : 0.4750   Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.5866  
 fbodyaccjerkmagmean fbodygyromagmean  fbodygyrojerkmagmean  tbodyaccstdx      tbodyaccstdy       tbodyaccstdz     tgravityaccstdx   tgravityaccstdy  
 Min.   :-0.9940     Min.   :-0.9865   Min.   :-0.9976      Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.9968   Min.   :-0.9942  
 1st Qu.:-0.9770     1st Qu.:-0.9616   1st Qu.:-0.9813      1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.:-0.9825   1st Qu.:-0.9711  
 Median :-0.7940     Median :-0.7657   Median :-0.8779      Median :-0.7526   Median :-0.50897   Median :-0.6518   Median :-0.9695   Median :-0.9590  
 Mean   :-0.5756     Mean   :-0.6671   Mean   :-0.7564      Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756   Mean   :-0.9638   Mean   :-0.9524  
 3rd Qu.:-0.1872     3rd Qu.:-0.4087   3rd Qu.:-0.5831      3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.:-0.9509   3rd Qu.:-0.9370  
 Max.   : 0.5384     Max.   : 0.2040   Max.   : 0.1466      Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090   Max.   :-0.8296   Max.   :-0.6436  
 tgravityaccstdz   tbodyaccjerkstdx  tbodyaccjerkstdy  tbodyaccjerkstdz   tbodygyrostdx     tbodygyrostdy     tbodygyrostdz     tbodygyrojerkstdx
 Min.   :-0.9910   Min.   :-0.9946   Min.   :-0.9895   Min.   :-0.99329   Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855   Min.   :-0.9965  
 1st Qu.:-0.9605   1st Qu.:-0.9832   1st Qu.:-0.9724   1st Qu.:-0.98266   1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609   1st Qu.:-0.9800  
 Median :-0.9450   Median :-0.8104   Median :-0.7756   Median :-0.88366   Median :-0.7890   Median :-0.8017   Median :-0.8010   Median :-0.8396  
 Mean   :-0.9364   Mean   :-0.5949   Mean   :-0.5654   Mean   :-0.73596   Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164   Mean   :-0.7036  
 3rd Qu.:-0.9180   3rd Qu.:-0.2233   3rd Qu.:-0.1483   3rd Qu.:-0.51212   3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106   3rd Qu.:-0.4629  
 Max.   :-0.6102   Max.   : 0.5443   Max.   : 0.3553   Max.   : 0.03102   Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649   Max.   : 0.1791  
 tbodygyrojerkstdy tbodygyrojerkstdz tbodyaccmagstd    tgravityaccmagstd tbodyaccjerkmagstd tbodygyromagstd   tbodygyrojerkmagstd  fbodyaccstdx    
 Min.   :-0.9971   Min.   :-0.9954   Min.   :-0.9865   Min.   :-0.9865   Min.   :-0.9946    Min.   :-0.9814   Min.   :-0.9977     Min.   :-0.9966  
 1st Qu.:-0.9832   1st Qu.:-0.9848   1st Qu.:-0.9430   1st Qu.:-0.9430   1st Qu.:-0.9765    1st Qu.:-0.9476   1st Qu.:-0.9805     1st Qu.:-0.9820  
 Median :-0.8942   Median :-0.8610   Median :-0.6074   Median :-0.6074   Median :-0.8014    Median :-0.7420   Median :-0.8809     Median :-0.7470  
 Mean   :-0.7636   Mean   :-0.7096   Mean   :-0.5439   Mean   :-0.5439   Mean   :-0.5842    Mean   :-0.6304   Mean   :-0.7550     Mean   :-0.5522  
 3rd Qu.:-0.5861   3rd Qu.:-0.4741   3rd Qu.:-0.2090   3rd Qu.:-0.2090   3rd Qu.:-0.2173    3rd Qu.:-0.3602   3rd Qu.:-0.5767     3rd Qu.:-0.1966  
 Max.   : 0.2959   Max.   : 0.1932   Max.   : 0.4284   Max.   : 0.4284   Max.   : 0.4506    Max.   : 0.3000   Max.   : 0.2502     Max.   : 0.6585  
  fbodyaccstdy       fbodyaccstdz     fbodyaccjerkstdx  fbodyaccjerkstdy  fbodyaccjerkstdz    fbodygyrostdx     fbodygyrostdy     fbodygyrostdz    
 Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9951   Min.   :-0.9905   Min.   :-0.993108   Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867  
 1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9847   1st Qu.:-0.9737   1st Qu.:-0.983747   1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643  
 Median :-0.51338   Median :-0.6441   Median :-0.8254   Median :-0.7852   Median :-0.895121   Median :-0.8086   Median :-0.7964   Median :-0.8224  
 Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6121   Mean   :-0.5707   Mean   :-0.756489   Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577  
 3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2475   3rd Qu.:-0.1685   3rd Qu.:-0.543787   3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916  
 Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4768   Max.   : 0.3498   Max.   :-0.006236   Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225  
 fbodyaccmagstd    fbodyaccjerkmagstd fbodygyromagstd   fbodygyrojerkmagstd
 Min.   :-0.9876   Min.   :-0.9944    Min.   :-0.9815   Min.   :-0.9976    
 1st Qu.:-0.9452   1st Qu.:-0.9752    1st Qu.:-0.9488   1st Qu.:-0.9802    
 Median :-0.6513   Median :-0.8126    Median :-0.7727   Median :-0.8941    
 Mean   :-0.6210   Mean   :-0.5992    Mean   :-0.6723   Mean   :-0.7715    
 3rd Qu.:-0.3654   3rd Qu.:-0.2668    3rd Qu.:-0.4277   3rd Qu.:-0.6081    
 Max.   : 0.1787   Max.   : 0.3163    Max.   : 0.2367   Max.   : 0.2878 
 
 - Variables present in the dataset: 68 variables (described below)


### Var1: subjectid
Each row identifies the subject who performed the activity for each window sample.
 + Class: integer
 + Unique values/levels of the variable: values 1 to 30.
 + Unit of measurement: none

### Var2: activity
Each row identifies which activity was performed when the measurements were taken
 + Class: factor
 + Unique values/levels of the variable: 6 levels - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 + Unit of measurement: none

## Vars3 to 68: measurements
Each row shows the measurement values obtained using a smartphone. 
 + Class: double
 + Unique values/levels of the variable: all measurements are normalised and bounded within [-1,1].
 + Unit of measurement: none

Each measurement is described by the following:
1. Type of signal:
        + t := time domain signal
        + f := frequency domain signal
2. Acceleration type:
        + BodyAcc := Body acceleration signal
        + GravityAcc := Gravity acceleration signal
        + BodyGyro := Angular velocity
3. Jerk := Jerk signal derived from measures above
4. Mag := used when measurement indicates the magnitude of the signal, calculated using the Euclidean norm.
5. 3-axial signals: estimates of the feature vector for each pattern are calculated. X, Y and Z are used to indicate the direction of the measurement
6. Estimates:
        + mean:= mean value
        + standarddeviation := Standard deviation


##Sources
Data description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
