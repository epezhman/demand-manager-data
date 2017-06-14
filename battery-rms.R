Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

dm.logs.normal <-
  read.csv("battery_normal_with_extra.csv",
           header = FALSE,
           strip.white = TRUE)

dm.logs.save <-
  read.csv("battery_save_with_extra.csv",
           header = FALSE,
           strip.white = TRUE)

# meter.logs <-
#   read.csv("rms_data_meter_per_file_counting.csv",
#            header = TRUE,
#            strip.white = TRUE)

meter.logs <-
  read.csv(
    "rms_data_meter_continus_counting.csv",
    header = TRUE,
    strip.white = TRUE
  )

names(dm.logs.normal)[1] = "remaining.time.minutes"
names(dm.logs.normal)[2] = "power.rate.w"
names(dm.logs.normal)[3] = "remaining.capacity.percent"
names(dm.logs.normal)[4] = "voltage"
names(dm.logs.normal)[5] = "charging"
names(dm.logs.normal)[6] = "discharging"
names(dm.logs.normal)[7] = "ac.connected"
names(dm.logs.normal)[8] = "brightness.percent"
names(dm.logs.normal)[9] = "memory.usage.percent"
names(dm.logs.normal)[10] = "memory.mb"
names(dm.logs.normal)[11] = "read.request.per.second"
names(dm.logs.normal)[12] = "read.kb.per.second"
names(dm.logs.normal)[13] = "write.request.per.second"
names(dm.logs.normal)[14] = "write.kb.per.second"
names(dm.logs.normal)[15] = "cpu.usage.percent"
names(dm.logs.normal)[16] = "cpu.cores"
names(dm.logs.normal)[17] = "download.kb"
names(dm.logs.normal)[18] = "upload.kb"
names(dm.logs.normal)[19] = "wifi.enabled"
names(dm.logs.normal)[20] = "log.date.time"


names(dm.logs.save)[1] = "remaining.time.minutes"
names(dm.logs.save)[2] = "power.rate.w"
names(dm.logs.save)[3] = "remaining.capacity.percent"
names(dm.logs.save)[4] = "voltage"
names(dm.logs.save)[5] = "charging"
names(dm.logs.save)[6] = "discharging"
names(dm.logs.save)[7] = "ac.connected"
names(dm.logs.save)[8] = "brightness.percent"
names(dm.logs.save)[9] = "memory.usage.percent"
names(dm.logs.save)[10] = "memory.mb"
names(dm.logs.save)[11] = "read.request.per.second"
names(dm.logs.save)[12] = "read.kb.per.second"
names(dm.logs.save)[13] = "write.request.per.second"
names(dm.logs.save)[14] = "write.kb.per.second"
names(dm.logs.save)[15] = "cpu.usage.percent"
names(dm.logs.save)[16] = "cpu.cores"
names(dm.logs.save)[17] = "download.kb"
names(dm.logs.save)[18] = "upload.kb"
names(dm.logs.save)[19] = "wifi.enabled"
names(dm.logs.save)[20] = "log.date.time"


dm.logs.normal$charging = as.logical(dm.logs.normal$charging)
dm.logs.normal$discharging = as.logical(dm.logs.normal$discharging)
dm.logs.normal$ac.connected = as.logical(dm.logs.normal$ac.connected)
dm.logs.normal$wifi.enabled = as.logical(dm.logs.normal$wifi.enabled)
dm.logs.normal$log.date.time = as.character(dm.logs.normal$log.date.time)

dm.logs.normal$log.date.time = strptime(dm.logs.normal$log.date.time, format = '%a %b %d %Y %H:%M:%S GMT%z')
dm.logs.normal$log.date.time = strftime(dm.logs.normal$log.date.time, format = '%Y-%m-%d %H:%M:%S')

