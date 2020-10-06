package com.kpc.landslide;

public class LandSlideVO5 {
	// db property
	private String province; //시/도
	private String city; //도시명 (시/군/구)
	private String k2019; //예보
	private String j2019; //예보날짜
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
	public String getK2019() {
		return k2019;
	}
	public void setK2019(String k2019) {
		this.k2019 = k2019;
	}
	public String getJ2019() {
		return j2019;
	}
	public void setJ2019(String j2019) {
		this.j2019 = j2019;
	}
	@Override
	public String toString() {
		return "LandSlideVO4 [province=" + province + ", city=" + city + ", k2019=" + k2019 + ", j2019=" + j2019 + "]";
	}
	
	
	
	
}
