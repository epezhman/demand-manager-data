Sys.setlocale("LC_TIME", "C")

setwd("~/exports/experiment_data/")

jose.laptop <-
  read.csv("jose_laptop.csv", header = TRUE, strip.white = TRUE)
jose.laptop$time = as.character(jose.laptop$time)
jose.laptop$time = strftime(jose.laptop$time, format = '%Y-%m-%d %H:%M:%S')

jose.lcd1 <-
  read.csv("jose_lcd1.csv", header = TRUE, strip.white = TRUE)
jose.lcd1$time = as.character(jose.lcd1$time)
jose.lcd1$time = strftime(jose.lcd1$time, format = '%Y-%m-%d %H:%M:%S')

jose.lcd2 <-
  read.csv("jose_lcd2.csv", header = TRUE, strip.white = TRUE)
jose.lcd2$time = as.character(jose.lcd2$time)
jose.lcd2$time = strftime(jose.lcd2$time, format = '%Y-%m-%d %H:%M:%S')

mr.laptop <-
  read.csv("mr_laptop.csv", header = TRUE, strip.white = TRUE)
mr.laptop$time = as.character(mr.laptop$time)
mr.laptop$time = strftime(mr.laptop$time, format = '%Y-%m-%d %H:%M:%S')

mr.lcd1 <-
  read.csv("mr_lcd1.csv", header = TRUE, strip.white = TRUE)
mr.lcd1$time = as.character(mr.lcd1$time)
mr.lcd1$time = strftime(mr.lcd1$time, format = '%Y-%m-%d %H:%M:%S')

mr.lcd2 <-
  read.csv("mr_lcd2.csv", header = TRUE, strip.white = TRUE)
mr.lcd2$time = as.character(mr.lcd2$time)
mr.lcd2$time = strftime(mr.lcd2$time, format = '%Y-%m-%d %H:%M:%S')

nejc.laptop <-
  read.csv("nejc_laptop.csv", header = TRUE, strip.white = TRUE)
nejc.laptop$time = as.character(nejc.laptop$time)
nejc.laptop$time = strftime(nejc.laptop$time, format = '%Y-%m-%d %H:%M:%S')

nejc.lcd <-
  read.csv("nejc_lcd.csv", header = TRUE, strip.white = TRUE)
nejc.lcd$time = as.character(nejc.lcd$time)
nejc.lcd$time = strftime(nejc.lcd$time, format = '%Y-%m-%d %H:%M:%S')

pezhman.laptop <-
  read.csv("pezhman_laptop.csv",
           header = TRUE,
           strip.white = TRUE)
pezhman.laptop$time = as.character(pezhman.laptop$time)
pezhman.laptop$time = strftime(pezhman.laptop$time, format = '%Y-%m-%d %H:%M:%S')

jose.laptop = jose.laptop[jose.laptop$real_power > 5, c("real_power", "time")]
jose.lcd1 = jose.lcd1[jose.lcd1$real_power >=0 , c("real_power", "time")]
jose.lcd2 = jose.lcd2[jose.lcd2$real_power >=0, c("real_power", "time")]
mr.laptop = mr.laptop[mr.laptop$real_power > 5,  c("real_power", "time")]
mr.lcd1 = mr.lcd1[mr.lcd1$real_power >=0, c("real_power", "time")]
mr.lcd2 = mr.lcd2[mr.lcd2$real_power >=0, c("real_power", "time")]
nejc.laptop = nejc.laptop[nejc.laptop$real_power > 5,  c("real_power", "time")]
nejc.lcd = nejc.lcd[nejc.lcd$real_power >=0, c("real_power", "time")]
pezhman.laptop = pezhman.laptop[pezhman.laptop$real_power > 5,  c("real_power", "time")]

jose.laptop = jose.laptop[jose.laptop$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
jose.laptop = jose.laptop[jose.laptop$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

jose.lcd1 = jose.lcd1[jose.lcd1$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
jose.lcd1 = jose.lcd1[jose.lcd1$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

jose.lcd2 = jose.lcd2[jose.lcd2$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
jose.lcd2 = jose.lcd2[jose.lcd2$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

mr.laptop = mr.laptop[mr.laptop$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
mr.laptop = mr.laptop[mr.laptop$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

mr.lcd1 = mr.lcd1[mr.lcd1$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
mr.lcd1 = mr.lcd1[mr.lcd1$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

mr.lcd2 = mr.lcd2[mr.lcd2$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
mr.lcd2 = mr.lcd2[mr.lcd2$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

nejc.laptop = nejc.laptop[nejc.laptop$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
nejc.laptop = nejc.laptop[nejc.laptop$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

nejc.lcd = nejc.lcd[nejc.lcd$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
nejc.lcd = nejc.lcd[nejc.lcd$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

pezhman.laptop = pezhman.laptop[pezhman.laptop$time > strftime("2017-06-21 12:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
pezhman.laptop = pezhman.laptop[pezhman.laptop$time < strftime("2017-06-21 16:00:00", format = '%Y-%m-%d %H:%M:%S'), ]

names(jose.laptop)[names(jose.laptop) == 'real_power'] = "pow.jose.lp"
names(jose.lcd1)[names(jose.lcd1) == 'real_power'] = "pow.jose.lcd1"
names(jose.lcd2)[names(jose.lcd2) == 'real_power'] = "pow.jose.lcd2"
names(mr.laptop)[names(mr.laptop) == 'real_power'] = "pow.mr.lp"
names(mr.lcd1)[names(mr.lcd1) == 'real_power'] = "pow.mr.lcd1"
names(mr.lcd2)[names(mr.lcd2) == 'real_power'] = "pow.mr.lcd2"
names(nejc.laptop)[names(nejc.laptop) == 'real_power'] = "pow.nejc.lp"
names(nejc.lcd)[names(nejc.lcd) == 'real_power'] = "pow.nejc.lcd"
names(pezhman.laptop)[names(pezhman.laptop) == 'real_power'] = "pow.pezh.lp"

merged.experiments = merge(x = jose.laptop, y = jose.lcd1, by = "time")
merged.experiments = merge(x = merged.experiments, y = jose.lcd2, by = "time")
merged.experiments = merge(x = merged.experiments, y = mr.laptop, by = "time")
merged.experiments = merge(x = merged.experiments, y = mr.lcd1, by = "time")
merged.experiments = merge(x = merged.experiments, y = mr.lcd2, by = "time")
merged.experiments = merge(x = merged.experiments, y = nejc.laptop, by = "time")
merged.experiments = merge(x = merged.experiments, y = nejc.lcd, by = "time")
merged.experiments = merge(x = merged.experiments, y = pezhman.laptop, by = "time")

merged.experiments$pezh.jose = merged.experiments$pow.pezh.lp + merged.experiments$pow.jose.lp

merged.experiments$pezh.jose.mr = merged.experiments$pezh.jose + merged.experiments$pow.mr.lp

merged.experiments$pezh.jose.mr.nejc = merged.experiments$pezh.jose.mr + merged.experiments$pow.nejc.lp

merged.experiments$pezh.jose.lcd = merged.experiments$pezh.jose + merged.experiments$pow.jose.lcd1 + merged.experiments$pow.jose.lcd2

merged.experiments$pezh.jose.mr.lcd = merged.experiments$pezh.jose.mr + merged.experiments$pow.mr.lcd1 + merged.experiments$pow.mr.lcd2

merged.experiments$pezh.jose.mr.nejc.lcd = merged.experiments$pezh.jose.mr.nejc + merged.experiments$pow.nejc.lcd

write.csv(merged.experiments, "merged_experiments.csv", row.names=FALSE)

