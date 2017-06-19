Sys.setlocale("LC_TIME", "C")

setwd("~/exports")

merged.ubuntu <-
  read.csv("merged_my_ubuntu.csv",
           header = TRUE,
           strip.white = TRUE)

merged.ubuntu$time = as.character(merged.ubuntu$time)

merged.windows <-
  read.csv("merged_my_windows.csv",
           header = TRUE,
           strip.white = TRUE)

merged.windows$time = as.character(merged.windows$time)

merged.ubuntu = merged.ubuntu[merged.ubuntu$ac_connected_bool, ]

merged.windows = merged.windows[merged.windows$ac_connected_bool, ]
merged.windows = merged.windows[!is.na(merged.windows$time), ]
merged.windows = merged.windows[!is.na(merged.windows$charging_bool), ]
merged.windows = merged.windows[!is.na(merged.windows$discharging_bool), ]

merged.windows$cpu_cores <- 4

merged.ubuntu$real_power[merged.ubuntu$real_power < 0] = 0
merged.windows$real_power[merged.windows$real_power < 0] = 0

merged.windows = merged.windows[merged.windows$real_power > 8, ]
merged.ubuntu = merged.ubuntu[merged.ubuntu$real_power > 8, ]
merged.windows = merged.windows[merged.windows$real_power < 66, ]
merged.ubuntu = merged.ubuntu[merged.ubuntu$real_power < 66, ]

merged.windows$charging_bool = as.factor(merged.windows$charging_bool)
merged.ubuntu$charging_bool = as.factor(merged.ubuntu$charging_bool)

merged.windows$discharging_bool = as.factor(merged.windows$discharging_bool)
merged.ubuntu$discharging_bool = as.factor(merged.ubuntu$discharging_bool)

merged.windows$download_upload_kb = merged.windows$download_kb + merged.windows$upload_kb
merged.ubuntu$download_upload_kb = merged.ubuntu$download_kb + merged.ubuntu$upload_kb

merged.windows$read_write_request = merged.windows$read_request_per_s + merged.windows$write_request_per_s
merged.ubuntu$read_write_request = merged.ubuntu$read_request_per_s + merged.ubuntu$write_request_per_s

filtered.ubunutu.save <-
  merged.ubuntu[merged.ubuntu$dm_enabled, c(
    "brightness_percent",
    "charging_bool",
    "cpu_usage_percent",
    "memory_percent",
    "power_rate_w",
    "remaining_capacity_percent",
    "download_upload_kb",
    "read_write_request",
    "real_power"
  )]

filtered.ubunutu.normal <-
  merged.ubuntu[!merged.ubuntu$dm_enabled, c(
    "brightness_percent",
    "charging_bool",
    "cpu_usage_percent",
    "memory_percent",
    "power_rate_w",
    "remaining_capacity_percent",
    "download_upload_kb",
    "read_write_request",
    "real_power"
  )]

filtered.windows.save <-
  merged.windows[merged.windows$dm_enabled, c(
    "brightness_percent",
    "charging_bool",
    "cpu_usage_percent",
    "memory_percent",
    "power_rate_w",
    "remaining_capacity_percent",
    "download_upload_kb",
    "read_write_request",
    "real_power"
  )]

filtered.windows.normal <-
  merged.windows[!merged.windows$dm_enabled, c(
    "brightness_percent",
    "charging_bool",
    "cpu_usage_percent",
    "memory_percent",
    "power_rate_w",
    "remaining_capacity_percent",
    "download_upload_kb",
    "read_write_request",
    "real_power"
  )]
