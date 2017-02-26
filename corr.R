corr <- function(directory, threshold = 0) {
    files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for(i in 1:332) {
        dat <- rbind(dat, read.csv(files[i]))
    }
    dat_complete <- complete(directory,1:332)
    dat_thresh <- dat_complete[which(dat_complete[,"nobs"] > threshold),]
    sensor_ids <- dat_thresh$id
    print(sensor_ids)
    
    dat_only_complete <- complete.cases(dat)
}