Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

merged.ubuntu <-
  read.csv("merged_my_ubuntu.csv", header = TRUE, strip.white = TRUE)

merged.ubuntu$time = as.character(merged.ubuntu$time)

merged.windows <-
  read.csv("dm_logs_my_windows.csv", header = TRUE, strip.white = TRUE)

merged.windows$time = as.character(merged.windows$time)
