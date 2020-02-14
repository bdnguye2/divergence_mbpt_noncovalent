#Reads in .csv file as data1 variable
data1<-read.csv("rpa_expand.csv")

#Parse each column for each method
dataX=data1[,1]
data_eigQ=data1[,2]#^(-1)
data_mp2=data1[,3]
data_rirpa=data1[,4]
data_elec=data1[,6]
data_eigQ_hf=data1[,7]#^(-1)

#Creates environment for high resolution png files
#Creates plot eigenvalue of q(w) vs system size
postscript("eig_q_atoms.eps", width = 3.25, height = 2.25, paper="special", horizontal=FALSE)
#png("eig_q_atoms.png", width = 3.25, height = 3.25, units = 'in', res = 600)

par(mfrow=c(1,1),mar=c(2,2,0.5,0.5))
#Beginning of the Scatterplot 
plot(dataX,data_eigQ,pch=2,col="black",lwd=0.8,
     xlab='',ylab='',cex=0.7,xlim=c(0,220),
     lty=1,yaxt="n",xaxt="n",ylim=c(0,7),cex.lab=0.5,cex.axis=0.7)

points(dataX,data_eigQ_hf,lwd=0.8,cex=0.7,pch=2,col="blue")

title(xlab='Atoms',line=1,cex.lab=0.8)
title(ylab=expression(paste(1/underline(alpha)[c]^{PT2})),line=0.8,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,300,6),cex.axis=0.7,col=NA,line=-0.8)
axis(1,xaxp=c(0,300,12),label=FALSE,tck=-0.04)
axis(2,yaxp=c(0,7,7),cex.axis=0.7,col=NA,line=-0.6,las=2)
axis(2,yaxp=c(0,7,14),label=FALSE,tck=-0.03)

legend("topleft",c("RPA(PBE)","RPA(HF)"),cex=0.7,col=c("black","blue"),pch=c(1,2),
       bty="n")

abline(h=0,lwd=0.7)
abline(h=1,lwd=1,lty=2,col='red')
dev.off()

#Creates plot eigenvalue of q(w) vs mp2 errors
postscript("eig_q_mp2.eps", width = 3.25, height = 3, paper="special", horizontal=FALSE)
#png("eig_q_mp2.png", width = 3.25, height = 2.25, units = 'in', res = 600)

par(mfrow=c(1,1),mar=c(2.2,2,0.4,0.2))
#Beginning of the Scatterplot 
plot(data_eigQ,abs(data_mp2),pch=2,col="blue",lwd=0.8,
     xlab='',ylab='',cex=0.7,
     lty=1,yaxt="n",xaxt="n",ylim=c(-0,100),xlim=c(0,7),cex.lab=0.5,cex.axis=0.7)

points(data_eigQ,abs(data_rirpa),lwd=0.8,cex=0.7,pch=1)

title(xlab=expression(paste(1/underline(alpha)[c]^{PT2})),line=1.2,cex.lab=0.8)
title(ylab=expression(paste('|',Delta,italic(E),'| (kcal/mol)')),line=1,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,7,7),cex.axis=0.67,col=NA,line=-0.9)
axis(1,xaxp=c(0,7,14),label=FALSE,tck=-0.02)
axis(2,yaxp=c(-20,100,12),cex.axis=0.7,col=NA,line=-0.6,las=2)
axis(2,yaxp=c(-20,100,24),label=FALSE,tck=-0.02)

abline(h=0,lwd=0.7)
abline(v=1,lwd=1,col='red',lty=2)

legend(1,105,c("RPA(PBE)","MP2"),cex=0.7,col=c("black","blue"),pch=c(1,2),
       bty="n")

dev.off()

#Creates environment for high resolution png files
#Creates plot eigenvalue of q(w) vs system size - valence electrons
postscript("eig_q_elec.eps", width = 3.25, height = 2.25, paper="special", horizontal=FALSE)
#png("eig_q_atoms.png", width = 3.25, height = 2.25, units = 'in', res = 600)

par(mfrow=c(1,1),mar=c(2,2,0.5,0.5))
#Beginning of the Scatterplot 
plot(data_elec,data_eigQ,pch=1,col="black",lwd=0.8,
     xlab='',ylab='',cex=0.7,
     lty=1,yaxt="n",xaxt="n",ylim=c(0,7),xlim=c(0,600),cex.lab=0.5,cex.axis=0.7)

points(data_elec,data_eigQ_hf,lwd=0.8,cex=0.7,pch=2,col="blue")

title(xlab='VEs',line=1,cex.lab=0.8)
title(ylab=expression(paste(1/underline(alpha)[c]^{PT2})),line=0.7,cex.lab=0.8)

#Defining the x-axis scale and ticks
axis(1,xaxp=c(0,600,6),cex.axis=0.7,col=NA,line=-0.8)
axis(1,xaxp=c(0,600,12),label=FALSE,tck=-0.04)
axis(2,yaxp=c(0,7,7),cex.axis=0.7,col=NA,line=-0.6,las=2)
axis(2,yaxp=c(0,7,14),label=FALSE,tck=-0.03)

abline(h=0,lwd=0.7)
abline(h=1,lwd=1,lty=2,col='red')

legend("topleft",c("PBE","HF"),cex=0.7,col=c("black","blue"),pch=c(1,2),
       bty="n")

dev.off()
