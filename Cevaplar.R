####soru4

country_vaccination_stats <- read.csv("country_vaccination_stats (1).csv",header=T,sep=",")


country_vaccination_stats$country <- as.factor(country_vaccination_stats$country)
country_vaccination_stats$vaccines <- as.factor(country_vaccination_stats$vaccines)
country_vaccination_stats$daily_vaccinations <- as.numeric(country_vaccination_stats$daily_vaccinations)

meancountry <- aggregate(country_vaccination_statsi$daily_vaccinations, list(country_vaccination_stats$country), mean, na.rm=T)

allcountry<- levels(country_vaccination_stats$country)

for ( mycountry in allcountry) {
  
  country_vaccination_stats[country_vaccination_stats$country == mycountry & is.na(country_vaccination_stats$daily_vaccinations), "daily_vaccinations"] = 
    meancountry[meancountry$Group.1 == mycountry, "x"]
  
}

country_vaccination_stats[is.na(country_vaccination_stats$daily_vaccinations),"daily_vaccinations"]=0

####soru 6

specialday <- country_vaccination_stats[country_vaccination_stats$date == "1/6/2021",]
sum(specialday$daily_vaccinations)

###soru 7

#sql sorgusu 
#Select* 
#From[dbo][country_vaccination_statsi]
#Where daily_vaccinations like 'Na'

#Select daily_vaccinations,
#Replace( daily_vaccinations, 'Na') as (median(daily_vaccinations))
#From[dbo][country_vaccination_statsi]

# R çözümü
mediancountry <- aggregate(country_vaccination_statsi$daily_vaccinations, list(country_vaccination_stats$country), median, na.rm=T)

for ( mycountry in allcountry) {
  
  country_vaccination_stats[country_vaccination_stats$country == mycountry & is.na(country_vaccination_stats$daily_vaccinations), "daily_vaccinations"] = 
    mediancountry[mediancountry$Group.1 == mycountry, "x"]
  
}










