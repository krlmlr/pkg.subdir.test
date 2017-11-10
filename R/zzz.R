dummy <- function() {}

first_level_files <- dir("R", full.names = TRUE)
dirs <- first_level_files[file.info(first_level_files)$isdir]
source_files <- dir(first_level_files, recursive = TRUE, full.names = TRUE)

for (file in source_files) sys.source(file, environment(dummy))
