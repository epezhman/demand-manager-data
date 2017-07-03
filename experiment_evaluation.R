library(reshape2)

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

#######################################################################################################################
# ex3 <-
#   medal.measured[medal.measured$time >= strftime("2017-06-21 13:52:23", format = '%Y-%m-%d %H:%M:%S') &
#                    medal.measured$time <= strftime("2017-06-21 13:58:30", format = '%Y-%m-%d %H:%M:%S'), ]
# ex3.before <-
#   ex3[ex3$time < strftime("2017-06-21 13:55:23", format = '%Y-%m-%d %H:%M:%S'),]
# ex3.after <-
#   ex3[ex3$time >= strftime("2017-06-21 13:55:23", format = '%Y-%m-%d %H:%M:%S'),]
# 
# ex3$time = as.character(ex3$time)
# ex3$time = strftime(ex3$time, format = '%Y-%m-%d %H:%M:%S')
# ex3.melted = melt(ex3, id.vars = "time")
# ex3.melted$time = as.POSIXlt(ex3.melted$time)
# 
# names(ex3.melted)[names(ex3.melted) == 'variable'] = "Participants"
# names(ex3.melted)[names(ex3.melted) == 'value'] = "RealPower"
# names(ex3.melted)[names(ex3.melted) == 'time'] = "Time"
# 
# ex3.melted$Participants = as.character(ex3.melted$Participants)
# 
# ex3.median <-
#   ex3.melted[ex3.melted$Participants == "pow.pezh.lp.median" |
#                ex3.melted$Participants == "pow.jose.lp.median" |
#                ex3.melted$Participants == "pow.mr.lp.median" |
#                ex3.melted$Participants == "pow.nejc.lp.median" |
#                ex3.melted$Participants == "pezh.jose.mr.nejc.median"  , ]
# 
# ex3.mean <-
#   ex3.melted[ex3.melted$Participants == "pow.pezh.lp.mean" |
#                ex3.melted$Participants == "pow.jose.lp.mean" |
#                ex3.melted$Participants == "pow.mr.lp.mean" |
#                ex3.melted$Participants == "pow.nejc.lp.mean" |
#                ex3.melted$Participants == "pezh.jose.mr.nejc.mean"  , ]
# 
# ex3.median$Participants[ex3.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
# ex3.median$Participants[ex3.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
# ex3.median$Participants[ex3.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
# ex3.median$Participants[ex3.median$Participants == "pow.nejc.lp.median"] = "Laptop 4"
# ex3.median$Participants[ex3.median$Participants == "pezh.jose.mr.nejc.median"] = "All"
# 
# ex3.mean$Participants[ex3.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
# ex3.mean$Participants[ex3.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
# ex3.mean$Participants[ex3.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
# ex3.mean$Participants[ex3.mean$Participants == "pow.nejc.lp.mean"] = "Laptop 4"
# ex3.mean$Participants[ex3.mean$Participants == "pezh.jose.mr.nejc.mean"] = "All"
#
#######################################################################################################################
# ex4 <-
#   medal.measured[medal.measured$time >= strftime("2017-06-21 14:07:27", format = '%Y-%m-%d %H:%M:%S') &
#                    medal.measured$time <= strftime("2017-06-21 14:13:27", format = '%Y-%m-%d %H:%M:%S'), ]
# ex4.before <-
#   ex4[ex4$time < strftime("2017-06-21 14:10:27", format = '%Y-%m-%d %H:%M:%S'),]
# ex4.after <-
#   ex4[ex4$time >= strftime("2017-06-21 14:10:27", format = '%Y-%m-%d %H:%M:%S'),]
# 
# ex4$time = as.character(ex4$time)
# ex4$time = strftime(ex4$time, format = '%Y-%m-%d %H:%M:%S')
# ex4.melted = melt(ex4, id.vars = "time")
# ex4.melted$time = as.POSIXlt(ex4.melted$time)
# 
# names(ex4.melted)[names(ex4.melted) == 'variable'] = "Participants"
# names(ex4.melted)[names(ex4.melted) == 'value'] = "RealPower"
# names(ex4.melted)[names(ex4.melted) == 'time'] = "Time"
# 
# ex4.melted$Participants = as.character(ex4.melted$Participants)
# 
# ex4.median <-
#   ex4.melted[ex4.melted$Participants == "pow.pezh.lp.median" |
#                ex4.melted$Participants == "pow.jose.lp.median" |
#                ex4.melted$Participants == "pow.mr.lp.median" |
#                ex4.melted$Participants == "pow.nejc.lp.median" |
#                ex4.melted$Participants == "pezh.jose.mr.nejc.median"  , ]
# 
# ex4.mean <-
#   ex4.melted[ex4.melted$Participants == "pow.pezh.lp.mean" |
#                ex4.melted$Participants == "pow.jose.lp.mean" |
#                ex4.melted$Participants == "pow.mr.lp.mean" |
#                ex4.melted$Participants == "pow.nejc.lp.mean" |
#                ex4.melted$Participants == "pezh.jose.mr.nejc.mean"  , ]
# 
# ex4.median$Participants[ex4.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
# ex4.median$Participants[ex4.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
# ex4.median$Participants[ex4.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
# ex4.median$Participants[ex4.median$Participants == "pow.nejc.lp.median"] = "Laptop 4"
# ex4.median$Participants[ex4.median$Participants == "pezh.jose.mr.nejc.median"] = "All"
# 
# ex4.mean$Participants[ex4.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
# ex4.mean$Participants[ex4.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
# ex4.mean$Participants[ex4.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
# ex4.mean$Participants[ex4.mean$Participants == "pow.nejc.lp.mean"] = "Laptop 4"
# ex4.mean$Participants[ex4.mean$Participants == "pezh.jose.mr.nejc.mean"] = "All"
#
#######################################################################################################################
ex5 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 14:48:28", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 14:54:30", format = '%Y-%m-%d %H:%M:%S'), ]
ex5.before <-
  ex5[ex5$time < strftime("2017-06-21 14:51:28", format = '%Y-%m-%d %H:%M:%S'),]
