library(tidyverse)
library(lubridate)

#unzip("./exdata%2Fdata%2Fhousehold_power_consumption.zip")
#file.remove("./exdata%2Fdata%2Fhousehold_power_consumption.zip")

power <- read_delim("household_power_consumption.txt", 
                    delim = ";", 
                    na= "?") %>% 
  as_tibble %>%
  mutate(Date = dmy(Date)) %>% 
  filter(between(Date, ymd("2007-02-01"), ymd("2007-02-02")))

png(filename = "plot1.png", width = 480, height = 480, units = 'px')

plot(hist(power$Global_active_power), 
     col = 'red', 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()


file.remove("household_power_consumption.txt")
