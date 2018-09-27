package com.farmstory.dao;

import com.farmstory.vo.EmailSub;

public interface MessageDao {

	void insertEmailSubscribe(EmailSub emailSub);

	int selectSubscribeEmailBySubEmail(String subEmail);

}