package com.farmstory.service;

import java.util.List;

import com.farmstory.vo.Notice;

public interface NoticeService {


	List<Notice> listBoard();

	void insertBoard(Notice not);

	void deleteBoard(int noticeNo);

	


}
