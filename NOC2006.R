NOC2006list<-readHTMLList(NOC2006)[c(5:180)]
biglist<-unique(unlist(lapply(readHTMLList(NOC2006)[c(5:180)],function(x) strsplit(x," *\\\r\\\n *",perl=T))))
threedigit<-unlist(regmatches(biglist,gregexpr("^[0-9]{3}\\s.*",biglist,perl=T)))
fourdigit<-unlist(regmatches(biglist,gregexpr("^[0-9]{4}\\s.*",biglist,perl=T)))
fourdigitmatrix<-matrix(unlist(strsplit(fourdigit,"(?<=[0-9]{4})\\s",perl=T)),ncol=2,byrow=T)

##############################################
#Playing around...
NOC2006<-htmlParse(getURL("http://www30.hrsdc.gc.ca/NOC/English/NOC/2006/QuickSearch.aspx?val65=*"),useInternalNode=T)
NOC2006classes.h2<-unlist(xpathApply(NOC2006,"//h2",xmlValue))
onedigit<-matrix(unlist(strsplit(NOC2006classes.h2,"(?<=[0-9]{1})",perl=T)),ncol=2,byrow=T)[3:12,]
NOC2006classes.h3<-unlist(xpathApply(NOC2006,"//h3",xmlValue))
twodigit<- cbind("Major Group",matrix(unlist(strsplit(NOC2006classes.h3,"Major Group ",perl=T)),ncol=2,byrow=T)[1:26,2])
twodigitdef<-unlist(xpathApply(NOC2006,"//h4",xmlValue))
twodigitall<-cbind(twodigit,twodigitdef)
NOC2006classes.h5<-unlist(xpathApply(NOC2006,"//h5",xmlValue))
threedigit<-matrix(unlist(strsplit(NOC2006classes.h5,"(?<=[0-9 ]{3})",perl=T)),ncol=2,byrow=T)
threedigitcodematrix<-matrix(as.numeric(unlist(strsplit(threedigit[,1],""))),ncol=3,byrow=T)
onematrix<-



threedigit[unlist(gregexpr("^0",threedigit[,1]))>0,1]
