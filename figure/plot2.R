# plot 2:
library(dplyr)
library(lubridate)
# no string as Factors!
data <- read.csv2("/Users/macbookpro/Desktop/Coursera_RProgramming/data/household_power_consumption.txt",
                  stringsAsFactors=FALSE)

# change the factor to character first, then to numeric:
data[,3] <- as.numeric(data[,3])

data <- data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
        select(Date, Time, Global_active_power) 

png(file="/Users/macbookpro/Documents/GitHub/ExData_Plotting1/figure/plot2.png",
    width=480, height=480)

plot(data$Global_active_power, type = "l", xaxt="none",
              ylab = "Global Active Power (kilowatts)", xlab ="")
axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))

dev.off()
