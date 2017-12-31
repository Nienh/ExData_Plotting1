##Course 4 Project: Plot 3##

#***Part I: Read and Tidy Data***

    ##Read data and subset for February 1, 2017 and February 2, 2017
    epc_feb<- subset(read.table("household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors = FALSE),
                     Date=="1/2/2007" | Date=="2/2/2007")
    
    ##Create DateTime field bu combining Date and Time, format as date
    epc_feb$DateTime <- paste(epc_feb$Date,epc_feb$Time, sep=" ")
    epc_feb$DateTime <- strptime(epc_feb$DateTime,"%d/%m/%Y %H:%M:%S")
    
    ##Format all other columns as numeric
    epc_feb[,c(3:9)] <- as.numeric(unlist(epc_feb[,c(3:9)]))

#***Part II:  Plot 3***

    ##set up png file
    png(file="plot3.png", width=480, height=480)
    
    ##Create plot 3
    par(mfrow=c(1,1))
    with(epc_feb, plot(DateTime,Sub_metering_1, 
                       type = "l",
                       xlab = "",
                       ylab = "Energy sub metering"))
    with(epc_feb, points(DateTime,Sub_metering_2, type = "l", col = "red"))
    with(epc_feb, points(DateTime,Sub_metering_3, type = "l", col = "blue"))
    
    ##Add legend
    legend("topright", 
           lwd = 1, 
           col = c("black","red","blue"), 
           cex = 0.75,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ##close png
    dev.off()