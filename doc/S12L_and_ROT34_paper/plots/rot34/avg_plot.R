avgData<-read.csv("rot34.csv")
attach(avgData)

DataParse=matrix(unlist(c(avgData[1,2:9],avgData[2,2:9],avgData[3,2:9])),ncol=3)
rownames(DataParse)=c("RPA(PBE)","RPA(TPSS)","SCS-MP2","MP2",
                  "PBE-D3","SCAN","SCAN-D3","M06L")
colnames(DataParse)=c("MAE/MHz","ME/MHz","rMinMax/%")

#png("deviate_v5.png", width = 3.25, height=2.75,units='in',res=600)
postscript("deviate_v5.eps", width = 3.25, height = 2.25,paper="special",horizontal=FALSE)
par(mfrow=c(1,1),mar=c(1.3,2.2,0.5,0.5))

barplot(DataParse,yaxt='n',beside=T,xaxt='n',yaxt='n',
        col=colors()[c(26,135,195,476,498,654,30,639)],axes=FALSE,
        ylim=c(-20,20.10),cex.axis = 0.8,cex.names=0.5,cex.lab=0.5,
	space=c(0,2))

title(ylab='Error',cex.lab=0.8,line=1.3)

axis(side=2,cex.axis=0.8,las=2,col=NA,line=-0.5,yaxp=c(-20,20,10))
axis(2,yaxp=c(-20,20,10),label=FALSE,tck=-0.03)

mtext("MAE (MHz)", side=1, line=0.1, at=5.5,cex=0.8)
mtext("ME (MHz)",side=1,line=0.1,cex=0.8)
mtext("rMinMax (%)",side=1,line=0.1,at=26.5,cex=0.8)

legend("topright",c("RPA(PBE)","RPA(TPSS)","SCS-MP2","MP2",
        "PBE-D3","SCAN","SCAN-D3","M06L"),bty='n',inset=c(0,0)
       ,fill=colors()[c(26,135,195,476,498,654,30,639)],ncol=2,
       cex=0.65)
       
abline(h=0,lwd=0.7)
box(lwd=1)
dev.off()

