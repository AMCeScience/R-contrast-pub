configLoaded <- TRUE

# GENERIC
data_folder <- "data"
parallel_cores <- 1
parallel_silent <- FALSE

if (fit_parallel || rf_parallel) {
  suppressMessages(library(parallel))

  parallel_cores <- detectCores()
}