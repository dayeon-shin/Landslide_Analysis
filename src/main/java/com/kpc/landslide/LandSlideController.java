package com.kpc.landslide;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LandSlideController {
	
	private static final Logger logger = LoggerFactory.getLogger(LandSlideController.class);
	@Autowired
	RankSlideServiceImpl svc;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		String province= "강원도";
		ArrayList<LandSlideVO> list = svc.svcRankSi();
		ArrayList<LandSlideVO> list2 = svc.svcRankGu(province);
		model.addAttribute("ranksi", list);
		model.addAttribute("rankgu", list2);
		System.out.println(list);
		System.out.println(list2);
		return "main";
	}
	
	@RequestMapping(value = "/landslidechart1.do", method = RequestMethod.GET)
	public void landslidechart1(@RequestParam(value = "kkk") String province, 
			@RequestParam(value = "ccc") String city, Model model,
			HttpServletResponse response) {
		System.out.println(province);
		System.out.println(city);
		ArrayList<LandSlideVO2> list = svc.svcRain(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/landslidechart1_1.do", method = RequestMethod.GET)
	public void landslidechart1_1(@RequestParam(value = "pkkk") String province, 
			@RequestParam(value = "pccc") String city, Model model,
			HttpServletResponse response) {
		System.out.println(province);
		System.out.println(city);
		ArrayList<LandSlideVO2> list = svc.svcRain(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/landslidechart2.do", method= RequestMethod.GET)
	public void landslidechart2(@RequestParam(value = "ppp") String province, Model model,
			HttpServletResponse response) {
		System.out.println("province="+province);
		ArrayList<LandSlideVO3> list = svc.svcMountain(province);
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/search.do", method= RequestMethod.GET)
	public String search(@ModelAttribute LandSlideVO vo, Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			model.addAttribute("addchart", vo);
			System.out.println("jsp 넘기기"+vo.getCity());
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "addchart";
		
	
	}
	
	@RequestMapping(value = "/avgmaxtemp.do", method = RequestMethod.GET)
	public void avgmaxtemp(@RequestParam(value = "province") String province, 
			@RequestParam(value = "city") String city, Model model,
			HttpServletResponse response) {
		System.out.println(province);
		System.out.println(city);
		ArrayList<LandSlideVO2> list = svc.svcTemp(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/avgmintemp.do", method= RequestMethod.GET)
	public void avgmintemp(@RequestParam(value = "aminp") String province, 
			@RequestParam(value = "aminc") String city, Model model,
			HttpServletResponse response) {
		ArrayList<LandSlideVO2> list = svc.svcTempMin(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/donutchart2.do", method = RequestMethod.GET)
	public void donutchart2(@RequestParam(value = "dminp") String province, 
			@RequestParam(value = "dminc") String city, Model model,
			HttpServletResponse response) {
		System.out.println(province);
		System.out.println(city);
		ArrayList<LandSlideVO4> list = svc.svcDonutchart2(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/donutchart1.do", method = RequestMethod.GET)
	public void donutchart1(@RequestParam(value = "ddminp") String province, 
			@RequestParam(value = "ddminc") String city, Model model,
			HttpServletResponse response) {
		System.out.println(province);
		System.out.println(city);
		ArrayList<LandSlideVO5> list = svc.svcDonutchart1(province, city);
		
		
		Gson gson = new Gson();
		//객체(list)를  <--> 글자(String)로 변환
		String jsonStr = gson.toJson(list);
		System.out.println(jsonStr);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println(jsonStr); 
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
}