ex5.after <-
  ex5[ex5$time >= strftime("2017-06-21 14:51:28", format = '%Y-%m-%d %H:%M:%S'),]

ex5$time = as.character(ex5$time)
ex5$time = strftime(ex5$time, format = '%Y-%m-%d %H:%M:%S')
ex5.melted = melt(ex5, id.vars = "time")
ex5.melted$time = as.POSIXlt(ex5.melted$time)

names(ex5.melted)[names(ex5.melted) == 'variable'] = "Participants"
names(ex5.melted)[names(ex5.melted) == 'value'] = "RealPower"
names(ex5.melted)[names(ex5.melted) == 'time'] = "Time"

ex5.melted$Participants = as.character(ex5.melted$Participants)

ex5.median <-
  ex5.melted[ex5.melted$Participants == "pow.pezh.lp.median" |
               ex5.melted$Participants == "pow.jose.lp.median" |
               ex5.melted$Participants == "pow.mr.lp.median" |
               ex5.melted$Participants == "pezh.jose.mr.median"  , ]

ex5.mean <-
  ex5.melted[ex5.melted$Participants == "pow.pezh.lp.mean" |
               ex5.melted$Participants == "pow.jose.lp.mean" |
               ex5.melted$Participants == "pow.mr.lp.mean" |
               ex5.melted$Participants == "pezh.jose.mr.mean"  , ]

