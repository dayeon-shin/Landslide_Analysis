package com.kpc.landslide;

public class LandSlideVO4 {
	// db property
	private String province; //시/도
	private String city; //도시명 (시/군/구)
	private String k2020; //예보
	private String j2020; //예보날짜
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
	public String getK2020() {
		return k2020;
	}
	public void setK2020(String k2020) {
		this.k2020 = k2020;
	}
	public String getJ2020() {
		return j2020;
	}
	public void setJ2020(String j2020) {
		this.j2020 = j2020;
	}
	@Override
	public String toString() {
		return "LandSlideVO4 [province=" + province + ", city=" + city + ", k2020=" + k2020 + ", j2020=" + j2020 + "]";
	}
	
	
	
	
}
