run_analysis <- function()
{
  library(dplyr)
  #Getting basic data for merging and naming
  activity <- read.table("./activity_labels.txt")
  features <- read.table("./features.txt")
  
  #Merge training and test data
  test_X <- read.table("./test/X_test.txt")
  train_X <- read.table("./train/X_train.txt")
  result_X <- rbind(test_X,train_X)
  
  
  test_y <- read.table("./test/y_test.txt")
  train_y <- read.table("./train/y_train.txt")
  result_y <- rbind(test_y,train_y)
  
  test_subject <- read.table("./test/subject_test.txt")
  train_subject <- read.table("./train/subject_train.txt")
  result_subject <- rbind(test_subject,train_subject)
  
  #Proper naming for the variables
  names(result_X) <- features[,2]
  result_X <- result_X[,grepl("std|mean", colnames(result_X))]
  result_y <- merge(activity,result_y,by.x = 'V1', by.y = 'V1')[2]
  
  result <- cbind(result_subject,result_y,result_X)
  names(result)[c(1,2)] <- c("volunteer_id","activity")
  
  group_by(result, volunteer_id, activity) %>%
    summarise_each(funs(mean))
  
  write.table(result,"tidy.txt", row.names = F)
}