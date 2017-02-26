pollutantmean <- function(directory, pollutant, id = 1:332) {
    files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for(i in 1:332) {
      dat <- rbind(dat, read.csv(files[i]))
    }
    dat_subset <- data.frame()
    for(j in seq_along(id)) {
        subset <- dat[which(dat[,"ID"] == id[j]),]
        dat_subset <- rbind(dat_subset, subset)
    }
    #dat_subset <- dat[which(dat[,"ID"] == id),]
    mean(dat_subset[,pollutant], na.rm = TRUE)
}

