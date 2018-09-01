package com.farmstory.mapper;

import java.util.HashMap;

import com.farmstory.vo.Account;

public interface AccountMapper {

	void insertMember(Account account);
	
	Account selectMember(HashMap<String, Object> params);
	
	String selectMemberByPw(String userInputId);

	Account signInMoblie(HashMap<String, Object> params);

	int selectMemberIdByMemId(String memId);
	
	int selectMemberEmailByMemEmail(String memEmail);

}
