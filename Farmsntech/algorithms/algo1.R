myAdd = function(){
	data <- read.csv(file = "/home/orienit/r/sample.csv")

	datestring <- Sys.Date()
	date <- as.numeric(substr(datestring,9,10))
	datefinal <- date+2000

	b = datefinal
	a=b-6
	resA=list()
	for(i in a:b){
	  for(j in 1:4){
	    t = data[i,j]
	    resA = c(resA,t)
	  }
	}
	
	mdat <- matrix(c(resA),nrow=7, ncol=4, byrow = TRUE)
	k1 = a-366
	k2 = k1+13

	res1=list()
	for(i in k1:k2){
	  for(j in 1:4){
	    t = data[i,j]
	    res1 = c(res1,t)
	  }
	}
	  
	mdat1 <- matrix(c(res1),nrow=14, ncol=4, byrow = TRUE)

	x=1
	edlist = list()
	for(i in 1:8){
	  y=x+27
	  mdat2 <- matrix(c(res1[x:y]),nrow=7, ncol=4, byrow = TRUE)
	  library(pdist)
	  dists <- pdist(t(mdat), t(mdat2))
	  A = as.matrix(dists)
	  z = det(A)
	  edlist = c(edlist,z)
	  x=x+4
	}

	edlist
	w = which.min(edlist)
	w1 = ((w-1)*4)+1
	w2 = w1+27
	mdat3 <- matrix(c(res1[w1:w2]),nrow=7, ncol=4, byrow = TRUE)

	r1 <- data.frame(mdat3[1,1],mdat3[2,1],mdat3[3,1],mdat3[4,1],mdat3[5,1],mdat3[6,1],mdat3[7,1])
	r11 <- list(r1[2]-r1[1],r1[3]-r1[2],r1[4]-r1[3],r1[5]-r1[4],r1[6]-r1[5],r1[7]-r1[6])
	r1m = abs(mean(unlist(r11)))

	r2 <- data.frame(mdat3[1,2],mdat3[2,2],mdat3[3,2],mdat3[4,2],mdat3[5,2],mdat3[6,2],mdat3[7,2])
	r22 <- list(r2[2]-r2[1],r2[3]-r2[2],r2[4]-r2[3],r2[5]-r2[4],r2[6]-r2[5],r2[7]-r2[6])
	r2m = abs(mean(unlist(r22)))

	r3 <- data.frame(mdat3[1,3],mdat3[2,3],mdat3[3,3],mdat3[4,3],mdat3[5,3],mdat3[6,3],mdat3[7,3])
	r33 <- list(r3[2]-r3[1],r3[3]-r3[2],r3[4]-r3[3],r3[5]-r3[4],r3[6]-r3[5],r3[7]-r3[6])
	r3m = abs(mean(unlist(r33)))

	r4 <- data.frame(mdat3[1,4],mdat3[2,4],mdat3[3,4],mdat3[4,4],mdat3[5,4],mdat3[6,4],mdat3[7,4])
	r44 <- list(r4[2]-r4[1],r4[3]-r4[2],r4[4]-r4[3],r4[5]-r4[4],r4[6]-r4[5],r4[7]-r4[6])
	r4m = abs(mean(unlist(r44)))


	s1 <- data.frame(mdat[1,1],mdat[2,1],mdat[3,1],mdat[4,1],mdat[5,1],mdat[6,1],mdat[7,1])
	s11 <- list(s1[2]-s1[1],s1[3]-s1[2],s1[4]-s1[3],s1[5]-s1[4],s1[6]-s1[5],s1[7]-s1[6])
	s1m = abs(mean(unlist(s11)))

	s2 <- data.frame(mdat[1,2],mdat[2,2],mdat[3,2],mdat[4,2],mdat[5,2],mdat[6,2],mdat[7,2])
	s22 <- list(s2[2]-s2[1],s2[3]-s2[2],s2[4]-s2[3],s2[5]-s2[4],s2[6]-s2[5],s2[7]-s2[6])
	s2m = abs(mean(unlist(s22)))

	s3 <- data.frame(mdat[1,3],mdat[2,3],mdat[3,3],mdat[4,3],mdat[5,3],mdat[6,3],mdat[7,3])
	s33 <- list(s3[2]-s3[1],s3[3]-s3[2],s3[4]-s3[3],s3[5]-s3[4],s3[6]-s3[5],s3[7]-s3[6])
	s3m = abs(mean(unlist(s33)))

	s4 <- data.frame(mdat[1,4],mdat[2,4],mdat[3,4],mdat[4,4],mdat[5,4],mdat[6,4],mdat[7,4])
	s44 <- list(s4[2]-s4[1],s4[3]-s4[2],s4[4]-s4[3],s4[5]-s4[4],s4[6]-s4[5],s4[7]-s4[6])
	s4m = abs(mean(unlist(s44)))

	p1 = data[1000,1]+(r1m+s1m/2)
	p2 = data[1000,2]+(r2m+s2m/2)
	p3 = data[1000,3]+(r3m+s3m/2)
	p4 = data[1000,4]+(r4m+s4m/2)

	mydata = data.frame(p1,p2,p3,p4)
	write.csv(mydata,file = "/home/orienit/r/MyData3.csv")

	datalist = list()
	datalist[[1]] <- mydata
	datalist

	for (k in 2:15) {
	  datatest <- read.csv(file = "/home/orienit/r/MyData3.csv")
	  
	  if(k<=7){
	    b=2000
	    a=(b-6)+(k-1)
	    
	    resA=list()
	    for(i in a:b){
	      for(j in 1:4){
		t = data[i,j]
		resA = c(resA,t)
	      }
	    }
	    k11 = k
	    while((k11-1)>0){
	      i1 = k11-1
	      for(j in 2:5){
		t=datatest[i1,j]
		resA = c(resA,t)
	      }
	      k11 = k11-1;
	    }
	  }else{
	    a=k-7
	    b=a+6
	    resA=list()
	    for(i in a:b){
	      for(j in 2:5){
		t = datatest[i,j]
		resA = c(resA,t)
	      }
	    }
	  }
	  
	  mdat <- matrix(c(resA),nrow=7, ncol=4, byrow = TRUE)
	  
	  k1 = a-366
	  k2 = k1+13
	  
	  res1=list()
	  for(i in k1:k2){
	    for(j in 1:4){
	      t = data[i,j]
	      res1 = c(res1,t)
	    }
	  }
	  
	  mdat1 <- matrix(c(res1),nrow=14, ncol=4, byrow = TRUE)
	  x=1
	  edlist = list()
	  for(i in 1:8){
	    y=x+27
	    mdat2 <- matrix(c(res1[x:y]),nrow=7, ncol=4, byrow = TRUE)
	    library(pdist)
	    dists <- pdist(t(mdat), t(mdat2))
	    A = as.matrix(dists)
	    z = det(A)
	    edlist = c(edlist,z)
	    x=x+4
	  }
	  
	  edlist
	  w = which.min(edlist)
	  w1 = ((w-1)*4)+1
	  w2 = w1+27
	  mdat3 <- matrix(c(res1[w1:w2]),nrow=7, ncol=4, byrow = TRUE)
	  
	  r1 <- data.frame(mdat3[1,1],mdat3[2,1],mdat3[3,1],mdat3[4,1],mdat3[5,1],mdat3[6,1],mdat3[7,1])
	  r11 <- list(r1[2]-r1[1],r1[3]-r1[2],r1[4]-r1[3],r1[5]-r1[4],r1[6]-r1[5],r1[7]-r1[6])
	  r1m = abs(mean(unlist(r11)))
	  
	  r2 <- data.frame(mdat3[1,2],mdat3[2,2],mdat3[3,2],mdat3[4,2],mdat3[5,2],mdat3[6,2],mdat3[7,2])
	  r22 <- list(r2[2]-r2[1],r2[3]-r2[2],r2[4]-r2[3],r2[5]-r2[4],r2[6]-r2[5],r2[7]-r2[6])
	  r2m = abs(mean(unlist(r22)))
	  
	  r3 <- data.frame(mdat3[1,3],mdat3[2,3],mdat3[3,3],mdat3[4,3],mdat3[5,3],mdat3[6,3],mdat3[7,3])
	  r33 <- list(r3[2]-r3[1],r3[3]-r3[2],r3[4]-r3[3],r3[5]-r3[4],r3[6]-r3[5],r3[7]-r3[6])
	  r3m = abs(mean(unlist(r33)))
	  
	  r4 <- data.frame(mdat3[1,4],mdat3[2,4],mdat3[3,4],mdat3[4,4],mdat3[5,4],mdat3[6,4],mdat3[7,4])
	  r44 <- list(r4[2]-r4[1],r4[3]-r4[2],r4[4]-r4[3],r4[5]-r4[4],r4[6]-r4[5],r4[7]-r4[6])
	  r4m = abs(mean(unlist(r44)))
	  
	  
	  s1 <- data.frame(mdat[1,1],mdat[2,1],mdat[3,1],mdat[4,1],mdat[5,1],mdat[6,1],mdat[7,1])
	  s11 <- list(s1[2]-s1[1],s1[3]-s1[2],s1[4]-s1[3],s1[5]-s1[4],s1[6]-s1[5],s1[7]-s1[6])
	  s1m = abs(mean(unlist(s11)))
	  
	  s2 <- data.frame(mdat[1,2],mdat[2,2],mdat[3,2],mdat[4,2],mdat[5,2],mdat[6,2],mdat[7,2])
	  s22 <- list(s2[2]-s2[1],s2[3]-s2[2],s2[4]-s2[3],s2[5]-s2[4],s2[6]-s2[5],s2[7]-s2[6])
	  s2m = abs(mean(unlist(s22)))
	  
	  s3 <- data.frame(mdat[1,3],mdat[2,3],mdat[3,3],mdat[4,3],mdat[5,3],mdat[6,3],mdat[7,3])
	  s33 <- list(s3[2]-s3[1],s3[3]-s3[2],s3[4]-s3[3],s3[5]-s3[4],s3[6]-s3[5],s3[7]-s3[6])
	  s3m = abs(mean(unlist(s33)))
	  
	  s4 <- data.frame(mdat[1,4],mdat[2,4],mdat[3,4],mdat[4,4],mdat[5,4],mdat[6,4],mdat[7,4])
	  s44 <- list(s4[2]-s4[1],s4[3]-s4[2],s4[4]-s4[3],s4[5]-s4[4],s4[6]-s4[5],s4[7]-s4[6])
	  s4m = abs(mean(unlist(s44)))
	  
	  
	    p1 = data[1000,1]+(r1m+s1m/2)
	    p2 = data[1000,2]+(r2m+s2m/2)
	    p3 = data[1000,3]+(r3m+s3m/2)
	    p4 = data[1000,4]+(r4m+s4m/2)
	    
	    dat <- data.frame(p1,p2,p3,p4)
	    
	    datalist[[k]] <- dat
	  
	    big = do.call(rbind, datalist)
	    write.csv(big,"/home/orienit/r/MyData3.csv")
	}
return(1)
}
