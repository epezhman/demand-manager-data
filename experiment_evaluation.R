Sys.setlocale("LC_TIME", "C")

setwd("~/exports/experiment_data/")

medal.measured <-
  read.csv("experiments_compressed.csv",
           header = TRUE,
           strip.white = TRUE)
medal.measured$time = as.character(medal.measured$time)
medal.measured$time = strftime(medal.measured$time, format = '%Y-%m-%d %H:%M:%S')
medal.measured$time = as.POSIXlt(medal.measured$time)

medal.measured$pow.jose.lcd1.mean = NULL
medal.measured$pow.jose.lcd1.median = NULL
medal.measured$pow.jose.lcd2.mean = NULL
medal.measured$pow.jose.lcd2.median = NULL
medal.measured$pow.mr.lcd1.mean = NULL
medal.measured$pow.mr.lcd1.median = NULL
medal.measured$pow.mr.lcd2.mean = NULL
medal.measured$pow.mr.lcd2.median = NULL
medal.measured$pow.nejc.lcd.mean = NULL
medal.measured$pow.nejc.lcd.median = NULL

medal.measured$pezh.jose.lcd.mean = NULL
medal.measured$pezh.jose.lcd.median = NULL
medal.measured$pezh.jose.mr.lcd.mean = NULL
medal.measured$pezh.jose.mr.lcd.median = NULL
medal.measured$pezh.jose.mr.nejc.lcd.mean = NULL
medal.measured$pezh.jose.mr.nejc.lcd.median = NULL

experiments <-
  read.csv("experiments.csv", header = TRUE, strip.white = TRUE)
experiments$start = as.character(experiments$start)
experiments$finish_scheduling = as.character(experiments$finish_scheduling)
experiments$all_joined = as.character(experiments$all_joined)


ex3 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 13:50:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 14:00:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex3.before <-
  ex3[ex3$time < strftime("2017-06-21 13:55:23", format = '%Y-%m-%d %H:%M:%S'),]
ex3.after <-
  ex3[ex3$time >= strftime("2017-06-21 13:55:23", format = '%Y-%m-%d %H:%M:%S'),]

ex4 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 14:05:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 14:15:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex4.before <-
  ex4[ex4$time < strftime("2017-06-21 14:10:27", format = '%Y-%m-%d %H:%M:%S'),]
ex4.after <-
  ex4[ex4$time >= strftime("2017-06-21 14:10:27", format = '%Y-%m-%d %H:%M:%S'),]

ex5 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 14:46:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 14:56:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex5.before <-
  ex5[ex5$time < strftime("2017-06-21 14:51:28", format = '%Y-%m-%d %H:%M:%S'),]
ex5.after <-
  ex5[ex5$time >= strftime("2017-06-21 14:51:28", format = '%Y-%m-%d %H:%M:%S'),]

ex6 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:05:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:15:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex6.before <-
  ex6[ex6$time < strftime("2017-06-21 15:10:23", format = '%Y-%m-%d %H:%M:%S'),]
ex6.after <-
  ex6[ex6$time >= strftime("2017-06-21 15:10:23", format = '%Y-%m-%d %H:%M:%S'),]

ex7 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:20:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:30:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex7.before <-
  ex7[ex7$time < strftime("2017-06-21 15:25:31", format = '%Y-%m-%d %H:%M:%S'),]
ex7.after <-
  ex7[ex7$time >= strftime("2017-06-21 15:25:31", format = '%Y-%m-%d %H:%M:%S'),]

ex8 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:25:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:45:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex8.before <-
  ex8[ex8$time < strftime("2017-06-21 15:35:48", format = '%Y-%m-%d %H:%M:%S'),]
ex8.after <-
  ex8[ex8$time >= strftime("2017-06-21 15:35:48", format = '%Y-%m-%d %H:%M:%S'),]

ex9 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:41:00", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:51:00", format = '%Y-%m-%d %H:%M:%S'), ]
ex9.before <-
  ex9[ex9$time < strftime("2017-06-21 15:46:25", format = '%Y-%m-%d %H:%M:%S'),]
ex9.after <-
  ex9[ex9$time >= strftime("2017-06-21 15:46:25", format = '%Y-%m-%d %H:%M:%S'),]

names.logs = names(medal.measured)