dm.logs.normal$remaining.time.minutes[is.nan(dm.logs.normal$remaining.time.minutes)] = 180
dm.logs.normal$download.kb[is.nan(dm.logs.normal$download.kb)] = 0
dm.logs.normal$upload.kb[is.nan(dm.logs.normal$upload.kb)] = 0
dm.logs.normal$power.rate.w[is.nan(dm.logs.normal$power.rate.w)] = 0
dm.logs.normal$voltage[is.nan(dm.logs.normal$voltage)] = mean(dm.logs.normal$voltage, na.rm =
                                                                TRUE)

dm.logs.save$charging = as.logical(dm.logs.save$charging)
dm.logs.save$discharging = as.logical(dm.logs.save$discharging)
dm.logs.save$ac.connected = as.logical(dm.logs.save$ac.connected)
dm.logs.save$wifi.enabled = as.logical(dm.logs.save$wifi.enabled)
dm.logs.save$log.date.time = as.character(dm.logs.save$log.date.time)

dm.logs.save$log.date.time = strptime(dm.logs.save$log.date.time, format = '%a %b %d %Y %H:%M:%S GMT%z')
dm.logs.save$log.date.time = strftime(dm.logs.save$log.date.time, format = '%Y-%m-%d %H:%M:%S')

dm.logs.save$remaining.time.minutes[is.nan(dm.logs.save$remaining.time.minutes)] = 180
dm.logs.save$download.kb[is.nan(dm.logs.save$download.kb)] = 0
dm.logs.save$upload.kb[is.nan(dm.logs.save$upload.kb)] = 0
dm.logs.save$power.rate.w[is.nan(dm.logs.save$power.rate.w)] = 0
dm.logs.save$voltage[is.nan(dm.logs.save$voltage)] = mean(dm.logs.save$voltage, na.rm =
                                                            TRUE)

names(meter.logs)[names(meter.logs) == 'datetime'] = "log.date.time"
names(meter.logs)[names(meter.logs) == 'power_watts'] = "measured.power.w"
meter.logs$log.date.time = as.character(meter.logs$log.date.time)
meter.logs$measured.power.w = meter.logs$measured.power.w * .5 # mean power factor

merged.normal = merge(x = dm.logs.normal, y = meter.logs, by = "log.date.time")
merged.normal = merged.normal[merged.normal$power.rate.w != 0, ]
merged.normal = merged.normal[merged.normal$measured.power.w != 0, ]
merged.normal = merged.normal[merged.normal$ac.connected, ]

merged.save = merge(x = dm.logs.save, y = meter.logs, by = "log.date.time")
merged.save = merged.save[merged.save$power.rate.w != 0, ]
merged.save = merged.save[merged.save$measured.power.w != 0, ]
merged.save = merged.save[merged.save$ac.connected, ]


plot(
  x = merged.save$power.rate.w,
  y = merged.save$measured.power.w,
  main = "App vs Power Meter Measured Power",
  xlab = "App Measured Power (watts)",
  ylab = "Meter Measured Power (watts)",
  pch="*",
  col="blue"
)

power.model = lm(
  formula = measured.power.w ~ power.rate.w ,
  data = merged.save
)

lines(
  x = merged.save$power.rate.w,
  y = power.model$fitted.values,
  col = "red",
  lwd = 5
)

#plot(merged.normal$measured.power.w)

summary(merged.normal$measured.power.w)
summary(merged.save$measured.power.w)

percentage.to.normal = mean(merged.save$measured.power.w) / mean(merged.normal$measured.power.w)

mean.normal = mean(merged.normal$measured.power.w)
mean.save = mean(merged.save$measured.power.w)

# barplot(
#   c(mean.normal, mean.save),
#   width = 0.5,
#   col = c('lightblue'),
#   names.arg = c('Normal Power Mode', 'Power Save Mode'),
#   xlab = "Average Power Consumption in Different Power Mode in Ubuntu",
#   ylab = "Real Power Consumption (watts)",
#   ylim = c(0, 50)
# )
