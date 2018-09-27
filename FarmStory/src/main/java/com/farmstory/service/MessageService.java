package com.farmstory.service;

import com.farmstory.vo.EmailSub;

public interface MessageService {

	void writeEmailSubscribe(EmailSub emailSub);

	boolean findSubscribeEmailBySubEmail(String subEmail);

}