package com.farmstory.service;

import com.farmstory.common.Util;
import com.farmstory.dao.AccountDao;
import com.farmstory.vo.Account;

public class AccountServiceImpl implements AccountService {
	
	private AccountDao accountDao;

	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}
	
	@Override
	public void registerMember(Account account) {
		
		// 전달 받은 비밀번호를 암호화하여 Account vo객체에 다시 저장한다.
		String hashedPw = Util.getHashedString(account.getMemPw(), "SHA-256");
		account.setMemPw(hashedPw);
		
		accountDao.insertMember(account);
		
	}
	
	@Override
	public Account findMember(String userInputId, String userInputPw) {
		
		// 전달 받은 비밀번호를 암호화하여 다시 저장한다.
		String hashedPw = Util.getHashedString(userInputPw, "SHA-256");
		
		return accountDao.selectMember(userInputId, hashedPw);
	}
	
	@Override
	public String findMemberByPw(String userInputId, String userInputPw) {
		
		// 전달받은 아이디로 비밀번호를 DB에서 찾아온다.
		String memPw = accountDao.selectMemberByPw(userInputId);
		// 전달받은 비밀번호를 암호화하여 다시 저장한다.
		String hashedPw = Util.getHashedString(userInputPw, "SHA-256");
		
		String responseMessage = "";
		if(memPw == null) { // 아이디가 없으면 아래 응답메시지를 반환한다.
			responseMessage = "wrongId";
		}else if(hashedPw.equals(memPw) != true){ // DB에서 찾아온 비밀번호와 사용자가 입력한 비밀번호를 비교한다.
			// 비밀번호가 일치하지 않으면 아래 응답메시지를 반환한다.
			responseMessage = "wrongPw";
		}
		
		return responseMessage;
	}

	@Override
	public Account signInMoblie(String id, String password) {
		
		Account account = accountDao.signInMoblie(id, password);
		return account;	
	}
	
	@Override
	public boolean findMemberIdByMemId(String memId) {
		// 회원가입 할 때 중복 아이디를 체크한다.
		int checkedMemId = accountDao.selectMemberIdByMemId(memId);
		// 중복된 아이디가 있으면 false를 반환하고 없으면 true를 반환한다.
		if (checkedMemId > 0) {
			return false;
		} else {
			return true;
		}
	}
	
	@Override
	public boolean findMemberEmailByMemEmail(String memEmail) {
		// 회원가입 할 때 중복 이메일을 체크한다.
		int checkedMemEmail = accountDao.selectMemberEmailByMemEmail(memEmail);
		// 중복된 이메일이 있으면 false를 반환하고 없으면 true를 반환한다.
		if (checkedMemEmail > 0) {
			return false;
		} else {
			return true;
		}
	}

}
