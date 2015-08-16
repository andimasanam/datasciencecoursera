+pollutantmean <- function(directory, pollutant, id = 1:332) {
+  ## 'directory' is a character vector of length 1 indicating
+  ## the location of the CSV files
+  
+  ## 'pollutant' is a character vector of length 1 indicating
+  ## the name of the pollutant for which we will calculate the
+  ## mean; either "sulfate" or "nitrate".
+  
+  ## 'id' is an integer vector indicating the monitor ID numbers
+  ## to be used
+  
+  ## Return the mean of the pollutant across all monitors list
+  ## in the 'id' vector (ignoring NA values)
+  
+  CSVFiles <- list.files(path = directory, full.names = TRUE)
+  CSVSelectedData <- data.frame()
+  for (i in id) {
+    CSVSelectedData <- rbind(CSVSelectedData, read.csv(CSVFiles[i]))
+  }
+  if (pollutant == 'sulfate') {
+    mean(CSVSelectedData$sulfate, na.rm = TRUE)
+  } else if (pollutant == 'nitrate') {
+    mean(CSVSelectedData$nitrate, na.rm = TRUE)
+  }
+  
+}
