#Reads in .csv file as data1 variable
data1<-read.csv("conv.csv")

#Parse each column for each method
dataX=data1[,1]
datacc_pvtz=data1[,2]
datacc_pvqz=data1[,3]
data_cbs=data1[,4]
data_cp_cbs=data1[,5]

#Creates environment for high resolution png files
#png("conv.png", width = 7.8, height = 3.25, units = 'in', res = 600)
postscript("mp2-ci.eps", width = 3.25, height = 2.25, paper="special", horizontal=FALSE)

par(mfrow=c(1,1),mar=c(2,2.6,0.4,0.4))
#Beginning of the Scatterplot 
plot(dataX,datacc_pvtz,pch=1,col="black",lwd=1,type="o",
     xlab='',ylab='',cex=0.5,
     lty=1,yaxt="n",xaxt="n",ylim=c(-115,15),cex.lab=0.7,cex.axis=0.7)

title(xlab='S30L-CI Complexes',line=1,cex.lab=0.8)
title(ylab=expression(paste(Delta,italic(E)^{MP2},' (kcal/mol)')),line=1.5,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(1,30,29),cex.axis=0.8,col=NA,line=-0.85)
axis(1,xaxp=c(1,30,29),label=FALSE,tck=-0.03)
axis(2,yaxp=c(-125,25,6),cex.axis=0.8,col=NA,line=-0.65,las=2)
axis(2,yaxp=c(-125,25,12),label=FALSE,tck=-0.03)

abline(h=0,lwd=0.7)

lines(dataX,datacc_pvqz,type="o",pch=22,col="red",cex=0.7,lwd=1,lty=22)
lines(dataX,data_cbs,type="o",pch=13,col="orange",cex=0.7,lwd=1,lty=13)
lines(dataX,data_cp_cbs,type="o",pch=6,col="blue",cex=0.7,lwd=1,lty=6)

#Legend
legend("bottomleft",legend = c(expression(paste("triple-",zeta)),expression(paste("quadruple-",zeta)),
       "3-4 Ext","50 % CP 3-4 Ext"),
       cex=0.75,col=c("black","red","orange","blue"),
       pch=c(1,22,13,6),lty=c(1,2,4,3), bty='n',pt.cex=0.8,
       lwd=1,inset=c(0.02,-0.01))

dev.off()
warnings()
