# Function takes as input the data directory and a threshold denoting the number of 
# complete cases for a sensor to have in order for it to be analyzes.  It outputs 
# the correlation between nitrate and sulfate particulate matter

corr <- function(directory, threshold = 0) {
    
    # Block to construct total data frame
    files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for(i in 1:332) {
        dat <- rbind(dat, read.csv(files[i]))  #Full data frame
    }
    
    # Block to find the sensors that meet the threshold requirement
    dat_complete <- complete(directory,1:332)
    dat_thresh <- dat_complete[which(dat_complete[,"nobs"] > threshold),]
    sensor_ids <- dat_thresh$id  # Vector with the sensor numbers identified
    #print(sensor_ids)
    
    dat_only <- dat[complete.cases(dat),]
    dim(dat_only)
    corrs <- numeric()
    for(j in seq_along(sensor_ids)) {
        #nitrate[j] <- dat_only[which(dat_only[,"ID"] == sensor_ids[j]), "nitrate"]
        corrs[j] <- cor(subset(dat_only$sulfate, dat_only$ID == sensor_ids[j]), subset(dat_only$nitrate, dat_only$ID == sensor_ids[j]))
        #corrs[j] <- cor(dat_only[which(dat_only[,"ID"] == sensor_ids[j]), "sulfate"], dat_only[which(dat_only[,"ID"] == sensor_ids[j]), "nitrate"])
    }
    #nitrate
    corrs
}
