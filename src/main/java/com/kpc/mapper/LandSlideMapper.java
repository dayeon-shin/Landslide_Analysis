package com.kpc.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kpc.landslide.LandSlideVO;
import com.kpc.landslide.LandSlideVO2;
import com.kpc.landslide.LandSlideVO3;
import com.kpc.landslide.LandSlideVO4;
import com.kpc.landslide.LandSlideVO5;



@Repository(value="dao")
@Mapper
public interface LandSlideMapper {
	// BoardMapper.xml의 sql id 가 BoardMapper 인터페이스의 함수명과 일치해야 한다.
//	public ArrayList<BoardVO> allList();
//	
//	public int boardCount();
//
//	public ArrayList<BoardVO> blist( 
//			@Param("startSeq") int startSeq
//			,@Param("endSeq")  int endSeq);
//
//	public ArrayList<BoardVO> blistBySearch(
//			@Param("searchKey")  String searchKey
//			,@Param("searchStr")  String searchStr);
//
//
//
//	public int bupdate(BoardVO vo);
//
//	public int bdelete(int bseq);
//
//	public int  binsert(BoardVO vo);
//
//	public BoardVO bview(int bseq);
	
	// ranking 
	public ArrayList<LandSlideVO> ranksi();
	
	public ArrayList<LandSlideVO> rankgu(String province);
	
	public ArrayList<LandSlideVO2> rain(@Param("province") String province, @Param("city")String city);
	
	public ArrayList<LandSlideVO3> mountain(@Param("province") String province);
	
	public ArrayList<LandSlideVO2> temp(@Param("province") String province, @Param("city")String city);
	
	public ArrayList<LandSlideVO2> tempmin(@Param("province") String province, @Param("city")String city);
	
	public ArrayList<LandSlideVO4> donutchart2(@Param("province") String province, @Param("city")String city);
	
	public ArrayList<LandSlideVO5> donutchart1(@Param("province") String province, @Param("city")String city);
}
