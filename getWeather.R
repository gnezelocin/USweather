# getWeather.R
# Purpose: Gather Weather Underground's historical weather data for top cities by user
#		counts in demog2.
# Nicole Zeng
# Latest: 02/03/2015 
# Written : 09/22/2014

# NOTE: I set my working directory to ~/hbsdata
setwd("~/hbsdata")

# libraries
require(weatherData)
require(plyr)

# Note: All cities get "zoned" to an airport code.
  # I checked, and WU stores historical data by airport code, but not specific city
  # First, I gathered by hand all airport codes for the cities needed.

# Code for gathering weather station codes: (Not run)
# getStationCode("cityname", region="2-letter state code")

# create list of all airport codes, separate vector for each timezone. Used later with weatherData package.
tz_ny <- c("KLOM", "KPHL", "KLZU", "KATL", "KAHN")
tz_la <- c("KSFO", "KPAO", "KOAK", "KDVO", "KSEA", "KPAE", "KTCM", "KVUO")
start <- "2013-09-01"
end <- "2013-11-20"


# function to make life easier for weather scraping
getWeather <- function (city_code, start, end) {
	wdf <- getWeatherForDate(city_code, start_date=start, end_date=end,
						opt_detailed=TRUE,
						opt_all_columns=TRUE)
	# add one column to identify the airport code.
	wdf$Station <- city_code
	return(wdf)
}

# Get weather data for 2013-09-01 to 2013-12-01 for all stations in Pacific Time Zones.
weather.pt <- ldply(tz_la, getWeather, start, end)
weather.et <- ldply(tz_ny, getWeather, start, end)

# Save files
save(weather.pt, file = "hourly.weather.pt.RData")
save(weather.et, file = "hourly.weather.et.RData")


