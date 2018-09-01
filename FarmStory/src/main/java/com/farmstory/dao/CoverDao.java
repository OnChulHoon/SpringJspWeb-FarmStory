package com.farmstory.dao;

import java.util.List;

import com.farmstory.vo.Cover;

public interface CoverDao {

	//�Ұ� ���
	List<Cover> selectCoverList();
	
	List<Cover> selectTop3CoverList();
	
	//�Ұ� ����
	void insertCover(Cover cover);
	
	//�Ұ� �Һ��� ����
	List<Cover> selectCoverInfoByCovNo();
	
	//�Ұ� ������ ����
	Cover selectCovermInfoByCovNo(int covNo);
	
	//�Ұ� ����
	void updateCover(Cover cover);
	
	//�Ұ� ����
	void deleteCover(int covNo);





}
