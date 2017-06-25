library(lattice)
library(DAAG)
library(broom)

par(mfrow=c(2,2))

cross.val.ub.sv <-
  suppressWarnings(
    cv.lm(
      data = filtered.ubunutu.save,
      form.lm = real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +   battery.rate:battery.capacity  +
        cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Ubuntu/Power Save Mode"
    )
  )
# performs the CV
cross.val.ub.sv.ms = attr(cross.val.ub.sv, 'ms')

cross.val.ub.nr <-
  suppressWarnings(
    cv.lm(
      data = filtered.ubunutu.normal,
      form.lm = real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +   battery.rate:battery.capacity  +
        cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Ubuntu/Normal Power Mode"
    )
  )
# performs the CV
cross.val.ub.nr.ms = attr(cross.val.ub.nr, 'ms')


cross.val.win.nr <-
  suppressWarnings(
    cv.lm(
      data = filtered.windows.normal,
      form.lm =   real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +  battery.rate:brightness  + battery.rate:battery.capacity  +
        cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Windows/Normal Power Mode"
    )
  )
# performs the CV
cross.val.win.nr.ms =  attr(cross.val.win.nr, 'ms')

cross.val.win.sv <-
  suppressWarnings(
    cv.lm(
      data = filtered.windows.save,
      form.lm =    real.power ~ battery.rate  + I(battery.rate ^ 2) + charging.status +  battery.rate:brightness  + battery.rate:battery.capacity  +
        cpu.usage + memory.usage  + battery.capacity + download.upload + read.write,
      m = 5,
      dots = FALSE,
      seed = 123,
      legend.pos = "topleft",
      printit = FALSE,
      main = "Windows/Power Save Mode"
    )
  )
# performs the CV
cross.val.win.sv.ms = attr(cross.val.win.sv, 'ms')


