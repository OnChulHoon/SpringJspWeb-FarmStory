package com.farmstory.service;

import java.util.List;

import com.farmstory.vo.Cover;

public interface CoverService {
    
	//�Ұ� ���
	List<Cover> viewCoverList();
	
	List<Cover> viewTop3CoverList();

	//�Ұ� ����
	void writecover(Cover cover);

	//�Ұ� �Һ��� ����
	List<Cover> findCoverBycovNo();
	
	//�Ұ� ������ ����
	Cover findCoverBycovNom(int covNo);
    
	//�Ұ� ����
	void modifyCoverInfo(Cover cover);
	
	//�Ұ� ����
	void deleteCoverInfo(String covNo);

	void deleteCoverInfo(int covNo);


}
