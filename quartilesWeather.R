# File: quartilesWeather.R
# Purpose: Split up weather into conditions for testing. 
# Date: 10/18/14
# Updated: 10/25/14
# Creator: Nicole Zeng

# Steps: 
  # 1. Use hourly weather data.
  # 2. There are 2 columns with weather details, wt$Events and wt$Conditions. 
  # We will create new column that has both Events and Conditions. 
  # 3. Then, we will break these conditions into dummy columns. 

# packages:
require(data.table)
require(stringr)
require(plyr)

# data:
load("~/00serverfiles/downloaded/hourly.weather.dt.RData") # name of dt is "weather.cities". Let's rename it for convenience.
wt = weather.cities
remove(weather.cities)

# Clean up
wt$wt.utc.char <- as.character(wt$DateUTC)
wt$DateUTC <- NULL
wt$DateUTC <- as.POSIXct(wt$wt.utc.char, origin="1970-01-01", tz="UTC")
wt$wt.time.there <- as.character(wt$Time)
wt$Time <-NULL
wt$datetime <- NULL

wt <- as.data.table(wt)
drop=c("TimeEDT", "TimeEST", "TimePDT", "TimePST", "Gust_SpeedMPH", "Sea_Level_PressureIn", "Dew_PointF", "VisibilityMPH", "Wind_Direction", "WindDirDegrees", "Wind_SpeedMPH")
wt[, (drop):=NULL]

# Order the columns
setcolorder(wt, c("DateUTC", "Station", "date", "wt.time.there", "Conditions", "Events", "Rainfall", "Humidity", "TemperatureF", "wt.utc.char"))

# subset only dates before 11/20/13
wt1 = copy(wt)[date < "2013-11-20"]
remove(wt)
wt = wt1
remove(wt1)

# Create new column with both wt$Events and wt$Conditions
wt[, both:=paste(Conditions, Events)]
wt[, both:=str_trim(both, side="both")]
wt[, Conditions:=NULL]
wt[, Events:=NULL]

# Create lists of conditions. 
  # Note: I created a count list of the unique values in newly 
  # created wt$both, copy/pasted in excel, and marked the dummies. 
cl=c("Mostly Cloudy", "Mostly Cloudy Fog", "Mostly Cloudy NA", "Mostly Cloudy Thunderstorm", "Overcast", "Overcast Fog", "Overcast NA")
rn=c("Heavy Rain Fog-Rain", "Heavy Rain Rain", "Heavy Rain Rain-Thunderstorm", "Heavy Thunderstorms and Rain Fog-Rain-Thunderstorm", "Heavy Thunderstorms and Rain Rain-Thunderstorm", "Light Rain Fog-Rain", "Light Rain Fog-Rain-Thunderstorm", "Light Rain Rain", "Light Rain Rain-Thunderstorm", "Light Thunderstorms and Rain Rain-Thunderstorm", "Overcast Thunderstorm", "Rain Fog-Rain", "Rain Rain", "Rain Rain-Thunderstorm", "Scattered Clouds Thunderstorm", "Thunderstorm Thunderstorm", "Thunderstorms and Rain Rain-Thunderstorm")
sn=c("Clear", "Clear NA")
ltrn=c("Drizzle", "Light Drizzle", "Light Drizzle NA", "Mist", "Mist NA")
ltcl=c("Partly Cloudy", "Partly Cloudy Fog", "Partly Cloudy NA", "Scattered Clouds", "Scattered Clouds Fog", "Scattered Clouds NA")
fg=c("Fog Fog", "Haze", "Haze NA", "Light Freezing Fog Fog", "Patches of Fog Fog", "Shallow Fog Fog")
oth=c("Clear Fog", "Unknown", "Unknown NA", "Unknown Thunderstorm")
snw=c("Light Snow Rain-Snow", "Light Snow Snow")

# Create weather condition dummies
wt[, cloud:=both %in% (cl)]
wt[, rain:=both %in% (rn)]
wt[, snow:=both %in% (snw)]
wt[, l.cloud:=both %in% (ltcl)]
wt[, l.rain:=both %in% (ltrn)]
wt[, fog:=both %in% (fg)]
wt[, wt.other:=both %in% (oth)]
wt[, sunny:=both %in% (sn)]

# Check counts
table(wt$cloud)
table(wt$rain)
table(wt$snow)
table(wt$l.cloud)
table(wt$l.rain)
table(wt$fog)
table(wt$wt.other)
table(wt$sunny)
# all checked out!
setnames(wt, "both", "wt.conditions")
setnames(wt, "Humidity", "hr.humidity")
setnames(wt, "TemperatureF", "hr.temp")
setnames(wt, "Rainfall", "hr.rainfall")
setnames(wt, "Station", "station")
setnames(wt, "DateUTC", "utc")

# load daily weather to merge averages with wt
wt.hr = wt # bc daily weather is also called wt
remove(wt)
load("daily.weather.wk.RData") # also called wt 
d.wt = wt
remove(wt)
wt = wt.hr
remove(wt.hr)

# clean daily weather for averages
setnames(d.wt, "Station", "station")
setnames(d.wt, "Mean_Humidity", "d.humidity")
setnames(d.wt, "CloudCover", "d.cloudcover")
setnames(d.wt, "City", "city")
setnames(d.wt, "Postal.list", "postal.list")
setnames(d.wt, "temp.range", "d.temprange")
d.wt[, State:=NULL]


# Order the columns
setcolorder(wt, c("station", "date", "utc", "wt.time.there", "wt.utc.char", "wt.conditions", "hr.rainfall", "hr.humidity", "hr.temp", "rain", "sunny", "cloud", "l.rain", "l.cloud", "fog", "wt.other", "snow"))

# merge
wt <- merge(wt, d.wt, by=c("station", "date"), all.x=TRUE)
remove(d.wt)

# save
save(wt, file="hourly.weather.wk.RData")
