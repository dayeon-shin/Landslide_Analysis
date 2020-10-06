package com.kpc.landslide;

import java.util.ArrayList;



public interface LandSlideService {

			

	// ranking 시/도
	public ArrayList<LandSlideVO> svcRankSi();
			
	// ranking 구
	public ArrayList<LandSlideVO> svcRankGu(String province);
	
	//강수량 그래프
	public ArrayList<LandSlideVO2> svcRain(String province, String city);
	
	//산사태 그래프
	public ArrayList<LandSlideVO3> svcMountain(String province);
	
	//평균최고기온
	public ArrayList<LandSlideVO2> svcTemp(String province, String city);
	
	//평균최저기온
	public ArrayList<LandSlideVO2> svcTempMin(String province, String city);
	
	//도넛 2020
	public ArrayList<LandSlideVO4> svcDonutchart2(String province, String city);
	
	//도넛 2019
	public ArrayList<LandSlideVO5> svcDonutchart1(String province, String city);
}
