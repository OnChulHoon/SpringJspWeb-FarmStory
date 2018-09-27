package com.farmstory.service;

import com.farmstory.dao.MessageDao;
import com.farmstory.vo.EmailSub;

public class MessageServiceImpl implements MessageService {

	private MessageDao messageDao;

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	
	@Override
	public void writeEmailSubscribe(EmailSub emailSub) {
		messageDao.insertEmailSubscribe(emailSub);
	}
	
	@Override
	public boolean findSubscribeEmailBySubEmail(String subEmail) {
		// 회원가입 할 때 중복 이메일을 체크한다.
		int checkedMemEmail = messageDao.selectSubscribeEmailBySubEmail(subEmail);
		// 중복된 이메일이 있으면 false를 반환하고 없으면 true를 반환한다.
		if (checkedMemEmail > 0) {
			return false;
		} else {
			return true;
		}
	}
	
}
