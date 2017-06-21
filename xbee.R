Sys.setlocale("LC_TIME", "C")

setwd("~/exports/xbee")

xbee <-
  read.csv("xbee-2017-06-19 16:31:39.257150.csv",
           header = TRUE,
           strip.white = TRUE)
str(xbee)



setwd("~/Dropbox/i13monclient/xbee/")

xbee.win.sv <-
  read.csv("save.csv",
           header = TRUE,
           strip.white = TRUE)

xbee.win.nr <-
  read.csv("normal.csv",
           header = TRUE,
           strip.white = TRUE)
mean (xbee.win.nr$power)
mean (xbee.win.sv$power)

en.nr = xbee.win.nr[104, ]$work - xbee.win.nr[1, ]$work
en.sv = xbee.win.sv[105, ]$work - xbee.win.sv[1, ]$work


