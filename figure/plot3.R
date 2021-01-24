# plot 3:
library(dplyr)
# no string as Factors!
row_data <- read.csv2("/Users/macbookpro/Desktop/Coursera_RProgramming/data/household_power_consumption.txt",
                  stringsAsFactors=FALSE)

tidydata <- row_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  select(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3)

tidydata$Sub_metering_1 <- as.numeric(tidydata$Sub_metering_1)
tidydata$Sub_metering_2 <- as.numeric(tidydata$Sub_metering_2)
tidydata$Sub_metering_3 <- as.numeric(tidydata$Sub_metering_3)

png(file="/Users/macbookpro/Documents/GitHub/ExData_Plotting1/figure/plot3.png",width=480, height=480)

matplot(tidydata, type = "l", lty = 1, col = c("red", "blue", "black"),
        xaxt="none", ylab = "Energy sub metering", xlab ="")

axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 1)

dev.off()
