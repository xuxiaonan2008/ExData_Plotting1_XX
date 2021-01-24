# plot 4:
library(dplyr)
# no string as Factors!
row_data <- read.csv2("/Users/macbookpro/Desktop/Coursera_RProgramming/data/household_power_consumption.txt",
                      stringsAsFactors=FALSE)

tidydata <- row_data %>% filter(Date == "1/2/2007" | Date == "2/2/2007") 

# I haven't figured out why the code "tidydata[,3:9] <- as.numeric(tidydata[,3:9])" doesn't work.
# So for now I have to do the trasform one column by another:

tidydata$Global_active_power <- as.numeric(tidydata$Global_active_power)
tidydata$Global_reactive_power <- as.numeric(tidydata$Global_reactive_power)
tidydata$Voltage <- as.numeric(tidydata$Voltage)
tidydata$Sub_metering_1 <- as.numeric(tidydata$Sub_metering_1)
tidydata$Sub_metering_1 <- as.numeric(tidydata$Sub_metering_1)
tidydata$Sub_metering_2 <- as.numeric(tidydata$Sub_metering_2)
tidydata$Sub_metering_3 <- as.numeric(tidydata$Sub_metering_3)

tidydata2 <- tidydata %>% select("Date","Time","Sub_metering_1","Sub_metering_2", "Sub_metering_3")

png(file="/Users/macbookpro/Documents/GitHub/ExData_Plotting1/figure/plot4.png",width=480, height=480)

par(mfrow=c(2,2))

# plot top left:
plot(tidydata$Global_active_power, type = "l", lty = 1,
     xaxt="none", ylab = "Global Active Power", xlab ="")
axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))

# plot top right:
plot(tidydata$Voltage, type = "l", lty = 1,
     xaxt="none", ylab = "Global Active Power", xlab ="")
axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))

# plot bottom left:
matplot(tidydata2, type = "l", lty = 1, col = c("red", "blue", "black"),
        xaxt="none", ylab = "Energy sub metering", xlab ="")
axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, cex = 1)

# plot bottom right:
plot(tidydata$Global_reactive_power, type = "l", lty = 1,
     xaxt="none", ylab = "Global Reactive Power", xlab ="")
axis(1, at = seq(0,2900,1450), labels = c("Thu","Fri","Sat"))

dev.off()
