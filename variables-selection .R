library(leaps)

leaps.ubuntu.save <-
  regsubsets(
    real.power ~ battery.rate  + I(battery.rate ^ 2) +  charging.status + brightness + battery.rate:brightness  + battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = filtered.ubunutu.save,
    nbest = 5,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.ubuntu.save)
par(mfrow = c(1, 2))
par(mar=c(4,3,0,3))
par(oma=c(4,0,0,0))
#plot(leaps.ubuntu.save, scale = "r2")
plot(leaps.ubuntu.save, scale = "adjr2")
plot(leaps.ubuntu.save, scale = "bic")
summary.out.ubuntu.save <- summary(leaps.ubuntu.save)
which.max(leaps.ubuntu.save$adjr2)
#summary.out.ubuntu.save$which[26, ]

######################################################################################################################################################

leaps.ubuntu.normal <-
  regsubsets(
    real.power ~ battery.rate  + I(battery.rate ^ 2) +  charging.status + brightness + battery.rate:brightness  + battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = filtered.ubunutu.normal,
    nbest = 5,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.ubuntu.normal)
par(mfrow = c(1, 2))
par(mar=c(4,3,0,3))
par(oma=c(4,0,0,0))
#plot(leaps.ubuntu.normal, scale = "r2")
plot(leaps.ubuntu.normal, scale = "adjr2")
plot(leaps.ubuntu.normal, scale = "bic")
summary.out.ubuntu.normal <- summary(leaps.ubuntu.normal)
which.max(leaps.ubuntu.normal$adjr2)
#summary.out.ubuntu.normal$which[26, ]

######################################################################################################################################################

leaps.windows.save <-
  regsubsets(
    real.power ~ battery.rate  + I(battery.rate ^ 2) +  charging.status + brightness + battery.rate:brightness  + battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = filtered.windows.save,
    nbest = 5,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.windows.save)
par(mfrow = c(1, 2))
par(mar=c(4,3,0,3))
par(oma=c(4,0,0,0))
#plot(leaps.windows.save, scale = "r2")
plot(leaps.windows.save, scale = "adjr2")
plot(leaps.windows.save, scale = "bic")
summary.out.windows.save <- summary(leaps.windows.save)
which.max(summary.out.windows.save$adjr2)
#summary.out$which[26, ]

######################################################################################################################################################

leaps.windows.normal <-
  regsubsets(
    real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +  brightness + battery.rate:brightness  + battery.rate:battery.capacity  +
      cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
    data = filtered.windows.normal,
    nbest = 5,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.windows.normal)
par(mfrow = c(1, 2))
par(mar=c(4,3,0,3))
par(oma=c(4,0,0,0))
#plot(leaps.windows.normal, scale = "r2")
plot(leaps.windows.normal, scale = "adjr2")
plot(leaps.windows.normal, scale = "bic")
summary.out.windows.normal <- summary(leaps.windows.normal)
which.max(summary.out.windows.normal$adjr2)
#summary.out$which[26, ]

