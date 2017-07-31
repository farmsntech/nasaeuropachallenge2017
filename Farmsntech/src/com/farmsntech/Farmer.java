package com.farmsntech;

public class Farmer {
long mobile;
String password;
int fid;

public int getFid() {
	return fid;
}

/**
 * @param mobile
 * @param password
 */
public Farmer(int fid,long mobile, String password) {
	super();
	this.fid=fid;
	this.mobile = mobile;
	this.password = password;
}

public void setFid(int fid) {
	this.fid = fid;
}

public long getMobile() {
	return mobile;
}
public String getPassword() {
	return password;
}

public void setMobile(long mobile) {
	this.mobile = mobile;
}
public void setPassword(String password) {
	this.password = password;
}
}
