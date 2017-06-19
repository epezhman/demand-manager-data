Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

dm.logs.my.windows <-
  read.csv("dm_logs_my_windows.csv", header = TRUE, strip.white = TRUE)

dm.logs.my.windows$ac_connected_bool = as.logical(dm.logs.my.windows$ac_connected_bool)
dm.logs.my.windows$charging_bool = as.logical(dm.logs.my.windows$charging_bool)
dm.logs.my.windows$discharging_bool = as.logical(dm.logs.my.windows$discharging_bool)
dm.logs.my.windows$dm_enabled = as.logical(dm.logs.my.windows$dm_enabled)
dm.logs.my.windows$wifi = as.logical(dm.logs.my.windows$wifi)
dm.logs.my.windows$internet_connected = as.logical(dm.logs.my.windows$internet_connected)

dm.logs.my.windows$time = as.POSIXct(dm.logs.my.windows$time / 1000, origin = "1970-01-01", tz = "Europe/Berlin")
dm.logs.my.windows$time = strftime(dm.logs.my.windows$time, format = '%Y-%m-%d %H:%M:%S')

dm.logs.my.windows.nofare <-
  read.csv("dm_logs_nofare_my_ubuntu.csv", header = TRUE, strip.white = TRUE)

dm.logs.my.windows.nofare$time = as.character(dm.logs.my.windows.nofare$time)
dm.logs.my.windows.nofare$time = strftime(dm.logs.my.windows.nofare$time, format = '%Y-%m-%d %H:%M:%S')

merged.my.windows = merge(x = dm.logs.my.windows, y = dm.logs.my.windows.nofare, by = "time")

write.csv(merged.my.windows, "merged_my_windows.csv", row.names=FALSE)
