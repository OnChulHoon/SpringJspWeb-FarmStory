package com.farmstory.dao;

import java.util.List;

import com.farmstory.mapper.CoverMapper;
import com.farmstory.vo.Cover;

public class MySqlCoverDao implements CoverDao {
	
	private CoverMapper coverMapper;

	public void setCoverMapper(CoverMapper coverMapper) {
		this.coverMapper = coverMapper;
	}
    
	//소개 목록
	@Override
	public List<Cover> selectCoverList() {
		List<Cover> Coverlist = coverMapper.selectCoverList();
		return Coverlist;
	}
	
	//소개 목록 소비자
	@Override
	public List<Cover> selectTop3CoverList() {
		List<Cover> Coverlist = coverMapper.selectTop3CoverList();
		return Coverlist;
	}
	
	//소개 쓰기
	@Override
	public void insertCover(Cover cover) {
		coverMapper.insertCover(cover);
		
	}
	
	//소개 목록 소지바 이전 버전
	@Override
	public List<Cover> selectCoverInfoByCovNo() {
		List<Cover> Coverlist = coverMapper.selectCoverInfoByCovNo();
		return Coverlist;
	}

	//소개 상세보기
	@Override
	public Cover selectCovermInfoByCovNo(int covNo) {
		Cover Coverlist = coverMapper.selectCovermInfoByCovNo(covNo);
		return Coverlist;
	}
	
	//소개 수정
	@Override
	public void updateCover(Cover cover) {
		coverMapper.updateCover(cover);
		
	}

	//소개 삭제
	@Override
	public void deleteCover(int covNo) {
		coverMapper.deleteCover(covNo);
		
	}


}
