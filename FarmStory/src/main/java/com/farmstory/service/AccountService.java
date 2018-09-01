package com.farmstory.service;

import com.farmstory.vo.Account;

public interface AccountService {

	void registerMember(Account account);

	Account findMember(String userInputId, String userInputPw);

	String findMemberByPw(String userInputId, String userInputPw);

	Account signInMoblie(String id, String password);

	boolean findMemberIdByMemId(String memId);

	boolean findMemberEmailByMemEmail(String memEmail);

	
}