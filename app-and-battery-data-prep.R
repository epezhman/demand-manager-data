setwd("~/exports")

dmLogs <- read.csv("battery.csv", header = FALSE)
meterHours <- read.csv("hours.csv", header = TRUE)
meterMin <- read.csv("minutes.csv", header = TRUE)
meterAttr <- read.csv("m2mgeneric.csv", header = TRUE)

names(dmLogs)[1] = "remaining_time_minutes"
names(dmLogs)[2] = "power_rate_w"
names(dmLogs)[3] = "remaining_capacity_percent"
names(dmLogs)[4] = "voltage_v"
names(dmLogs)[5] = "charging_bool"
names(dmLogs)[6] = "discharging_bool"
names(dmLogs)[7] = "ac_connected_bool"
names(dmLogs)[8] = "log_date"

#names(dmLogs)
#table(dmLogs$power_rate_w)
#class(dmLogs$power_rate_w)
#str(dmLogs)

#summary(dmLogs$power_rate_w)

write.csv(dmLogs, "battery_clean.csv")
write.csv(meterHours, "hours_clean.csv")
write.csv(meterMin, "minutes_clean.csv")
write.csv(meterAttr, "m2mgeneric_clean.csv")
