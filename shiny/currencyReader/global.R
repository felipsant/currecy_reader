#install.packages("tidyr")
library(RMySQL) 
library(DBI)
library(tidyr)

# Connect to the MySQL database: con
con <- dbConnect(RMySQL::MySQL(),dbname="santiagodb",host="mariadb",port=3306,user="",password="")


currencyData <- dbGetQuery(con, "select cu.code, 
                                    	   cv.timestamp, 
                                    	   cv.value
                                    	   from currency cu 
                                    	   join currency_value cv on cv.currencyId = cu.id
                                    	   where cu.stopGetValue is NULL
                                    	   union 
                                    	   select 'USD',  
                                    	   cv.timestamp,
                                    	   1.0
                                    	   from currency cu 
                                         join currency_value cv on cv.currencyId = cu.id and cu.code = 'USD'
                                    	   order by code;")
dbDisconnect(con)
currencyCodes <- unique(currencyData$code)
currencyData <- spread(currencyData, code, value)
currencyData$timestamp <- as.Date(currencyData$timestamp)





