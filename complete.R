complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  dat <- data.frame()
  for(i in 1:332) {
    dat <- rbind(dat, read.csv(files[i]))
  }
  dat_complete <- data.frame()
  for(j in seq_along(id)) {
    subset <- dat[which(dat[,"ID"] == id[j]),]
    num_complete <- length(which(complete.cases(subset)))
    dat_complete <- rbind(dat_complete, c(id[j],num_complete))
  }
  names(dat_complete) <- c("id", "nobs")
  dat_complete
}