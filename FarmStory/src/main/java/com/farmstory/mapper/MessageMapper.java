package com.farmstory.mapper;

import com.farmstory.vo.EmailSub;

public interface MessageMapper {

	void insertEmailSubscribe(EmailSub emailSub);
	
	int selectSubscribeEmailBySubEmail(String subEmail);
}
