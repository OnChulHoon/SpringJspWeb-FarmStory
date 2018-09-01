package com.farmstory.mapper;

import java.util.List;

import com.farmstory.vo.Notice;

public interface NoticeMapper {

	List<Notice> listBoard();

	void insertBoard(Notice not);

	void deleteBoard(int noticeNo);

	
}
