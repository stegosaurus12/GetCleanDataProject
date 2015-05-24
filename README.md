# GetCleanDataProject

This repo contains 2 important files:

	*run_analysis.R
	*tidydata_course_project.txt
	
run_analysis.R is a R script that takes in data from a dataset measuring human activity recognition using smartphones (downloadable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

It goes through the following steps:
	
	*merges training and test data sets
	*matches a subject and activity to each recorded data point
	*extracts only data for mean and standard deviation for measurements
	*labels the activity & measured variables appropriately
	*outputs a tidy data set (tidydata_course_project.txt)
	
tidydata_course_project.txt is the tidy data set output by the run_analysis.R script.