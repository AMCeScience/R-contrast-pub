getProjectFolder <- function(project_name) {
  return(paste(data_folder, project_name, sep = "/"))
}

getLastVersion <- function(file_pattern, folder) {
  if (!dir.exists(folder) || length(list.files(path = folder, pattern = file_pattern)) < 1) {
    return(1)
  }

  files <- list.files(path = folder, pattern = file_pattern)

  if (length(files) < 1) {
    return(1)
  }

  highest_version <- 0

  for (file in files) {
    filename <- unlist(strsplit(file, ".(?=[^.]+$)", perl = TRUE))[1]
    filename_split <- unlist(strsplit(filename, "_", fixed = TRUE))

    version <- as.numeric(filename_split[length(filename_split)])

    if (version > highest_version) {
      highest_version <- version
    }
  }

  return(highest_version)
}