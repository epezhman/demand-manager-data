Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

mean.windows.normal = mean(merged.windows.normal$real_power)
mean.windows.save = mean(merged.windows.save$real_power)

mean.ubuntu.normal = mean(merged.ubuntu.normal$real_power)
mean.ubuntu.save = mean(merged.ubuntu.save$real_power)

# attach(mtcars)
# par(mfrow=c(3,1))

plot(
  x = merged.windows.normal$power_rate_w,
  y = merged.windows.normal$real_power,
  main = "Windows Normal",
  xlab = "App Measured Power (watts)",
  ylab = "Meter Measured Power (watts)",
  pch="*",
  col="blue"
)

plot(
  x = merged.windows.save$power_rate_w,
  y = merged.windows.save$real_power,
  main = "Windows Save",
  xlab = "App Measured Power (watts)",
  ylab = "Meter Measured Power (watts)",
  pch="*",
  col="blue"
)

plot(
  x = merged.ubuntu.normal$power_rate_w,
  y = merged.ubuntu.normal$real_power,
  main = "Ubuntu Normal",
  xlab = "App Measured Power (watts)",
  ylab = "Meter Measured Power (watts)",
  pch="*",
  col="blue"
)

plot(
  x = merged.ubuntu.save$power_rate_w,
  y = merged.ubuntu.save$real_power,
  main = "Ubuntu Save",
  xlab = "App Measured Power (watts)",
  ylab = "Meter Measured Power (watts)",
  pch="*",
  col="blue"
)

