#Reads in .csv file as data1 variable
data1<-read.csv("rpa_expand.csv")

#Parse each column for each method
dataX=data1[,1]
data_eigQ=data1[,2]
data_mp2=data1[,3]
data_rirpa=data1[,4]

#Creates environment for high resolution png files
#Creates plot eigenvalue of q(w) vs system size
postscript("eig_q_atoms.eps", width = 3.25, height = 3.25, paper="special", horizontal=FALSE)
#png("eig_q_atoms.png", width = 3.25, height = 3.25, units = 'in', res = 600)

par(mfrow=c(1,1),mar=c(2,1.75,0.5,0.5))
#Beginning of the Scatterplot 
plot(dataX,data_eigQ,pch=2,col="blue",lwd=0.8,
     xlab='',ylab='',cex=0.7,
     lty=1,yaxt="n",xaxt="n",ylim=c(0,8),cex.lab=0.5,cex.axis=0.7)

title(xlab='Atoms',line=1,cex.lab=0.8)
title(ylab=expression(paste('Eigenvalue of ',bold(Q)(omega))),line=0.7,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,300,6),cex.axis=0.7,col=NA,line=-0.8)
axis(1,xaxp=c(0,300,12),label=FALSE,tck=-0.02)
axis(2,yaxp=c(0,12,6),cex.axis=0.7,col=NA,line=-0.6,las=2)
axis(2,yaxp=c(0,12,12),label=FALSE,tck=-0.02)

abline(h=0,lwd=0.7)
abline(h=1,lwd=0.7,lty=2,col='blue')
dev.off()

#Creates plot eigenvalue of q(w) vs mp2 errors
postscript("eig_q_mp2.eps", width = 3.25, height = 3.25, paper="special", horizontal=FALSE)
#png("eig_q_mp2.png", width = 3.25, height = 3.25, units = 'in', res = 600)

par(mfrow=c(1,1),mar=c(2,2.5,0.5,0.5))
#Beginning of the Scatterplot 
plot(data_eigQ,data_mp2,pch=2,col="blue",lwd=0.8,
     xlab='',ylab='',cex=0.7,
     lty=1,yaxt="n",xaxt="n",ylim=c(-100,15),xlim=c(0,7),cex.lab=0.5,cex.axis=0.7)

points(data_eigQ,data_rirpa,lwd=0.8,cex=0.7,pch=1)

title(xlab=expression(paste('Eigenvalue of ',bold(Q)(omega))),line=1,cex.lab=0.8)
title(ylab='Interaction Energy Error (kcal/mol)',line=1.5,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(-2,12,14),cex.axis=0.7,col=NA,line=-0.9)
axis(1,xaxp=c(-2,12,28),label=FALSE,tck=-0.02)
axis(2,yaxp=c(-100,20,12),cex.axis=0.7,col=NA,line=-0.6,las=2)
axis(2,yaxp=c(-100,20,24),label=FALSE,tck=-0.02)

abline(h=0,lwd=0.7)

legend("topleft",c("RPA(PBE)","MP2"),cex=0.7,col=c("black","blue"),pch=c(1,2),
       bty="n")

dev.off()