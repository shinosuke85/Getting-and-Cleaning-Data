run_analysis <- function() {
        # POINT 1: MERGE SETS AND CREATE ONE DATA SET
        # Read data (assuming script is in the main data directory, leaving the data folder as given)
        train <- read.table("train/X_train.txt")
        test <- read.table("test/X_test.txt")
        
        # Read labels
        features <- read.table("features.txt")
        activity <- read.table("activity_labels.txt")
        activity_train <- read.table("train/y_train.txt")
        activity_test <- read.table("test/y_test.txt")
        subject_train <- read.table("train/subject_train.txt")
        subject_test <- read.table("test/subject_test.txt")
        
        # Check dimensions:
        dim(train) # 7352 rows x 561 cols
        dim(activity_train) # 7352 rows
        dim(subject_train) # 7352 rows
        dim(test) # 2947 rows x 561 cols
        dim(activity_test) # 2947 rows
        dim(subject_test) # 2947 rows
        dim(features) # 561 rows x 2 cols
        
        # Give names to columns
        names(train) <- features[ ,2]
        names(test) <- features[ ,2]
        
        # Add activity and subject column to train and test data
        train2 <- bind_cols(subject_train,activity_train,train)
        test2 <- bind_cols(subject_test, activity_test, test)
        dim(train2) # 7352 rows x 563 cols (as expected)
        dim(test2) # 2947 rows x 563 cols (as expected)
        names(train2)[1:2] <- c("subjectid", "activity")
        names(test2)[1:2] <- c("subjectid", "activity")
        
        # Merge two data sets (assuming variables in the same order since data was partitioned from the total dataset, hence is in identical format)
        data <- rbind(train2, test2)
        dim(data) # 10299 rows x 563 cols
        data_tdf <- tbl_dt(data) # to be able to use the functions in the dplyr package
        dim(data_tdf) # 10299 rows x 563 cols
        
        
        # POINT 2: EXTRACT MEASUREMENTS ON MEAN AND S.D. FOR EACH MEASUREMENT
        data_clean <- select(data_tdf, subjectid, activity, contains("mean()"), contains("std()"))
        dim(data_clean) # 10299 rows x 68 cols
        
        
        # POINT 3: USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
        # Use activity df to match numbers and activity descriptions
        data_clean$activity <- as.factor(data_clean$activity)
        levels(data_clean$activity) <- activity[,2] #as factor is numeric will be in the right order by default
        
        
        # POINT 4: GIVE DESCRIPTIVE VARIABLE NAMES TO LABELS IN THE DATA SET
        # Work with the variable names only
        features_clean <- names(data_clean)
        features_clean <- gsub("\\(\\)", "",features_clean) #removed "()" after "mean" and "std"
        features_clean <- gsub("BodyBody", "body",features_clean) #removed duplicated BodyBody in some variables 
        features_clean <- tolower(features_clean) #made all lowercase 
        
        # Rename the data column variables
        setNames(data_clean, features_clean)
        
        
        #POINT 5: TIDY DATA SET WITH AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
        data_tidy <- data_clean %>% group_by(activity, subjectid) %>% summarise_each(funs(mean))
        write.table(data_tidy, file = "tidy_data.txt", row.name=FALSE)
}
