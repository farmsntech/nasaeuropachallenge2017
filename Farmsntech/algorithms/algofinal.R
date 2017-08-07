myAdd = function(){

	dat1 <- read.csv(file = "MyData3.csv")
	dat2 <- read.csv(file = "MyData9.csv")
	dat3 <- read.csv(file = "MyData11.csv")
	dat4 <- read.csv(file = "MyData15.csv")
	dat5 <- read.csv(file = "MyData21.csv")

	datalist1 = list()

	for(i1 in 1:15){
	  x = (((0.4)*dat1[i1,2])+((0.25)*dat2[i1,2])+((0.15)*dat3[i1,2])+((0.1)*dat4[i1,2])+((0.1)*dat5[i1,2]))
	  y = (((0.4)*dat1[i1,3])+((0.25)*dat2[i1,3])+((0.15)*dat3[i1,3])+((0.1)*dat4[i1,3])+((0.1)*dat5[i1,3]))
	  z = (((0.4)*dat1[i1,4])+((0.25)*dat2[i1,4])+((0.15)*dat3[i1,4])+((0.1)*dat4[i1,4])+((0.1)*dat5[i1,4]))
	  w = (((0.4)*dat1[i1,5])+((0.25)*dat2[i1,5])+((0.15)*dat3[i1,5])+((0.1)*dat4[i1,5])+((0.1)*dat5[i1,5]))
	  
	  datafinal = data.frame(x,y,z,w)
	  datalist1[[i1]] <- datafinal
	  
	}

	bigD = do.call(rbind, datalist1)
	write.csv(bigD,"MyDataFinal.csv")
return(1)
}
