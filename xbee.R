Sys.setlocale("LC_TIME", "C")

setwd("~/exports/xbee")
u.nr.1 <-
  read.csv("normal1.csv",
           header = TRUE,
           strip.white = TRUE)
u.nr.2 <-
  read.csv("normal2.csv",
           header = TRUE,
           strip.white = TRUE)
u.nr.3 <-
  read.csv("normal3.csv",
           header = TRUE,
           strip.white = TRUE)
u.sv.1 <-
  read.csv("save1.csv",
           header = TRUE,
           strip.white = TRUE)
u.sv.2 <-
  read.csv("save2.csv",
           header = TRUE,
           strip.white = TRUE)
u.sv.3 <-
  read.csv("save3.csv",
           header = TRUE,
           strip.white = TRUE)

u.nr.1.pw <- mean (u.nr.1$power)
u.nr.2.pw <- mean (u.nr.2$power)
u.nr.3.pw <- mean (u.nr.3$power)
u.sv.1.pw <- mean (u.sv.1$power)
u.sv.2.pw <- mean (u.sv.2$power)
u.sv.3.pw <- mean (u.sv.3$power)

u.nr.mean.pw  = mean(c(u.nr.1.pw, u.nr.2.pw, u.nr.3.pw))
u.sv.mean.pw  = mean(c(u.sv.1.pw, u.sv.2.pw, u.sv.3.pw))

avg.ub.pw.drop = ((u.nr.mean.pw - u.sv.mean.pw) / u.nr.mean.pw) * 100

u.nr.1.en = u.nr.1[nrow(u.nr.1), ]$work - u.nr.1[1, ]$work
u.nr.2.en = u.nr.2[nrow(u.nr.2), ]$work - u.nr.2[1, ]$work
u.nr.3.en = u.nr.3[nrow(u.nr.3), ]$work - u.nr.3[1, ]$work
u.sv.1.en = u.sv.1[nrow(u.sv.1), ]$work - u.sv.1[1, ]$work
u.sv.2.en = u.sv.2[nrow(u.sv.2), ]$work - u.sv.2[1, ]$work
u.sv.3.en = u.sv.3[nrow(u.sv.3), ]$work - u.sv.3[1, ]$work

u.nr.mean.en  = mean(c(u.nr.1.en, u.nr.2.en, u.nr.3.en))
u.sv.mean.en  = mean(c(u.sv.1.en, u.sv.2.en, u.sv.3.en))

avg.ub.en.drop = ((u.nr.mean.en - u.sv.mean.en) / u.nr.mean.en) * 100

####################################################################
setwd("~/Dropbox/i13monclient/xbee/")
w.nr.1 <-
  read.csv("normal2.csv",
           header = TRUE,
           strip.white = TRUE)
w.nr.2 <-
  read.csv("normal3.csv",
           header = TRUE,
           strip.white = TRUE)
w.nr.3 <-
  read.csv("normal4.csv",
           header = TRUE,
           strip.white = TRUE)
w.sv.1 <-
  read.csv("save2.csv",
           header = TRUE,
           strip.white = TRUE)
w.sv.2 <-
  read.csv("save3.csv",
           header = TRUE,
           strip.white = TRUE)
w.sv.3 <-
  read.csv("save4.csv",
           header = TRUE,
           strip.white = TRUE)

w.nr.1.pw <- mean (w.nr.1$power)
w.nr.2.pw <- mean (w.nr.2$power)
w.nr.3.pw <- mean (w.nr.3$power)
w.sv.1.pw <- mean (w.sv.1$power)
w.sv.2.pw <- mean (w.sv.2$power)
w.sv.3.pw <- mean (w.sv.3$power)

w.nr.mean.pw  = mean(c(w.nr.1.pw, w.nr.2.pw, w.nr.3.pw))
w.sv.mean.pw  = mean(c(w.sv.1.pw, w.sv.2.pw, w.sv.3.pw))

avg.win.pw.drop = ((w.nr.mean.pw - w.sv.mean.pw) / w.nr.mean.pw) * 100

w.nr.1.en = w.nr.1[nrow(w.nr.1), ]$work - w.nr.1[1, ]$work
w.nr.2.en = w.nr.2[nrow(w.nr.2), ]$work - w.nr.2[1, ]$work
w.nr.3.en = w.nr.3[nrow(w.nr.3), ]$work - w.nr.3[1, ]$work
w.sv.1.en = w.sv.1[nrow(w.sv.1), ]$work - w.sv.1[1, ]$work
w.sv.2.en = w.sv.2[nrow(w.sv.2), ]$work - w.sv.2[1, ]$work
w.sv.3.en = w.sv.3[nrow(w.sv.3), ]$work - w.sv.3[1, ]$work

w.nr.mean.en  = mean(c(w.nr.1.en, w.nr.2.en, w.nr.3.en))
w.sv.mean.en  = mean(c(w.sv.1.en, w.sv.2.en, w.sv.3.en))

avg.win.en.drop = ((w.nr.mean.en - w.sv.mean.en) / w.nr.mean.en) * 100

