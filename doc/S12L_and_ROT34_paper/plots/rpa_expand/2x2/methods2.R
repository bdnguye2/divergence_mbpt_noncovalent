#Reads in .csv file as data1 variable
data1<-read.csv("rpa_log2.csv")

#Parse each column for each method
dataX=data1[,1]
dataComp5=data1[,2]*627.509
dataCoron=data1[,3]*627.509
dataBenz=data1[,4]*627.509
dataHe=data1[,5]*627.509

#Creates environment for high resolution png files
postscript("rpa_expand4.eps", width = 8.25, height = 4.5, paper = "special", horizontal=FALSE)

#Creating 4 panels plot of the expanded RPA by defining mfrow mxn matrix
par(mfrow=c(2,2))

#The scatterplot on top
par(mai = c(0.3, 1, 0.2, 0.1))
plot(dataX,dataComp5,pch=1,col="black",lwd=1.5,lty=1,type="o",cex=1,
     xlab='',ylab='',#ylab=expression(paste(" ",E^c(n) ,"- ",E^c("\U221E")," (Hartree)")),
     xlim=c(2,6),yaxt='n',xaxt='n',ylim=c(-200,320))

#Legend
legend("topleft",c("TNF@tweezer2","Coronene Dimer","Benzene Dimer","Helium Dimer"),
       cex=0.8,col=c("black","red","orange","blue"),
       pch=c(1,22,13,6),lty=c(1,2,13,3),bty='n',pt.cex=1,
       lwd=1,inset=c(0.02,-0.01))

#Defining the x-axis scale and ticks
axis(1,xaxp=c(2,6,4),label=FALSE,tck=-0.03)
axis(2,yaxp=c(-200,400,6),cex.axis=1.2,col=NA,las=2,line=-0.5)
axis(2,yaxp=c(-200,400,6),label=FALSE,tck=-0.03)

#The scatterplot in the 2nd row
par(mai = c(0.3, 0.6, 0.2, 0.3))
plot(dataX,dataCoron,type="o",pch=22,col="red",cex=1,lwd=1,lty=22,
     xlab='',ylab='',#ylab=expression(paste(" ",E^c(n) ,"- ",E^c("\U221E")," (Hartree)")),
     xlim=c(2,6),yaxt='n',xaxt='n',ylim=c(-200,300),cex.lab=3,cex.axis=3)

axis(1,xaxp=c(2,6,4),label=FALSE,tck=-0.03)
axis(2,yaxp=c(-200,400,6),cex.axis=1.2,col=NA,las=2,line=-0.5)
axis(2,yaxp=c(-200,400,6),label=FALSE,tck=-0.03)

#The scatterplot in the 3rd row
par(mai = c(0.6, 1, 0, 0.1))
plot(dataX,dataBenz,type="o",pch=13,col="orange",cex=1,lwd=1,lty=13,
     xlab='',ylab='',#ylab=expression(paste(" ",E^c(n) ,"- ",E^c("\U221E")," (Hartree)")),
     xlim=c(2,6),yaxt='n',xaxt='n',ylim=c(-200,300),cex.lab=3,cex.axis=3)

axis(1,xaxp=c(2,6,4),cex.axis=1.2,col=NA,line=-0.5)
axis(1,label=FALSE,tck=-0.03)
axis(2,yaxp=c(-200,400,6),cex.axis=1.2,col=NA,las=2,line=-0.5)
axis(2,yaxp=c(-200,400,6),label=FALSE,tck=-0.03)

mtext("n",side=1, line=1.8, at=4,cex=1.2)

##The scatterplot in the 4th row
par(mai = c(0.6, 0.6, 0, 0.3))
plot(dataX,dataHe,type="o",pch=6,col="blue",cex=1,lwd=1,lty=6,
     xlab='',ylab='',#ylab=expression(paste(" ",E^c(n) ,"- ",E^c("\U221E")," (kcal/mol)")),
     xlim=c(2,6),yaxt='n',xaxt='n',ylim=c(-1,1))

axis(1,xaxp=c(2,6,4),cex.axis=1.2,col=NA,line=-0.5)
axis(1,label=FALSE,tck=-0.03)
axis(2,yaxp=c(-1,1,4),cex.axis=1.2,col=NA,las=2,line=-0.5)
axis(2,yaxp=c(-1,1,4),label=FALSE,tck=-0.03)

mtext(expression(paste(" ",E^c(n) ,"- ",E^c(infinity)," (kcal/mol)")), side=2, line=26, at=1.5,cex=1.2)
mtext("n",side=1, line=1.8, at=4,cex=1.2)

dev.off()

