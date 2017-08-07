package com.farmsntech;

public class weather {

	float min;
	float max;
	float rain;
	public float getMin() {
		return min;
	}
	public float getMax() {
		return max;
	}
	public float getRain() {
		return rain;
	}
	public void setMin(float min) {
		this.min = min;
	}
	public void setMax(float max) {
		this.max = max;
	}
	public void setRain(float rain) {
		this.rain = rain;
	}
	/**
	 * 
	 */
	/**
	 * @param min
	 * @param max
	 * @param rain
	 */
	public weather(float min, float max, float rain) {
		super();
		this.min = min;
		this.max = max;
		this.rain = rain;
	}
	
	
	
	
}
