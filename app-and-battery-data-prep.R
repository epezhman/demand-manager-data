Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

dm.logs <-
  read.csv("battery.csv", header = FALSE, strip.white = TRUE)
#meter.hours <- read.csv("hours.csv", header = TRUE, strip.white = TRUE)
meter.min <-
  read.csv("minutes.csv", header = TRUE, strip.white = TRUE)
#meter.attr <- read.csv("m2mgeneric.csv", header = TRUE, strip.white = TRUE)

names(dm.logs)[1] = "remaining.time.minutes"
names(dm.logs)[2] = "power.rate.w"
names(dm.logs)[3] = "remaining.capacity.percent"
names(dm.logs)[4] = "voltage"
names(dm.logs)[5] = "charging"
names(dm.logs)[6] = "discharging"
names(dm.logs)[7] = "ac.connected"
names(dm.logs)[8] = "log.date.time"

dm.logs$charging = as.logical(dm.logs$charging)
dm.logs$discharging = as.logical(dm.logs$discharging)
dm.logs$ac.connected = as.logical(dm.logs$ac.connected)
dm.logs$log.date.time = as.character(dm.logs$log.date.time)

dm.logs$log.date.time = strptime(dm.logs$log.date.time, format = '%a %b %d %Y %H:%M:%S GMT%z')
dm.logs$log.date.time = strftime(dm.logs$log.date.time, format = '%Y-%m-%d %H:%M')

dm.logs$remaining.time.minutes[is.nan(dm.logs$remaining.time.minutes)] = 180

meter.min$sId = NULL
meter.min$ttl_time = NULL
meter.min$last_val_time = NULL
meter.min$type = NULL
meter.min$last_val = NULL
meter.min$min = NULL
meter.min$max = NULL

meter.min$time = as.POSIXct(meter.min$time / 1000, origin = "1970-01-01", tz = "Europe/Berlin")
meter.min$time = strftime(meter.min$time, format = '%Y-%m-%d %H:%M')
names(meter.min)[names(meter.min) == 'time'] = "log.date.time"

meter.min.active.power = meter.min[meter.min$tag == "active_pwr",]
names(meter.min.active.power)[names(meter.min.active.power) == 'ave'] = "ave.measured.power.w"
meter.min.active.power$tag = NULL

meter.min.energy.sum = meter.min[meter.min$tag == "energy_sum",]
names(meter.min.energy.sum)[names(meter.min.energy.sum) == 'ave'] = "ave.measured.energy.sum"
meter.min.energy.sum$tag = NULL

meter.min.power.factor = meter.min[meter.min$tag == "pf",]
names(meter.min.power.factor)[names(meter.min.power.factor) == 'ave'] = "ave.measured.power.factor"
meter.min.power.factor$tag = NULL

merged.meter.min = merge(x = meter.min.active.power, y = meter.min.energy.sum, by = "log.date.time")
merged.meter.min = merge(x = merged.meter.min, y = meter.min.power.factor, by = "log.date.time")

merged = merge(x = dm.logs, y = merged.meter.min, by = "log.date.time")
merged = merged[merged$power.rate.w != 0,]
merged = merged[merged$ave.measured.power.w != 0,]
merged = merged[merged$ac.connected,]

dim(merged)

plot(
  x = merged$power.rate.w,
  y = merged$ave.measured.power.w,
  main = "App vs Meter measured power",
  xlab = "App measured power (watts)",
  ylab = "Meter measured power (watts)"
)

power.model = lm(formula = ave.measured.power.w ~ power.rate.w , data = merged)

summary(power.model)

lines(
  x = merged$power.rate.w,
  y = power.model$fitted.values,
  col = "blue",
  lwd = 3
)

measured.power.cor = cor(x = merged$power.rate.w,
                         y = merged$ave.measured.power.w)

power.predict = predict(object = power.model, newdata = data.frame(power.rate.w = c(10, 15, 20)))

# plot(merged[, c(
#   'power.rate.w',
#   'min.measured.power.w',
#   'max.measured.power.w',
#   'ave.measured.power.w'
# )])

#names(dm.logs)
#table(dm.logs$power.rate.w)
#class(dm.logs$power.rate.w)
#str(dm.logs)
#is.something # is.numeric or nan

#as.something # as.numeric or logical
#typeof(dm.logs)
#colSums(is.na(meter.min))
#merged[sample(nrow(merged), 10), ]
#aggregate(x=merged$power.rate.w, by=list(merged$voltage), FUN=summary)
#range(merged$voltage)

#summary(dm.logs$power.rate.w)
#table(merged$ac.connected)

#write.csv(dm.logs, "battery_clean.csv")
# write.csv(meter.hours, "hours_clean.csv")
# write.csv(meter.min, "minutes_clean.csv")
# write.csv(meter.attr, "m2mgeneric_clean.csv")