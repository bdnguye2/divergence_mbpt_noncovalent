data<-read.csv("basis_prep_2.csv")
attach(data)

dataE=matrix(c(data[,2],data[,3]),ncol=2)
data50CP=matrix(c(data[,2],data[,4]),ncol=2)
dataEnoCP=matrix(c(data[,2],data[,5]),ncol=2)
#data34=matrix(c(data[,2],data[,6],ncol=2))

#png("extrapol.png", width = 8, height = 6, units = 'in', res = 300)
postscript("extrapol.eps", width=8, height =5, paper="special",horizontal=FALSE)
par(mfrow=c(1,1),mar=c(1,5,3,2))

plot(dataE,xlim=c(0,0.04),ylim=c(-25,0),axes=F,ann=F,
     bty='n',pch=2,col="blue",lwd=2)
points(data50CP,pch=4,col="black",lwd=2)
points(dataEnoCP,pch=3,col="red",lwd=2)

axis(3,at=c(1/3^3,1/4^3,1/5^3,0),lab=c("pVTZ","pVQZ","pV5Z",""),
     lwd=2,font=1,cex.axis=1.3)
mtext(expression(paste(infinity)),side=3,at=0,line=0.8,cex=2.5)
axis(2,at=c(0,-5,-10,-15,-20,-25),col=NA,
     lwd=2,font=1,cex.axis=1.3,las=2)
axis(2,yaxp=c(-25,0,10),label=FALSE,tck=-0.02)

lines(c(dataE[1],dataE[2],dataE[3],0),c(dataE[1,2],dataE[2,2],
        dataE[3,2],-17.7),lty=8,pch=NA,lwd=2,col="blue",type="o")
lines(c(data50CP[1],data50CP[2],data50CP[3],0),c(data50CP[1,2],
        data50CP[2,2],data50CP[3,2],-17.7),lty=8,pch=NA,lwd=2,type="o")
lines(c(dataEnoCP[1],dataEnoCP[2],dataEnoCP[3],0),c(dataEnoCP[1,2],
        dataEnoCP[2,2],dataEnoCP[3,2],-17.7),lty=8,pch=NA,lwd=2,col="red",type="o")

# 3-4 extrapolated interaction energy
points(0,-17.61080857,cex=1,lwd=1.5,col="orange")
mtext("3-4 Ext",col="orange",at=0.001,line=-13.5,cex=1.2)

# 4-5 extrapolated interaction energy
points(0,-17.81321832,cex=1,lwd=1.5,col="magenta")
mtext("4-5 Ext",col="magenta",at=0.001,line=-16.5,cex=1.2)

legend("topleft",-1,c("RPA","RPA 50% CP","RPA 100% CP"),col=c("blue","black","red"),
       cex=1.5,pch=c(2,4,3),lty=c(8,8,8),lwd=2,text.font=1,bty='n')

title(ylab=expression(paste('Interaction Energy (kcal/mol)')),line=3.2,cex.lab=1.3)
#title(ylab="Interaction Energy (kcal/mol)",mgp=c(2.5,2.5,0),font.lab=1,cex.lab=1.5)
box(lwd=2)

dev.off()
