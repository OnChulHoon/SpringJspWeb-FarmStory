package com.farmstory.dao;

import com.farmstory.vo.Account;

public interface AccountDao {

	void insertMember(Account account);

	Account selectMember(String userInputId, String userInputPw);

	String selectMemberByPw(String userInputId);

	Account signInMoblie(String id, String password);

	int selectMemberIdByMemId(String memId);

	int selectMemberEmailByMemEmail(String memEmail);


}