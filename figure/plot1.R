library(dplyr)
data <- read.csv2("/Users/macbookpro/Desktop/Coursera_RProgramming/data/household_power_consumption.txt")
data <- subset(data, as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" |
                       as.Date(data$Date, "%d/%m/%Y") == "2007-02-02")
# change the factor to character first, then to numeric:
data[,3] <- as.numeric(as.character(data[,3]))

# check if there is a "?" in the column
is.element("?", data2[,3])

png(file="/Users/macbookpro/Documents/GitHub/ExData_Plotting1/figure/plot1.png",
    width=480, height=480)

hist(data$Global_active_power, freq = TRUE, col = "red", xaxt = "none",
              main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
              ylab = "Frequency", xlim=c(0,6) )

axis(1, at = seq(0,6,2), labels = c("0","2","4","6"))

dev.off()
