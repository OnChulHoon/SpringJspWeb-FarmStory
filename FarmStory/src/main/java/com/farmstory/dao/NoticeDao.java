package com.farmstory.dao;

import java.util.List;

import com.farmstory.vo.Notice;

public interface NoticeDao {

	List<Notice> listBoard();

	void insertBoard(Notice not);

	void deleteBoard(int noticeNo);




}
