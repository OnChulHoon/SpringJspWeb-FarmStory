package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.NoticeDao;
import com.farmstory.vo.Notice;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}

	@Override
	public List<Notice> listBoard() {
		return noticeDao.listBoard();

	}

	@Override
	public void insertBoard(Notice not) {
		noticeDao.insertBoard(not);
	}

	@Override
	public void deleteBoard(int noticeNo) {
		noticeDao.deleteBoard(noticeNo);
	}

}
