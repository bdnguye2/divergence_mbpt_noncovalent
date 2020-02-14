#Reads in mp2_rpa.csv file as data1 variable
data1<-read.csv("correl_int.csv")

#Parse each column for each method
dataX=data1[,1]
dataRPA=data1[,2]
dataMP2=data1[,3]

#Creates environment for high resolution png files
#png("mp2_rpa_signed.png", width = 3.25, height = 2.25, units = 'in', res = 600)
postscript("mp2_rpa_signed.eps", width = 3.25, height = 2.25, paper = "special", horizontal = FALSE)

par(mfrow=c(1,1),mar=c(1.75,2.2,0.8,0.8))
#Beginning of the Scatterplot 
plot(dataX,dataMP2,pch=1,col="black",lwd=0.7,cex=0.4,
     xlab='',ylab='',xaxt="n",yaxt="n",ylim=c(-175,0))

title(xlab='Number of Valence Electrons',cex.lab=0.65,line=0.65)
title(ylab=expression(paste(Delta,italic(E^C),' (kcal/mol)')),cex.lab=0.65,line=1.25)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,900,9),cex.axis=0.6,col=NA,line=-1)
axis(1,xaxp=c(0,900,9),label=FALSE,tck=-0.03)
axis(2,yaxp=c(0,-175,7),cex.axis=0.6,col=NA,las=2,line=-0.65)
axis(2,yaxp=c(0,-175,7),label=FALSE,tck=-0.03)

abline(h=0,lwd=0.7)

#Plots SCS_MP2 and RPA datapoints
points(dataX,dataRPA,pch=6,col="blue",cex=0.4,lwd=0.7)

#Adds trendline for each set using linear regression
#abline(lm(dataMP2 ~ dataX),reg,col="black",lty=1,lwd=0.75,cex=0.5)
#abline(lm(dataRPA ~ dataX),col="blue",lty=3,lwd=0.75,cex=0.5)

#Legend
legend("bottomleft",c("MP2","RPA(PBE)"),
       cex=0.6,col=c("black","blue"),
       pch=c(1,6),lty=c(1,3),bty='n',pt.cex=0.6,
       lwd=1,inset=c(0.02,-0.01))
dev.off()

