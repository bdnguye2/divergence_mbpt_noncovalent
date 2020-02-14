#Reads in .csv file as data1 variable
data1<-read.csv("prep_hf.csv")

#Parse each column for each method
dataX=data1[,1]
datah2=data1[,2]*627.509
datah2o=data1[,3]*627.509
datahf=data1[,4]*627.509
datalih=data1[,5]*627.509

#Creates environment for high resolution png files
#png("expand_hf.png", width = 3.25, height = 2.25, units = 'in', res = 600)
postscript("expand_hf.eps", width = 4.2, height = 2.85, paper='special',horizontal=FALSE)
par(mfrow=c(1,1),mar=c(2.45,4.0,0.5,0.5))
#Beginning of the Scatterplot 
plot(dataX,datah2,pch=1,col="black",lwd=1.5,lty=1,type="o",cex=1,
     xlab='',ylab='',xlim=c(2,20.1),ylim=c(-4.5,4.5),
     yaxt='n',xaxt='n',cex.lab=1)
box(lwd=2)
     
#title(ylab=expression(paste(italic(E)^{(n)}, -italic(E)^{("\U221E")},' (Hartree)')),line=2.5,cex.lab=1)
mtext(expression(paste(" ",E^c(n) ,"- ",E^c(infinity)," (kcal/mol)")), side=2, line=2.2, cex=1.2)
mtext(expression(paste("n")), side=1, line=1.5, cex=1.2)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(2,40,19),cex.axis=1,col=NA,line=-0.5)
axis(1,xaxp=c(2,40,38),label=FALSE,tck=-0.03,lwd=2)
axis(2,yaxp=c(-4.5,4.5,6),cex.axis=1,las=2,col=NA,line=-0.3)
axis(2,yaxp=c(-4.5,4.5,12),label=FALSE,tck=-0.03,lwd=2)

abline(h=0,lwd=1.5)

#Plots SCS_MP2 and RPA datapoints
lines(dataX,datalih,type="o",pch=22,col="red",cex=1,lwd=1,lty=22)
lines(dataX,datah2o,type="o",pch=13,col="orange",cex=1,lwd=1,lty=13)
lines(dataX,datahf,type="o",pch=6,col="blue",cex=1,lwd=1,lty=6)

#Legend
legend("bottomleft",c(expression(paste((H[2])[2],' (',underline(alpha)[c]^{PT2},'=1.70)')),
       expression(paste((LiH)[2],' (',underline(alpha)[c]^{PT2},'=1.72)')),
       expression(paste('(',H[2],O,')'[2],' (',underline(alpha)[c]^{PT2},'=0.773)')),
       expression(paste((HF)[2],' (',underline(alpha)[c]^{PT2},'=0.819)'))),
       cex=0.8,col=c("black","red","orange","blue"),
       pch=c(1,22,13,6),lty=c(1,2,13,3),bty='n',pt.cex=1,
       lwd=1.5,inset=c(0.01,-0.01))

dev.off()


# Reads in He dimer, benzene, coronene, and tweezer complexes
data2<-read.csv("rpa_HF_plot.csv")

#Parse each column for each method
dataX=data2[,1]
dataComp5=data2[,5]
dataCoron=data2[,4]
dataBenz=data2[,3]
dataHe=data2[,2]

#Creates environment for high resolution png files
#png("rpa_expand3.png", width = 5.2, height = 3.25, units = 'in', res = 600)
postscript("rpa_expand4.eps", width = 5.2, height = 3.35, paper='special',horizontal=FALSE)

par(mfrow=c(1,1),mar=c(2.45,4.2,0.5,0.5))
#Beginning of the Scatterplot 
plot(dataX,dataComp5,pch=1,col="black",lwd=1.5,lty=1,type="o",cex=1,
     xlab='',ylab='',xlim=c(2,20),
     yaxt='n',xaxt='n',ylim=c(-6000,6000),cex.lab=1)
box(lwd=2)
     
#title(ylab=expression(paste(italic(E)^{(n)}, -italic(E)^{("\U221E")},' (Hartree)')),line=2.5,cex.lab=1)
mtext(expression(paste(" ",E^c(n) ,"- ",E^c(infinity)," (kcal/mol)")), side=2, line=2.7, cex=1)
mtext(expression(paste("n")), side=1, line=1.5, cex=1)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(2,20,18),cex.axis=1,col=NA,line=-0.4)
axis(1,xaxp=c(2,20,18),label=FALSE,tck=-0.04,lwd=2)
axis(2,yaxp=c(-6000,6000,6),cex.axis=0.9,las=2,col=NA,line=-0.2)
axis(2,yaxp=c(-6000,6000,12),label=FALSE,tck=-0.04,lwd=2)

abline(h=0,lwd=1.5)

#Plots SCS_MP2 and RPA datapoints
lines(dataX,dataCoron,type="o",pch=22,col="red",cex=1,lwd=1.5,lty=22)
lines(dataX,dataBenz,type="o",pch=13,col="orange",cex=1,lwd=1.5,lty=13)
lines(dataX,dataHe,type="o",pch=6,col="blue",cex=1,lwd=1.5,lty=6)

#Legend
legend("bottomleft",c(expression(paste('TNF@tweezer2 (',underline(alpha)[c]^{PT2},'=0.187)')),
       expression(paste('Coronene Dimer (',underline(alpha)[c]^{PT2},'=0.240)')),
       expression(paste('Benzene Dimer (',underline(alpha)[c]^{PT2},'=0.316)')),
       expression(paste('Helium Dimer (',underline(alpha)[c]^{PT2},'=1.59)'))),
       cex=0.8,col=c("black","red","orange","blue"),
       pch=c(1,22,13,6),lty=c(1,2,13,3),bty='n',pt.cex=1,
       lwd=1.5,inset=c(0.02,-0.01))

#Creates an inset plot
par(fig=c(0.1,0.54, 0.56, 0.98),new=T)
plot(dataX,dataComp5,type="o",pch=1,cex=1,lwd=1.5,lty=1,
     yaxt="n",xaxt="n",ylim=c(-58,55),ann=FALSE,xlim=c(2,8.2))
box(lwd=2)

abline(h=0,lwd=1.5)

axis(1,xaxp=c(2,10,8),cex.axis=1,col=NA,line=-0.6)
axis(1,xaxp=c(2,10,8),label=FALSE,tck=-0.08,lwd=2)
axis(2,yaxp=c(-100,100,4),cex.axis=1,las=2,col=NA,line=-0.4)
axis(2,yaxp=c(-100,100,8),label=FALSE,tck=-0.08,lwd=2)

lines(dataX,dataCoron,type="o",pch=22,col="red",cex=1,lwd=1.5,lty=22)
lines(dataX,dataBenz,type="o",pch=13,col="orange",cex=1,lwd=1.5,lty=13)
lines(dataX,dataHe,type="o",pch=6,col="blue",cex=1,lwd=1.5,lty=6)

dev.off()
