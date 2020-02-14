#Reads in .csv file as data1 variable
data1<-read.csv("homo_lumo.csv")

#Parse each column for each method
dataX=data1[,1]
dataRPA=data1[,2]
dataMP2=data1[,3]
dataSCS_MP2=data1[,4]
dataSOS_MP2=data1[,5]

#Creates environment for high resolution png files
postscript("homo_lumo_compare.eps", width= 3.25, height = 2.25, paper="special", horizontal=FALSE)

par(mfrow=c(1,1),mar=c(2,2,1,1))
#Beginning of the Scatterplot 
plot(dataX,dataMP2,pch=1,col='black',lwd=1,cex=0.5,
     xlab='',ylab='',xaxt='n',xlim=c(0,16),yaxt='n',ylim=c(0,180),cex.lab=0.7,cex.axis=0.7)

title(xlab='HOMO-LUMO Gap (eV)',cex.lab=0.65,line=0.65)
title(ylab=expression(paste(Delta,italic(E),' (%)')),cex.lab=0.65,line=1.2)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,17,17),cex.axis=0.7,col=NA,line=-1)
axis(1,xaxp=c(0,17,17),label=FALSE,tck=-0.03)
axis(2,yaxp=c(0,300,10),cex.axis=0.6,col=NA,las=2,line=-0.65)
axis(2,yaxp=c(0,300,20),label=FALSE,tck=-0.03)


#Plots SCS_MP2 and RPA datapoints
points(dataX,dataSCS_MP2,pch=22,col="red",cex=0.5,lwd=1)
points(dataX,dataSOS_MP2,pch=13,col="orange",cex=0.5,lwd=1)
points(dataX,dataRPA,pch=6,col="blue",cex=0.5,lwd=1)

#Legend
legend('topleft',c("MP2","SCS-MP2","SOS-MP2","RPA(PBE)"),
       cex=0.7,col=c("black","red","orange","blue"),
       pch=c(1,22,13,6),bty='n',pt.cex=0.7,
       lwd=1,inset=c(0.02,-0.01))
dev.off()

