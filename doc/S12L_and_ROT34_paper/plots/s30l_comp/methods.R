#Reads in .csv file as data1 variable
data1<-read.csv("s30l_kcal.csv")

#Parse each column for each method
dataX=data1[,1]
dataRPA=data1[,2]
dataMP2=data1[,3]
dataSCS_MP2=data1[,4]
dataSOS_MP2=data1[,5]
dataPBE_D3=data1[,6]

#Creates environment for high resolution png files
#jpeg("s30l_compare2.jpg", width = 9.9, height = 4.40, units = 'in', res = 600)
postscript("s30l_compare2.eps", width = 11, height = 4.40,paper="special",horizontal=FALSE)
#png('s30l_compare.png',width=7, height = 4.4, units = 'in', res = 600)
#old width = 9.9
par(mfrow=c(1,1),mar=c(2.2,3,1,1))
#Beginning of the Scatterplot 
plot(dataX,dataMP2,pch=1,col="black",lwd=1.4,type="o",cex=0.9,
     xlab='',ylab='',lty=1,yaxt="n",xaxt="n",ylim=c(-75,28),
     cex.lab=0.5,cex.axis=0.5)

title(xlab='S30L Complexes',line=1,cex.lab=1)
title(ylab=expression(paste(Delta,italic(E),' (kcal/mol)')),line=1.8,cex.lab=1)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(1,30,29),cex.axis=0.9,col=NA,line=-0.9)
axis(1,xaxp=c(1,30,29),label=FALSE,tck=-0.01)
axis(2,yaxp=c(-75,75,10),cex.axis=0.9,col=NA,line=-0.5,las=2)
axis(2,yaxp=c(-75,75,20),label=FALSE,tck=-0.01)

abline(h=0,lwd=0.9)

#Plots SCS_MP2 and RPA datapoints
lines(dataSCS_MP2,type="o",pch=22,col="red",cex=0.9,lwd=1.4,lty=22)
lines(dataSOS_MP2,type="o",pch=13,col="orange",cex=0.9,lwd=1.4,lty=13)
lines(dataRPA,type="o",pch=6,col="blue",cex=0.9,lwd=1.4,lty=6)
lines(dataPBE_D3,type="o",pch=10,col="magenta",cex=0.9,lwd=1.4,lty=8)

#Legend
legend("topleft",c("MP2","SCS-MP2","SOS-MP2","RPA(PBE)","PBE-D3"),
       cex=1,col=c("black","red","orange","blue","magenta"),
       pch=c(1,22,13,6,10),lty=c(1,2,4,3,8), bty='n',pt.cex=1,
       lwd=1.5,inset=c(0.02,-0.01),ncol=2)

#Creates an inset plot
#par(fig = c(0.5, 0.99,0.1, 0.58),new=T)
#plot(dataX,dataSOS_MP2,type="o",pch=13,col="orange",cex=0.5,lwd=1.2,lty=13,
#     yaxt="n",xaxt="n",xlim=c(25,30),ylim=c(-50,260),ann=FALSE)
#
#abline(h=0,lwd=0.9)
#
#lines(dataMP2,pch=1,type="o",lty=1,col="black",cex=0.5,lwd=1.2)
#lines(dataSCS_MP2,type="o",pch=22,col="red",cex=0.5,lwd=1.2,lty=22)
#lines(dataRPA,type="o",pch=6,col="blue",cex=0.5,lwd=1.2,lty=6)
#
#axis(1,xaxp=c(1,30,29),cex.axis=0.9,col=NA,line=-0.8)
#axis(1,xaxp=c(1,30,29),label=FALSE,tck=-0.04)
#axis(2,yaxp=c(-50,300,7),cex.axis=0.9,col=NA,line=-0.6,las=2)
#axis(2,yaxp=c(-50,300,7),label=FALSE,tck=-0.04)

dev.off()

