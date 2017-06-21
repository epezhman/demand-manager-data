library(leaps)

leaps.ubuntu.save <-
  regsubsets(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = filtered.ubunutu.save,
    nbest = 10,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.ubuntu.save)
par(mfrow = c(1, 3))
plot(leaps.ubuntu.save, scale = "r2")
plot(leaps.ubuntu.save, scale = "adjr2")
plot(leaps.ubuntu.save, scale = "bic")
summary.out.ubuntu.save <- summary(leaps.ubuntu.save)
which.max(leaps.ubuntu.save$adjr2)
#summary.out.ubuntu.save$which[26, ]

######################################################################################################################################################
leaps.ubuntu.normal <-
  regsubsets(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = filtered.ubunutu.normal,
    nbest = 10,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.ubuntu.normal)
par(mfrow = c(1, 3))
plot(leaps.ubuntu.normal, scale = "r2")
plot(leaps.ubuntu.normal, scale = "adjr2")
plot(leaps.ubuntu.normal, scale = "bic")
summary.out.ubuntu.normal <- summary(leaps.ubuntu.normal)
which.max(leaps.ubuntu.normal$adjr2)
#summary.out.ubuntu.normal$which[26, ]

######################################################################################################################################################
leaps.windows.save <-
  regsubsets(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = filtered.windows.save,
    nbest = 10,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.windows.save)
par(mfrow = c(1, 3))
plot(leaps.windows.save, scale = "r2")
plot(leaps.windows.save, scale = "adjr2")
plot(leaps.windows.save, scale = "bic")
summary.out.windows.save <- summary(leaps.windows.save)
which.max(summary.out.windows.save$adjr2)
#summary.out$which[26, ]

######################################################################################################################################################
leaps.windows.normal <-
  regsubsets(
    real_power ~ power_rate_w  + I(power_rate_w ^ 2) + charging_bool + power_rate_w:brightness_percent  + power_rate_w:remaining_capacity_percent  +
      cpu_usage_percent + memory_percent  + remaining_capacity_percent + download_upload_kb + read_write_request,
    data = filtered.windows.normal,
    nbest = 10,
    nvmax = NULL,
    force.in = NULL,
    force.out = NULL,
    method = "exhaustive"
  )
#summary(leaps.windows.normal)
par(mfrow = c(1, 3))
plot(leaps.windows.normal, scale = "r2")
plot(leaps.windows.normal, scale = "adjr2")
plot(leaps.windows.normal, scale = "bic")
summary.out.windows.normal <- summary(leaps.windows.normal)
which.max(summary.out.windows.normal$adjr2)
#summary.out$which[26, ]

