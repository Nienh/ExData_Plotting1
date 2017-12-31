##Course 4 Project: Plot 1##

#***Part I: Read and Tidy Data***

    ##Read data and subset for February 1, 2017 and February 2, 2017
    epc_feb<- subset(read.table("household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors = FALSE),
                     Date=="1/2/2007" | Date=="2/2/2007")
    
    ##Create DateTime field bu combining Date and Time, format as date
    epc_feb$DateTime <- paste(epc_feb$Date,epc_feb$Time, sep=" ")
    epc_feb$DateTime <- strptime(epc_feb$DateTime,"%d/%m/%Y %H:%M:%S")
    
    ##Format all other columns as numeric
    epc_feb[,c(3:9)] <- as.numeric(unlist(epc_feb[,c(3:9)]))

#***Part II:  Plot 1***

    ##set up png file
    png(file="plot1.png", width=480, height=480)
    
    ##create histogram
    par(mfrow=c(1,1))
    hist(epc_feb$Global_active_power, 
         col="red", 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", 
         ylab="Frequency")
    
    ##close png
    dev.off()