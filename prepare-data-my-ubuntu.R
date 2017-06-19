Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

dm.logs.my.ubuntu <-
  read.csv("dm_logs_my_ubuntu.csv", header = TRUE, strip.white = TRUE)

dm.logs.my.ubuntu$ac_connected_bool = as.logical(dm.logs.my.ubuntu$ac_connected_bool)
dm.logs.my.ubuntu$charging_bool = as.logical(dm.logs.my.ubuntu$charging_bool)
dm.logs.my.ubuntu$discharging_bool = as.logical(dm.logs.my.ubuntu$discharging_bool)
dm.logs.my.ubuntu$dm_enabled = as.logical(dm.logs.my.ubuntu$dm_enabled)
dm.logs.my.ubuntu$wifi = as.logical(dm.logs.my.ubuntu$wifi)
dm.logs.my.ubuntu$internet_connected = as.logical(dm.logs.my.ubuntu$internet_connected)

dm.logs.my.ubuntu$time = as.POSIXct(dm.logs.my.ubuntu$time / 1000, origin = "1970-01-01", tz = "Europe/Berlin")
dm.logs.my.ubuntu$time = strftime(dm.logs.my.ubuntu$time, format = '%Y-%m-%d %H:%M:%S')

dm.logs.my.ubuntu.nofare <-
  read.csv("dm_logs_nofare_my_ubuntu.csv", header = TRUE, strip.white = TRUE)

dm.logs.my.ubuntu.nofare$time = as.character(dm.logs.my.ubuntu.nofare$time)
dm.logs.my.ubuntu.nofare$time = strftime(dm.logs.my.ubuntu.nofare$time, format = '%Y-%m-%d %H:%M:%S')

merged.my.ubuntu = merge(x = dm.logs.my.ubuntu, y = dm.logs.my.ubuntu.nofare, by = "time")

write.csv(merged.my.ubuntu, "merged_my_ubuntu.csv", row.names=FALSE)