ex5.median$Participants[ex5.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
ex5.median$Participants[ex5.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
ex5.median$Participants[ex5.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
ex5.median$Participants[ex5.median$Participants == "pezh.jose.mr.median"] = "All"

ex5.mean$Participants[ex5.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
ex5.mean$Participants[ex5.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
ex5.mean$Participants[ex5.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
ex5.mean$Participants[ex5.mean$Participants == "pezh.jose.mr.mean"] = "All"

#######################################################################################################################
ex6 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:07:23", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:13:30", format = '%Y-%m-%d %H:%M:%S'), ]
ex6.before <-
  ex6[ex6$time < strftime("2017-06-21 15:10:23", format = '%Y-%m-%d %H:%M:%S'),]
ex6.after <-
  ex6[ex6$time >= strftime("2017-06-21 15:10:23", format = '%Y-%m-%d %H:%M:%S'),]

ex6$time = as.character(ex6$time)
ex6$time = strftime(ex6$time, format = '%Y-%m-%d %H:%M:%S')
ex6.melted = melt(ex6, id.vars = "time")
ex6.melted$time = as.POSIXlt(ex6.melted$time)

names(ex6.melted)[names(ex6.melted) == 'variable'] = "Participants"
names(ex6.melted)[names(ex6.melted) == 'value'] = "RealPower"
names(ex6.melted)[names(ex6.melted) == 'time'] = "Time"

ex6.melted$Participants = as.character(ex6.melted$Participants)

ex6.median <-
  ex6.melted[ex6.melted$Participants == "pow.pezh.lp.median" |
               ex6.melted$Participants == "pow.jose.lp.median" |
               ex6.melted$Participants == "pow.mr.lp.median" |
               ex6.melted$Participants == "pezh.jose.mr.median"  , ]

ex6.mean <-
  ex6.melted[ex6.melted$Participants == "pow.pezh.lp.mean" |
               ex6.melted$Participants == "pow.jose.lp.mean" |
               ex6.melted$Participants == "pow.mr.lp.mean" |
               ex6.melted$Participants == "pezh.jose.mr.mean"  , ]

ex6.median$Participants[ex6.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
ex6.median$Participants[ex6.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
ex6.median$Participants[ex6.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
ex6.median$Participants[ex6.median$Participants == "pezh.jose.mr.median"] = "All"

ex6.mean$Participants[ex6.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
ex6.mean$Participants[ex6.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
ex6.mean$Participants[ex6.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
ex6.mean$Participants[ex6.mean$Participants == "pezh.jose.mr.mean"] = "All"

#######################################################################################################################
ex7 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:22:31", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:28:30", format = '%Y-%m-%d %H:%M:%S'), ]
ex7.before <-
  ex7[ex7$time < strftime("2017-06-21 15:25:31", format = '%Y-%m-%d %H:%M:%S'),]
ex7.after <-
  ex7[ex7$time >= strftime("2017-06-21 15:25:31", format = '%Y-%m-%d %H:%M:%S'),]

ex7$time = as.character(ex7$time)
ex7$time = strftime(ex7$time, format = '%Y-%m-%d %H:%M:%S')
ex7.melted = melt(ex7, id.vars = "time")
ex7.melted$time = as.POSIXlt(ex7.melted$time)

names(ex7.melted)[names(ex7.melted) == 'variable'] = "Participants"
names(ex7.melted)[names(ex7.melted) == 'value'] = "RealPower"
names(ex7.melted)[names(ex7.melted) == 'time'] = "Time"

ex7.melted$Participants = as.character(ex7.melted$Participants)

ex7.median <-
  ex7.melted[ex7.melted$Participants == "pow.pezh.lp.median" |
               ex7.melted$Participants == "pow.jose.lp.median" |
               ex7.melted$Participants == "pow.mr.lp.median" |
               ex7.melted$Participants == "pezh.jose.mr.median"  , ]

ex7.mean <-
  ex7.melted[ex7.melted$Participants == "pow.pezh.lp.mean" |
               ex7.melted$Participants == "pow.jose.lp.mean" |
               ex7.melted$Participants == "pow.mr.lp.mean" |
               ex7.melted$Participants == "pezh.jose.mr.mean"  , ]

ex7.median$Participants[ex7.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
ex7.median$Participants[ex7.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
ex7.median$Participants[ex7.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
ex7.median$Participants[ex7.median$Participants == "pezh.jose.mr.median"] = "All"

ex7.mean$Participants[ex7.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
ex7.mean$Participants[ex7.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
ex7.mean$Participants[ex7.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
ex7.mean$Participants[ex7.mean$Participants == "pezh.jose.mr.mean"] = "All"

#######################################################################################################################
ex8 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:32:48", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:38:48", format = '%Y-%m-%d %H:%M:%S'), ]
ex8.before <-
  ex8[ex8$time < strftime("2017-06-21 15:35:48", format = '%Y-%m-%d %H:%M:%S'),]
ex8.after <-
  ex8[ex8$time >= strftime("2017-06-21 15:35:48", format = '%Y-%m-%d %H:%M:%S'),]

ex8$time = as.character(ex8$time)
ex8$time = strftime(ex8$time, format = '%Y-%m-%d %H:%M:%S')
ex8.melted = melt(ex8, id.vars = "time")
ex8.melted$time = as.POSIXlt(ex8.melted$time)

names(ex8.melted)[names(ex8.melted) == 'variable'] = "Participants"
names(ex8.melted)[names(ex8.melted) == 'value'] = "RealPower"
names(ex8.melted)[names(ex8.melted) == 'time'] = "Time"

ex8.melted$Participants = as.character(ex8.melted$Participants)

ex8.median <-
  ex8.melted[ex8.melted$Participants == "pow.pezh.lp.median" |
               ex8.melted$Participants == "pow.jose.lp.median" |
               ex8.melted$Participants == "pow.mr.lp.median" |
               ex8.melted$Participants == "pezh.jose.mr.median"  , ]

ex8.mean <-
  ex8.melted[ex8.melted$Participants == "pow.pezh.lp.mean" |
               ex8.melted$Participants == "pow.jose.lp.mean" |
               ex8.melted$Participants == "pow.mr.lp.mean" |
               ex8.melted$Participants == "pezh.jose.mr.mean"  , ]

ex8.median$Participants[ex8.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
ex8.median$Participants[ex8.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
ex8.median$Participants[ex8.median$Participants == "pow.mr.lp.median"] = "Laptop 3"
ex8.median$Participants[ex8.median$Participants == "pezh.jose.mr.median"] = "All"

ex8.mean$Participants[ex8.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
ex8.mean$Participants[ex8.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
ex8.mean$Participants[ex8.mean$Participants == "pow.mr.lp.mean"] = "Laptop 3"
ex8.mean$Participants[ex8.mean$Participants == "pezh.jose.mr.mean"] = "All"

#######################################################################################################################
ex9 <-
  medal.measured[medal.measured$time >= strftime("2017-06-21 15:43:25", format = '%Y-%m-%d %H:%M:%S') &
                   medal.measured$time <= strftime("2017-06-21 15:49:25", format = '%Y-%m-%d %H:%M:%S'), ]
ex9.before <-
  ex9[ex9$time < strftime("2017-06-21 15:46:25", format = '%Y-%m-%d %H:%M:%S'),]
ex9.after <-
  ex9[ex9$time >= strftime("2017-06-21 15:46:25", format = '%Y-%m-%d %H:%M:%S'),]

ex9$time = as.character(ex9$time)
ex9$time = strftime(ex9$time, format = '%Y-%m-%d %H:%M:%S')
ex9.melted = melt(ex9, id.vars = "time")
ex9.melted$time = as.POSIXlt(ex9.melted$time)

names(ex9.melted)[names(ex9.melted) == 'variable'] = "Participants"
names(ex9.melted)[names(ex9.melted) == 'value'] = "RealPower"
names(ex9.melted)[names(ex9.melted) == 'time'] = "Time"

ex9.melted$Participants = as.character(ex9.melted$Participants)

ex9.median <-
  ex9.melted[ex9.melted$Participants == "pow.pezh.lp.median" |
               ex9.melted$Participants == "pow.jose.lp.median" |
               ex9.melted$Participants == "pezh.jose.median"  , ]

ex9.mean <-
  ex9.melted[ex9.melted$Participants == "pow.pezh.lp.mean" |
               ex9.melted$Participants == "pow.jose.lp.mean" |
               ex9.melted$Participants == "pezh.jose.mean"  , ]

ex9.median$Participants[ex9.median$Participants == "pow.pezh.lp.median"] = "Laptop 1"
ex9.median$Participants[ex9.median$Participants == "pow.jose.lp.median"] = "Laptop 2"
ex9.median$Participants[ex9.median$Participants == "pezh.jose.median"] = "All"

ex9.mean$Participants[ex9.mean$Participants == "pow.pezh.lp.mean"] = "Laptop 1"
ex9.mean$Participants[ex9.mean$Participants == "pow.jose.lp.mean"] = "Laptop 2"
ex9.mean$Participants[ex9.mean$Participants == "pezh.jose.mean"] = "All"
#######################################################################################################################
#######################################################################################################################
#######################################################################################################################
#######################################################################################################################
#######################################################################################################################

# experiments$before.mean[experiments$id == 1] = mean(ex3.before$pezh.jose.mr.nejc.mean)
# experiments$before.median[experiments$id == 1] = median(ex3.before$pezh.jose.mr.nejc.median)
# experiments$after.mean[experiments$id == 1] = mean(ex3.after$pezh.jose.mr.nejc.mean)
# experiments$after.median[experiments$id == 1] = median(ex3.after$pezh.jose.mr.nejc.median)
# 
# experiments$before.mean[experiments$id == 2] = mean(ex4.before$pezh.jose.mr.nejc.mean)
# experiments$before.median[experiments$id == 2] = median(ex4.before$pezh.jose.mr.nejc.median)
# experiments$after.mean[experiments$id == 2] = mean(ex4.after$pezh.jose.mr.nejc.mean)
# experiments$after.median[experiments$id == 2] = median(ex4.after$pezh.jose.mr.nejc.median)

experiments$before.mean[experiments$id == 3] = mean(ex5.before$pezh.jose.mr.mean)
experiments$before.median[experiments$id == 3] = median(ex5.before$pezh.jose.mr.median)
experiments$after.mean[experiments$id == 3] = mean(ex5.after$pezh.jose.mr.mean)
experiments$after.median[experiments$id == 3] = median(ex5.after$pezh.jose.mr.median)

experiments$before.mean[experiments$id == 4] = mean(ex6.before$pezh.jose.mr.mean)
experiments$before.median[experiments$id == 4] = median(ex6.before$pezh.jose.mr.median)
experiments$after.mean[experiments$id == 4] = mean(ex6.after$pezh.jose.mr.mean)
experiments$after.median[experiments$id == 4] = median(ex6.after$pezh.jose.mr.median)

experiments$before.mean[experiments$id == 5] = mean(ex7.before$pezh.jose.mr.mean)
experiments$before.median[experiments$id == 5] = median(ex7.before$pezh.jose.mr.median)
experiments$after.mean[experiments$id == 5] = mean(ex7.after$pezh.jose.mr.mean)
experiments$after.median[experiments$id == 5] = median(ex7.after$pezh.jose.mr.median)

experiments$before.mean[experiments$id == 6] = mean(ex8.before$pezh.jose.mr.mean)
experiments$before.median[experiments$id == 6] = median(ex8.before$pezh.jose.mr.median)
experiments$after.mean[experiments$id == 6] = mean(ex8.after$pezh.jose.mr.mean)
experiments$after.median[experiments$id == 6] = median(ex8.after$pezh.jose.mr.median)

experiments$before.mean[experiments$id == 7] = mean(ex9.before$pezh.jose.mean)
experiments$before.median[experiments$id == 7] = median(ex9.before$pezh.jose.median)
experiments$after.mean[experiments$id == 7] = mean(ex9.after$pezh.jose.mean)
experiments$after.median[experiments$id == 7] = median(ex9.after$pezh.jose.median)

################################################################################################
experiments$before.mean.pezh[experiments$id == 3] = mean(ex5.before$pow.pezh.lp.mean)
experiments$before.median.pezh[experiments$id == 3] = median(ex5.before$pow.pezh.lp.median)
experiments$after.mean.pezh[experiments$id == 3] = mean(ex5.after$pow.pezh.lp.mean)
experiments$after.median.pezh[experiments$id == 3] = median(ex5.after$pow.pezh.lp.median)

experiments$before.mean.pezh[experiments$id == 4] = mean(ex6.before$pow.pezh.lp.mean)
experiments$before.median.pezh[experiments$id == 4] = median(ex6.before$pow.pezh.lp.median)
experiments$after.mean.pezh[experiments$id == 4] = mean(ex6.after$pow.pezh.lp.mean)
experiments$after.median.pezh[experiments$id == 4] = median(ex6.after$pow.pezh.lp.median)

experiments$before.mean.pezh[experiments$id == 5] = mean(ex7.before$pow.pezh.lp.mean)
experiments$before.median.pezh[experiments$id == 5] = median(ex7.before$pow.pezh.lp.median)
experiments$after.mean.pezh[experiments$id == 5] = mean(ex7.after$pow.pezh.lp.mean)
experiments$after.median.pezh[experiments$id == 5] = median(ex7.after$pow.pezh.lp.median)

experiments$before.mean.pezh[experiments$id == 6] = mean(ex8.before$pow.pezh.lp.mean)
experiments$before.median.pezh[experiments$id == 6] = median(ex8.before$pow.pezh.lp.median)
experiments$after.mean.pezh[experiments$id == 6] = mean(ex8.after$pow.pezh.lp.mean)
experiments$after.median.pezh[experiments$id == 6] = median(ex8.after$pow.pezh.lp.median)

experiments$before.mean.pezh[experiments$id == 7] = mean(ex9.before$pow.pezh.lp.mean)
experiments$before.median.pezh[experiments$id == 7] = median(ex9.before$pow.pezh.lp.median)
experiments$after.mean.pezh[experiments$id == 7] = mean(ex9.after$pow.pezh.lp.mean)
experiments$after.median.pezh[experiments$id == 7] = median(ex9.after$pow.pezh.lp.median)

#############################################################################################
experiments$before.mean.jose[experiments$id == 3] = mean(ex5.before$pow.jose.lp.mean)
experiments$before.median.jose[experiments$id == 3] = median(ex5.before$pow.jose.lp.median)
experiments$after.mean.jose[experiments$id == 3] = mean(ex5.after$pow.jose.lp.mean)
experiments$after.median.jose[experiments$id == 3] = median(ex5.after$pow.jose.lp.median)

experiments$before.mean.jose[experiments$id == 4] = mean(ex6.before$pow.jose.lp.mean)
experiments$before.median.jose[experiments$id == 4] = median(ex6.before$pow.jose.lp.median)
experiments$after.mean.jose[experiments$id == 4] = mean(ex6.after$pow.jose.lp.mean)
experiments$after.median.jose[experiments$id == 4] = median(ex6.after$pow.jose.lp.median)

experiments$before.mean.jose[experiments$id == 5] = mean(ex7.before$pow.jose.lp.mean)
experiments$before.median.jose[experiments$id == 5] = median(ex7.before$pow.jose.lp.median)
experiments$after.mean.jose[experiments$id == 5] = mean(ex7.after$pow.jose.lp.mean)
experiments$after.median.jose[experiments$id == 5] = median(ex7.after$pow.jose.lp.median)

experiments$before.mean.jose[experiments$id == 6] = mean(ex8.before$pow.jose.lp.mean)
experiments$before.median.jose[experiments$id == 6] = median(ex8.before$pow.jose.lp.median)
experiments$after.mean.jose[experiments$id == 6] = mean(ex8.after$pow.jose.lp.mean)
experiments$after.median.jose[experiments$id == 6] = median(ex8.after$pow.jose.lp.median)

experiments$before.mean.jose[experiments$id == 7] = mean(ex9.before$pow.jose.lp.mean)
experiments$before.median.jose[experiments$id == 7] = median(ex9.before$pow.jose.lp.median)
experiments$after.mean.jose[experiments$id == 7] = mean(ex9.after$pow.jose.lp.mean)
experiments$after.median.jose[experiments$id == 7] = median(ex9.after$pow.jose.lp.median)

#############################################################################################
experiments$before.mean.mr[experiments$id == 3] = mean(ex5.before$pow.mr.lp.mean)
experiments$before.median.mr[experiments$id == 3] = median(ex5.before$pow.mr.lp.median)
experiments$after.mean.mr[experiments$id == 3] = mean(ex5.after$pow.mr.lp.mean)
experiments$after.median.mr[experiments$id == 3] = median(ex5.after$pow.mr.lp.median)

experiments$before.mean.mr[experiments$id == 4] = mean(ex6.before$pow.mr.lp.mean)
experiments$before.median.mr[experiments$id == 4] = median(ex6.before$pow.mr.lp.median)
experiments$after.mean.mr[experiments$id == 4] = mean(ex6.after$pow.mr.lp.mean)
experiments$after.median.mr[experiments$id == 4] = median(ex6.after$pow.mr.lp.median)

experiments$before.mean.mr[experiments$id == 5] = mean(ex7.before$pow.mr.lp.mean)
experiments$before.median.mr[experiments$id == 5] = median(ex7.before$pow.mr.lp.median)
experiments$after.mean.mr[experiments$id == 5] = mean(ex7.after$pow.mr.lp.mean)
experiments$after.median.mr[experiments$id == 5] = median(ex7.after$pow.mr.lp.median)

experiments$before.mean.mr[experiments$id == 6] = mean(ex8.before$pow.mr.lp.mean)
experiments$before.median.mr[experiments$id == 6] = median(ex8.before$pow.mr.lp.median)
experiments$after.mean.mr[experiments$id == 6] = mean(ex8.after$pow.mr.lp.mean)
experiments$after.median.mr[experiments$id == 6] = median(ex8.after$pow.mr.lp.median)

experiments$before.mean.mr[experiments$id == 7] = mean(ex9.before$pow.mr.lp.mean)
experiments$before.median.mr[experiments$id == 7] = median(ex9.before$pow.mr.lp.median)
experiments$after.mean.mr[experiments$id == 7] = mean(ex9.after$pow.mr.lp.mean)
experiments$after.median.mr[experiments$id == 7] = median(ex9.after$pow.mr.lp.median)

#############################################################################################

experiments$mean.cut.watts = experiments$before.mean - experiments$after.mean
experiments$mean.cut.percentage = ((experiments$before.mean - experiments$after.mean) / experiments$before.mean) * 100

experiments$median.cut.watts = experiments$before.median - experiments$after.median
experiments$median.cut.percentage = ((experiments$before.median - experiments$after.median) / experiments$before.median) *
  100

#########################################################################################################################
#experiments$mean.cut.watts.pezh = experiments$before.mean.pezh - experiments$after.mean.pezh
experiments$mean.cut.percentage.pezh = ((experiments$before.mean.pezh - experiments$after.mean.pezh) / experiments$before.mean.pezh) * 100

#experiments$median.cut.watts.pezh = experiments$before.median.pezh - experiments$after.median.pezh
#experiments$median.cut.percentage.pezh = ((experiments$before.median.pezh - experiments$after.median.pezh) / experiments$before.median.pezh) * 100

#experiments$mean.cut.watts.jose = experiments$before.mean.jose - experiments$after.mean.jose
experiments$mean.cut.percentage.jose = ((experiments$before.mean.jose - experiments$after.mean.jose) / experiments$before.mean.jose) * 100

#experiments$median.cut.watts.jose = experiments$before.median.jose - experiments$after.median.jose
#experiments$median.cut.percentage.jose = ((experiments$before.median.jose - experiments$after.median.jose) / experiments$before.median.jose) * 100

#experiments$mean.cut.watts.mr = experiments$before.mean.mr - experiments$after.mean.mr
experiments$mean.cut.percentage.mr = ((experiments$before.mean.mr - experiments$after.mean.mr) / experiments$before.mean.mr) * 100

#experiments$median.cut.watts.mr = experiments$before.median.mr - experiments$after.median.mr
#experiments$median.cut.percentage.mr= ((experiments$before.median.mr - experiments$after.median.mr) / experiments$before.median.mr) * 100

##################################################################################################
actual.pred.median <-
  data.frame(cbind(actuals = experiments$demand_cut, predicteds = experiments$median.cut.watts))
actual.pred.mean <-
  data.frame(cbind(actuals = experiments$demand_cut, predicteds = experiments$mean.cut.watts))

correlation.accuracy.median <-  cor(actual.pred.median)
correlation.accuracy.mean <-  cor(actual.pred.mean)

min.max.accuracy.median <-
  mean(apply(actual.pred.median, 1, min) / apply(actual.pred.median, 1, max))
min.max.accuracy.mean <-
  mean(apply(actual.pred.mean, 1, min) / apply(actual.pred.mean, 1, max))

mape.median <-
  mean(abs(actual.pred.median$predicteds - actual.pred.median$actuals) / actual.pred.median$actuals)
mape.mean <-
  mean(abs(actual.pred.mean$predicteds - actual.pred.mean$actuals) / actual.pred.mean$actuals)

write.csv(experiments, "experiments_final_results.csv", row.names = FALSE)
