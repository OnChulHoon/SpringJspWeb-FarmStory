package com.farmstory.mapper;

import java.util.List;

import com.farmstory.vo.Cover;

public interface CoverMapper {
    
	//소개 목록
	List<Cover> selectCoverList();
	
	//소비사용 소개 보기
	List<Cover> selectTop3CoverList();
	
	//소개 쓰기
	void insertCover(Cover cover);
	
	//소비자용 소개 샘플 
	List<Cover> selectCoverInfoByCovNo();
	
	//소개 상세보기
	Cover selectCovermInfoByCovNo(int covNo);
	
	//소개 수정
	void updateCover(Cover cover);
	
	//소개 삭제
	void deleteCover(int covNo);


}
