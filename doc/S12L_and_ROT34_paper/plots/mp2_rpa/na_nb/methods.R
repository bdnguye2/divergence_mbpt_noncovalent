#Reads in mp2_rpa.csv file as data1 variable
data1<-read.csv("elec_prod.csv")

#Parse each column for each method
dataX=data1[,1]/100
dataRPA=data1[,2]
dataMP2=data1[,3]
dataSCS_MP2=data1[,4]

#Creates environment for high resolution png files
#png("mp2_rpa_elect.png", width = 9, height = 6.25, units = 'in', res = 300)
postscript("mp2_rpa_elect.eps", width = 9, height = 6.25, paper="special", horizontal=FALSE)

par(mfrow=c(1,1),mar=c(5,5,2,2))
#Beginning of the Scatterplot 
plot(dataX,dataMP2,pch=1,col="black",lwd=2,
     xlab='',ylab='',
     xaxt="n",ylim=c(0,75),yaxt="n",cex.lab=1.4,cex.axis=1.4)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,800,20),cex.axis=1.4)
title(xlab=expression('N'[a]*' x N'[b]*' (x100)'),cex.lab=1.4,line=3.2)

#Defining the y-axis scale and ticks
axis(2,yaxp=c(0,150,10),cex.axis=1.4,las=1)
axis(2,yaxp=c(0,150,20),label=FALSE,tck=-0.02)
title(ylab=expression(paste('|',Delta,italic(E),'| (kcal/mol)')),cex.lab=1.4,line=3.2)

#Plots SCS_MP2 and RPA datapoints
points(dataX,dataSCS_MP2,pch=22,col="red",cex=1.5,lwd=2)
points(dataX,dataRPA,pch=6,col="blue",cex=1.5,lwd=2)

#Adds trendline for each set using linear regression
abline(lm(dataMP2 ~ dataX),reg,col="black",lty=1,lwd=2)
abline(lm(dataSCS_MP2 ~ dataX),col="red",lty=2,lwd=2)
abline(lm(dataRPA ~ dataX),col="blue",lty=3,lwd=2)

#Legend
legend("topleft",c("MP2","SCS-MP2","RPA(PBE)"),
       cex=1.2,col=c("black","red","blue"),
       pch=c(1,22,6),lty=c(1,2,3),bty='n',pt.cex=1.5,
       lwd=2,inset=c(0.02,-0.01))
dev.off()

