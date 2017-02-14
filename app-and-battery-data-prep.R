Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

dmLogs <- read.csv("battery.csv", header = FALSE, strip.white = TRUE)
#meterHours <- read.csv("hours.csv", header = TRUE, strip.white = TRUE)
meterMin <- read.csv("minutes.csv", header = TRUE, strip.white = TRUE)
#meterAttr <- read.csv("m2mgeneric.csv", header = TRUE, strip.white = TRUE)

names(dmLogs)[1] = "remaining_time_minutes"
names(dmLogs)[2] = "power_rate_w"
names(dmLogs)[3] = "remaining_capacity_percent"
names(dmLogs)[4] = "voltage_v"
names(dmLogs)[5] = "charging_bool"
names(dmLogs)[6] = "discharging_bool"
names(dmLogs)[7] = "ac_connected_bool"
names(dmLogs)[8] = "log_date"

dmLogs$charging_bool = as.logical(dmLogs$charging_bool)
dmLogs$discharging_bool = as.logical(dmLogs$discharging_bool)
dmLogs$ac_connected_bool = as.logical(dmLogs$ac_connected_bool)
dmLogs$log_date = as.character(dmLogs$log_date)
dmLogs$log_date = strptime(dmLogs$log_date, format = '%a %b %d %Y %H:%M:%S GMT%z')
dmLogs$log_date = strftime(dmLogs$log_date, format = '%Y-%m-%d %H:%M')
dmLogs$remaining_time_minutes[is.na(dmLogs$remaining_time_minutes)] = 180

meterMin$sId = NULL
meterMin$ttl_time = NULL
meterMin$last_val_time = NULL
meterMin$type = NULL
meterMin$last_val = NULL
meterMin$time = as.POSIXct(meterMin$time / 1000, origin = "1970-01-01", tz = "Europe/Berlin")
meterMin$time = strftime(meterMin$time, format = '%Y-%m-%d %H:%M')
names(meterMin)[names(meterMin) == 'min'] = "min_measured_power_w"
names(meterMin)[names(meterMin) == 'max'] = "max_measured_power_w"
names(meterMin)[names(meterMin) == 'ave'] = "ave_measured_power_w"
names(meterMin)[names(meterMin) == 'time'] = "log_date"
meterMin = meterMin[meterMin$tag == "active_pwr", ]
meterMin$tag = NULL

merged = merge(x = dmLogs, y = meterMin, by = "log_date")

#names(dmLogs)
#table(dmLogs$power_rate_w)
#class(dmLogs$power_rate_w)
#str(dmLogs)
#is.something # is.numeric or nan
#as.something # as.numeric or logical 
#typeof(dmLogs)
#colSums(is.na(meterMin))

#summary(dmLogs$power_rate_w)

#write.csv(dmLogs, "battery_clean.csv")
# write.csv(meterHours, "hours_clean.csv")
# write.csv(meterMin, "minutes_clean.csv")
# write.csv(meterAttr, "m2mgeneric_clean.csv")
