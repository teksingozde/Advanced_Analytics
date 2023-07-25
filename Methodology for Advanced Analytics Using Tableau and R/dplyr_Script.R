install.packages("dplyr")
install.packages("rCharts")
install.packages("RColorBrewer")
install.packages("WDI")
install.packages("countrycode")
install.packages("reshape")

library(reshape)
library(dplyr)
library(rCharts)
library(RColorBrewer)
library(countrycode)
library(WDI)


dat <- read.csv("WPP2015_POP_F01_1_TOTAL_POPULATION_BOTH_SEXES.csv")
summary(dat)
head(dat)

#regions <- c("Africa", "Latin America and the Caribbean", "Northern America", "Europe", "Oceania", "Asia")

#variants <- c("Low", "Medium", "High", "Constant fertility")

# c_codes<-read.csv("http://data.okfn.org/data/core/country-list/r/data.csv")
# summary(c_codes)
# head(c_codes)
# dim(c_codes)

rename(dat, Code = Country.code)

# filter
# filter(flights, month == 1 | month == 2)
# It is more clear wht we are trying to do. Intuitive.
filter(dat, Major.area..region..country.or.area.. == "WORLD")

# We can slice rows by position
slice(dat, 1:3)

# verbose R
# flights[flights$month == 1 & flights$day == 1, ]
dat[dat$Major.area..region..country.or.area.. == "WORLD"]

# arrange reorders them
# arrange(flights, year, month, day) could be used when it's pivoted
# In this case, we get the data in Country Code order.
arrange(dat, Country.code)

# We could also do this in descending order
arrange(dat, desc(Country.code))

# You can rename variables with select() by using named arguments:
select(dat,Index,Variant,region=Major.area..region..country.or.area.., Notes, Countrycode=Country.code )

# But because select() drops all the variables not explicitly mentioned, it's not that useful. Instead, use rename():
rename(dat,Index=Index,Variant=Variant,region=Major.area..region..country.or.area.., Notes=Notes, Countrycode=Country.code )

# A common use of select() is to find the values of a set of variables. 
# This is particularly useful in conjunction with the distinct() verb which only returns the unique values in a table.
sampledat <- distinct(select(dat,Index,Variant,region=Major.area..region..country.or.area.., Notes, Countrycode=Country.code, X2015=X2015, X2016=X2016, X2017=X2017 ) )
head(sampledat)


