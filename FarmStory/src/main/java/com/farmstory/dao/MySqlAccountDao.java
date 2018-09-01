package com.farmstory.dao;

import java.util.HashMap;

import com.farmstory.mapper.AccountMapper;
import com.farmstory.vo.Account;

public class MySqlAccountDao implements AccountDao {

	private AccountMapper accountMapper;

	public void setAccountMapper(AccountMapper accountMapper) {
		this.accountMapper = accountMapper;
	}
	
	@Override
	public void insertMember(Account account) {
		
		accountMapper.insertMember(account);
		
	}
	
	@Override
	public Account selectMember(String userInputId, String userInputPw) {
		
		// 넘겨 받은 아이디와 비밀번호 값을
		// DB에서 조회하기 위해 HashMap으로 저장하여 보낸다.
		HashMap<String, Object> params = new HashMap<>();
		params.put("userInputId", userInputId);
		params.put("userInputPw", userInputPw);
		
		return accountMapper.selectMember(params);
	}
	
	@Override
	public String selectMemberByPw(String userInputId) {
		
		return accountMapper.selectMemberByPw(userInputId);
	}

	@Override
	public Account signInMoblie(String id, String password) {
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("password", password);
		
		Account account = accountMapper.signInMoblie(params);
		
		return account;
	}

	@Override
	public int selectMemberIdByMemId(String memId) {
		
		return accountMapper.selectMemberIdByMemId(memId);
	}
	
	@Override
	public int selectMemberEmailByMemEmail(String memEmail) {
		
		return accountMapper.selectMemberEmailByMemEmail(memEmail);
	}

	
}
