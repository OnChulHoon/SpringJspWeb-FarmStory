package com.farmstory.dao;

import com.farmstory.mapper.MessageMapper;
import com.farmstory.vo.EmailSub;

public class MySqlMessageDao implements MessageDao {

	private MessageMapper messageMapper;

	public void setMessageMapper(MessageMapper messageMapper) {
		this.messageMapper = messageMapper;
	}
	
	@Override
	public void insertEmailSubscribe(EmailSub emailSub) {
		messageMapper.insertEmailSubscribe(emailSub);
	}
	
	@Override
	public int selectSubscribeEmailBySubEmail(String subEmail) {
		
		return messageMapper.selectSubscribeEmailBySubEmail(subEmail);
	}
	
}
