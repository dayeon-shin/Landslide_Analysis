package com.kpc.landslide;

public class LandSlideVO {
	// db property
	private String province; //시/도
	private String city; //도시명 (시/군/구)
	private String forecast; //예보
	private String mydate; //예보날짜
	
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}
	public String getMydate() {
		return mydate;
	}
	public void setMydate(String mydate) {
		this.mydate = mydate;
	}
	
	@Override
	public String toString() {
		return "LandSlideVO [province=" + province + ", city=" + city + ", forecast=" + forecast + ", mydate=" + mydate
				+ "]";
	}
	

	
	
}
