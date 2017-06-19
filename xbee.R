Sys.setlocale("LC_TIME", "C")

setwd("~/exports/xbee")

xbee <-
  read.csv("xbee-2017-06-19 16:31:39.257150.csv",
           header = TRUE,
           strip.white = TRUE)
str(xbee)


