myPredict = function(x,y,z){
	datalist1 = list()
	pastdata <- read.csv(file = "/home/orienit/r/sample.csv")


	datestring <- Sys.Date()
	date <- as.numeric(substr(datestring,9,10))
	datefinal <- date+2000


	x = datefinal

	for(i in 1:x){
	  p1=pastdata[i,1]
	  p2=pastdata[i,2]
	  p3=pastdata[i,3]
	  p4=pastdata[i,4]
	  currdata = data.frame(p1,p2,p3,p4)
	  datalist1[[i]] <- currdata

	} 

	p1=21
	p2=22
	p3=23
	p4=24
	currdat = data.frame(p1,p2,p3,p4)
	datalist1[[i+1]] <- currdat

	big1 = do.call(rbind, datalist1)
	write.csv(big1,"/home/orienit/r/sample.csv",row.names = FALSE)
}
