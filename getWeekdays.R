# getWeekdays.R
# Purpose: Identify the day of the week for timestamps
# Nicole Zeng
# Latest review: 02/03/15
# Written : 02/03/15

# NOTE: working directory must contain the files "hourly.weather.pt.RData" and "hourly.weather.et.RData"
setwd("~/hbsdata")

# packages
require(timeDate)
# NOTE: for timeDate conversions, option zone is the recorded timezone, FinCenter is the desired timezone to convert output to.

# datasets
load("hourly.weather.pt.RData")
load("hourly.weather.et.RData")

# create weekday vector with timeDate object where zone and FinCenter are in correct timezone
weekday.pt <- dayOfWeek(timeDate(weather.pt$Time, FinCenter = "Los_Angeles", zone = "Los_Angeles"))
weekday.et <- dayOfWeek(timeDate(weather.et$Time, FinCenter = "New_York", zone = "New_York"))

# add weekday to weather data.frames
weather.pt$weekday <- weekday.pt
weather.et$weekday <- weekday.et

# save files
save(weather.pt, file="hourly.weather.pt.RData")
save(weather.et, file="hourly.weather.et.RData")
