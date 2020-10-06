package com.kpc.landslide;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kpc.mapper.LandSlideMapper;





@Service
public class RankSlideServiceImpl implements LandSlideService {
	@Autowired
	LandSlideMapper dao;
	
//	@Override
//	public ArrayList<BoardVO> svcSelect(String searchKey, String searchStr) {
//		ArrayList<BoardVO> list = dao.blistBySearch(searchKey, searchStr);
//		return list;
//	}
//
//	@Override
//	public int svcInsert(BoardVO vo) {
//		//1. 게시판 입력
//		int res = dao.binsert(vo);
//		
//		//2. 입력된 내용 클라우드 전송
//		
//		//3. 입력된 내용 로그 기록
//		
//		return res;
//	}
//
//	@Override
//	public ArrayList<BoardVO> svcSelect() {
//		System.out.println("Service 실행.....");
//		ArrayList<BoardVO> list = dao.allList();
//		return list;
//	}
//
//	@Override
//	public BoardVO svcSelect(int bseq) {
//		BoardVO vo = dao.bview(bseq);
//		return vo;
//	}
//
//	@Override
//	public int svcUpdate(BoardVO vo) {
//		int res = dao.bupdate(vo);
//		return res;
//	}
//
//	@Override
//	public int svcDelete(int bseq) {
//		int res = dao.bdelete(bseq);
//		return res;
//	}
	//----------------------------------------------------------------------------
	@Override
	public ArrayList<LandSlideVO> svcRankSi() {
		ArrayList<LandSlideVO> list = dao.ranksi();
		return list;
	}

	@Override
	public ArrayList<LandSlideVO> svcRankGu(String province) {
		ArrayList<LandSlideVO> list = dao.rankgu(province);
		return list;
	}

	@Override
	public ArrayList<LandSlideVO2> svcRain(String province, String city) {
		ArrayList<LandSlideVO2> list = dao.rain(province, city);
		return list;
	}

	@Override
	public ArrayList<LandSlideVO3> svcMountain(String province) {
		ArrayList<LandSlideVO3> list = dao.mountain(province);
		return list;
	}

	@Override
	public ArrayList<LandSlideVO2> svcTemp(String province, String city) {
		ArrayList<LandSlideVO2> list = dao.temp(province, city);
		return list;
	}

	@Override
	public ArrayList<LandSlideVO2> svcTempMin(String province, String city) {
		ArrayList<LandSlideVO2> list = dao.tempmin(province, city);
		return list;
	}
	
	@Override
	public ArrayList<LandSlideVO4> svcDonutchart2(String province, String city) {
		ArrayList<LandSlideVO4> list = dao.donutchart2(province, city);
		return list;
	}

	@Override
	public ArrayList<LandSlideVO5> svcDonutchart1(String province, String city) {
		ArrayList<LandSlideVO5> list = dao.donutchart1(province, city);
		return list;
	}

}
