package com.farmsntech.crop;

public class Crop {

	
	int crop_id;
	String crop_name;
	public void setCrop_id(int crop_id) {
		this.crop_id = crop_id;
	}
	public void setCrop_name(String crop_name) {
		this.crop_name = crop_name;
	}
	public int getCrop_id() {
		return crop_id;
	}
	public String getCrop_name() {
		return crop_name;
	}
	/**
	 * @param crop_id
	 * @param crop_name
	 */
	public Crop(int crop_id, String crop_name) {
		
		this.crop_id = crop_id;
		this.crop_name = crop_name;
	}
	
}
