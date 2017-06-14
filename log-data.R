Sys.setlocale("LC_TIME", "C")

library(jsonlite)
setwd("~/exports")

dm.logs.ubuntu <- fromJSON(txt = "tum-dm-fireb_data.json")

dm.logs.my.laptop <- data.frame(
  ac_connected_bool = logical(),
  brightness_percent = integer(),
  charging_bool = logical(),
  cpu_cores = integer(),
  cpu_usage_percent = integer(),
  discharging_bool = logical(),
  dm_enabled = logical(),
  download_kb = integer(),
  internet_connected = logical(),
  memory_mb = integer(),
  memory_percent = integer(),
  power_rate_w = integer(),
  read_kb_per_s = integer(),
  read_request_per_s = integer(),
  remaining_capacity_percent = integer(),
  remaining_time_minutes = integer(),
  time = numeric(),
  upload_kb = integer(),
  voltage_v = numeric(),
  wifi = logical(),
  write_kb_per_s = integer(),
  write_request_per_s = integer()
)

for (power.log in dm.logs.ubuntu$logging$`f4c65d10-25d2-11e7-81c6-5d3fcec29a5f`) {
  dm.logs.my.laptop <-
    rbind(
      dm.logs.my.laptop,
      data.frame(
        ac_connected_bool = power.log$ac_connected_bool,
        brightness_percent = power.log$brightness_percent,
        charging_bool = power.log$charging_bool,
        cpu_cores = power.log$cpu_cores,
        cpu_usage_percent = power.log$cpu_usage_percent,
        discharging_bool = power.log$discharging_bool,
        dm_enabled = power.log$dm_enabled,
        download_kb = power.log$download_kb,
        internet_connected = power.log$internet_connected,
        memory_mb = power.log$memory_mb,
        memory_percent = power.log$memory_percent,
        power_rate_w = power.log$power_rate_w,
        read_kb_per_s = power.log$read_kb_per_s,
        read_request_per_s = power.log$read_request_per_s,
        remaining_capacity_percent = power.log$remaining_capacity_percent,
        remaining_time_minutes = power.log$remaining_time_minutes,
        time = power.log$time,
        upload_kb = power.log$upload_kb,
        voltage_v = power.log$voltage_v,
        wifi = power.log$wifi,
        write_kb_per_s = power.log$write_kb_per_s,
        write_request_per_s = power.log$write_request_per_s
      )
    )
}

write.csv(dm.logs.my.laptop, "dm.logs.my.ubuntu.csv")
