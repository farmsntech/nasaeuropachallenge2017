package com.farmsntech.crop;

public class Climate {
	
	float min;
	float max;
	float rain;
	float pressure;
	float wind;
	float humid;
	String summary;
	
	public float getMin() {
		return min;
	}
	public float getMax() {
		return max;
	}
	public float getRain() {
		return rain;
	}
	public float getPressure() {
		return pressure;
	}
	public float getWind() {
		return wind;
	}
	public float getHumid() {
		return humid;
	}
	public String getSummary() {
		return summary;
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
	public void setPressure(float pressure) {
		this.pressure = pressure;
	}
	public void setWind(float wind) {
		this.wind = wind;
	}
	public void setHumid(float humid) {
		this.humid = humid;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	/**
	 * @param min
	 * @param max
	 * @param rain
	 * @param pressure
	 * @param wind
	 * @param humid
	 * @param summary
	 */
	public Climate(float min, float max, float rain, float pressure,
			float wind, float humid, String summary) {
		super();
		this.min = min;
		this.max = max;
		this.rain = rain;
		this.pressure = pressure;
		this.wind = wind;
		this.humid = humid;
		this.summary = summary;
	}
	

}
