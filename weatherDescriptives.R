# weatherDescriptives.R
# Purpose: Describe weather data
# Nicole Zeng
# Latest review: 10/19/14
# Written : 10/19/14

# libraries
require(ggplot2)
require(weatherData)
require(data.table)

# datasets
load("~/00serverfiles/downloaded/daily.weather.dt.RData")
SEA <- copy(weather)[metro=="SEA"]
ATL <- copy(weather)[metro=="ATL"]
PHIL <- copy(weather)[metro=="PHIL"]
SEA <- copy(weather)[metro=="SEA"]

# Temperature range
weather[, temp.range:=abs(Max_TemperatureF - Min_TemperatureF)]
SF[, temp.range:=abs(Max_TemperatureF - Min_TemperatureF)]
SEA[, temp.range:=abs(Max_TemperatureF - Min_TemperatureF)]
ATL[, temp.range:=abs(Max_TemperatureF - Min_TemperatureF)]
PHIL[, temp.range:=abs(Max_TemperatureF - Min_TemperatureF)]

# SF
jpeg(filename="max.temp.SF.jpg")
qplot(SF$date, SF$Max_TemperatureF, main="Max Temp in SF")
dev.off()
jpeg(filename="mean.temp.SF.jpg")
qplot(SF$date, SF$Mean_TemperatureF, main="Mean Temp in SF")
dev.off()
jpeg(filename="min.temp.SF.jpg")
qplot(SF$date, SF$Min_TemperatureF, main="Min Temp in SF")
dev.off()
jpeg(filename="rain.SF.jpg")
qplot(SF$date, SF$Rainfall, main="Rainfall in SF")
dev.off()
jpeg(filename="clouds.SF.jpg")
qplot(SF$date, SF$CloudCover, main="Cloud Cover in SF")
dev.off()
jpeg(filename="windspeed.SF.jpg")
qplot(SF$date, SF$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in SF")
dev.off()

# ATL
jpeg(filename="max.temp.ATL.jpg")
qplot(ATL$date, ATL$Max_TemperatureF, main="Max Temp in ATL")
dev.off()
jpeg(filename="mean.temp.ATL.jpg")
qplot(ATL$date, ATL$Mean_TemperatureF, main="Mean Temp in ATL")
dev.off()
jpeg(filename="min.temp.ATL.jpg")
qplot(ATL$date, ATL$Min_TemperatureF, main="Min Temp in ATL")
dev.off()
jpeg(filename="rain.ATL.jpg")
qplot(ATL$date, ATL$Rainfall, main="Rainfall in ATL")
dev.off()
jpeg(filename="clouds.ATL.jpg")
qplot(ATL$date, ATL$CloudCover, main="Cloud Cover in ATL")
dev.off()
jpeg(filename="windspeed.ATL.jpg")
qplot(ATL$date, ATL$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in ATL")
dev.off()


# PHIL
jpeg(filename="max.temp.PHIL.jpg")
qplot(PHIL$date, PHIL$Max_TemperatureF, main="Max Temp in PHIL")
dev.off()
jpeg(filename="mean.temp.PHIL.jpg")
qplot(PHIL$date, PHIL$Mean_TemperatureF, main="Mean Temp in PHIL")
dev.off()
jpeg(filename="min.temp.PHIL.jpg")
qplot(PHIL$date, PHIL$Min_TemperatureF, main="Min Temp in PHIL")
dev.off()
jpeg(filename="rain.PHIL.jpg")
qplot(PHIL$date, PHIL$Rainfall, main="Rainfall in PHIL")
dev.off()
jpeg(filename="clouds.PHIL.jpg")
qplot(PHIL$date, PHIL$CloudCover, main="Cloud Cover in PHIL")
dev.off()
jpeg(filename="windspeed.PHIL.jpg")
qplot(PHIL$date, PHIL$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in PHIL")
dev.off()

# SEA
jpeg(filename="max.temp.SEA.jpg")
qplot(SEA$date, SEA$Max_TemperatureF, main="Max Temp in SEA")
dev.off()
jpeg(filename="mean.temp.SEA.jpg")
qplot(SEA$date, SEA$Mean_TemperatureF, main="Mean Temp in SEA")
dev.off()
jpeg(filename="min.temp.SEA.jpg")
qplot(SEA$date, SEA$Min_TemperatureF, main="Min Temp in SEA")
dev.off()
jpeg(filename="rain.SEA.jpg")
qplot(SEA$date, SEA$Rainfall, main="Rainfall in SEA")
dev.off()
jpeg(filename="clouds.SEA.jpg")
qplot(SEA$date, SEA$CloudCover, main="Cloud Cover in SEA")
dev.off()
jpeg(filename="windspeed.SEA.jpg")
qplot(SEA$date, SEA$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in SEA")
dev.off()

# Wind Direction in Degress
jpeg(filename="wind.dir.SF.jpg")
qplot(SF$date, SF$WindDirDegrees, main="Wind Direction (Degrees) in SF")
dev.off()
jpeg(filename="wind.dir.SEA.jpg")
qplot(SEA$date, SEA$WindDirDegrees, main="Wind Direction (Degrees) in SEA")
dev.off()
jpeg(filename="wind.dir.ATL.jpg")
qplot(ATL$date, ATL$WindDirDegrees, main="Wind Direction (Degrees) in ATL")
dev.off()
jpeg(filename="wind.dir.PHIL.jpg")
qplot(PHIL$date, PHIL$WindDirDegrees, main="Wind Direction (Degrees) in PHIL")
dev.off()

# Mean Humidity
jpeg(filename="mean_humidity.SF.jpg")
qplot(SF$date, SF$Mean_Humidity, main="Mean Humidity in SF")
dev.off()
jpeg(filename="mean_humidity.SEA.jpg")
qplot(SEA$date, SEA$Mean_Humidity, main="Mean Humidity in SEA")
dev.off()
jpeg(filename="mean_humidity.ATL.jpg")
qplot(ATL$date, ATL$Mean_Humidity, main="Mean Humidity in ATL")
dev.off()
jpeg(filename="mean_humidity.PHIL.jpg")
qplot(PHIL$date, PHIL$Mean_Humidity, main="Mean Humidity in PHIL")
dev.off()

# Max Gust SpeedMPH
jpeg(filename="max_gust.SF.jpg")
qplot(SF$date, SF$Max_Gust_SpeedMPH, main="Max Gust Speed (MPH) in SF")
dev.off()
jpeg(filename="max_gust.SEA.jpg")
qplot(SEA$date, SEA$Max_Gust_SpeedMPH, main="Max Gust Speed (MPH) in SEA")
dev.off()
jpeg(filename="max_gust.ATL.jpg")
qplot(ATL$date, ATL$Max_Gust_SpeedMPH, main="Max Gust Speed (MPH) in ATL")
dev.off()
jpeg(filename="max_gust.PHIL.jpg")
qplot(PHIL$date, PHIL$Max_Gust_SpeedMPH, main="Max Gust Speed (MPH) in PHIL")
dev.off()

# Mean Dew Point
jpeg(filename="mean.dew.SF.jpg")
qplot(SF$date, SF$MeanDew_PointF, main="Mean Dew Point in SF")
dev.off()
jpeg(filename="mean.dew.SEA.jpg")
qplot(SEA$date, SEA$MeanDew_PointF, main="Mean Dew Point in SEA")
dev.off()
jpeg(filename="mean.dew.ATL.jpg")
qplot(ATL$date, ATL$MeanDew_PointF, main="Mean Dew Point in ATL")
dev.off()
jpeg(filename="mean.dew.PHIL.jpg")
qplot(PHIL$date, PHIL$MeanDew_PointF, main="Mean Dew Point in PHIL")
dev.off()
# Mean Visibility Miles
jpeg(filename="mean.visib.SF.jpg")
qplot(SF$date, SF$Mean_VisibilityMiles, main="Mean Visibility (Miles) in SF")
dev.off()
jpeg(filename="mean.visib.SEA.jpg")
qplot(SEA$date, SEA$Mean_VisibilityMiles, main="Mean Visibility (Miles) in SEA")
dev.off()
jpeg(filename="mean.visib.ATL.jpg")
qplot(ATL$date, ATL$Mean_VisibilityMiles, main="Mean Visibility (Miles) in ATL")
dev.off()
jpeg(filename="mean.visib.PHIL.jpg")
qplot(PHIL$date, PHIL$Mean_VisibilityMiles, main="Mean Visibility (Miles) in PHIL")
dev.off()
# Mean Wind Speed
jpeg(filename="mean.wind.speed.SF.jpg")
qplot(SF$date, SF$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in SF")
dev.off()
jpeg(filename="mean.wind.speed.SEA.jpg")
qplot(SEA$date, SEA$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in SEA")
dev.off()
jpeg(filename="mean.wind.speed.ATL.jpg")
qplot(ATL$date, ATL$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in ATL")
dev.off()
jpeg(filename="mean.wind.speed.PHIL.jpg")
qplot(PHIL$date, PHIL$Mean_Wind_SpeedMPH, main="Mean Wind Speed (MPH) in PHIL")
dev.off()
# Temp Range
jpeg(filename="temp.range.SF.jpg")
qplot(SF$date, SF$temp.range, main="Temperature Range in SF")
dev.off()
jpeg(filename="temp.range.SEA.jpg")
qplot(SEA$date, SEA$temp.range, main="Temperature Range in SEA")
dev.off()
jpeg(filename="temp.range.ATL.jpg")
qplot(ATL$date, ATL$temp.range, main="Temperature Range in ATL")
dev.off()
jpeg(filename="temp.range.PHIL.jpg")
qplot(PHIL$date, PHIL$temp.range, main="Temperature Range in PHIL")
dev.off()


# Can delete below if sharing!
# save files
save(SF, SEA, ATL, PHIL, file="~/00serverfiles/downloaded/daily.weather.dt.separate.RData")
print("Done with script!")
