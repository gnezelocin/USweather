# setDaylightHours.R
# Purpose: Create dummy variable in data.frame for daylight hours.
# Nicole Zeng
# Latest review: 2015-02-03
# Written : 2015-02-03

# NOTE: working directory must contain the files "hourly.weather.pt.RData" and "hourly.weather.et.RData"
setwd("~/hbsdata")

# packages:
require(stringr)

# datasets
load("hourly.weather.pt.RData")
load("hourly.weather.et.RData")

# For simplicity, I'll set awake hours to local time 9am-4pm
awake.hours <- c(9:16)
weather.pt$hour <- hour(weather.pt$Time)
weather.pt$awake <- as.logical(weather.pt$hour %in% awake.hours)
weather.et$hour <- hour(weather.et$Time)
weather.et$awake <- as.logical(weather.et$hour %in% awake.hours)


# save files
save(weather.pt, file="hourly.weather.pt.RData")
save(weather.et, file="hourly.weather.et.RData")

