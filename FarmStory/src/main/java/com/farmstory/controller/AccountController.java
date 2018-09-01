package com.farmstory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmstory.common.Util;
import com.farmstory.service.AccountService;
import com.farmstory.vo.Account;

@Controller
public class AccountController {
	
	@Autowired
	@Qualifier(value = "accountService")
	private AccountService accountService;
	
	@ResponseBody
	@PostMapping(value = "/register.action")
	public String registerMember(Account account) {
		
		accountService.registerMember(account);
		return "success";
		
	}
	
	@ResponseBody
	@PostMapping(value = "/member_id_exists.action")
	public boolean isMemberIdExists(String memId){
		
		return accountService.findMemberIdByMemId(memId);
		
	}
	
	@ResponseBody
	@PostMapping(value = "/member_email_exists.action")
	public boolean isMemberEmailExists(String memEmail){
		
		return accountService.findMemberEmailByMemEmail(memEmail);
		
	}
	
	@ResponseBody
	@GetMapping(value = "/login.action")
	public String loginCheckMember(String userInputId, String userInputPw, HttpSession session, Account account,
			HttpServletRequest request) {
		
		account = accountService.findMember(userInputId, userInputPw);
		
		String responseMessage = "";
			if (account != null) { 
				// 아이디와 비밀번호가 일치하면 session에 저장한다.
				session.setAttribute("loginuser", account);
				// 로그인 성공의 응답메시지를 반환한다.
				responseMessage = "success";
			} else { // 아이디와 비밀번호가 일치하지 않으면 실행된다.
				// 아이디가 잘못되었는지 비밀번호가 잘못되었는지를 확인하여 응답메시지에 저장한다.
				responseMessage = accountService.findMemberByPw(userInputId, userInputPw);
			}
			
		return responseMessage;
	}
	
	@ResponseBody
	@GetMapping(value = "/logout.action")
	public String logoutMember(HttpSession session) {
		
		// session 객체에 담긴 회원 정보 데이터를 삭제한다.
		session.removeAttribute("loginuser");
		
		return "success";
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 모바일 회원관리 시작	
	
	@GetMapping(value = "/msignin.action")
	@ResponseBody
	public Account signInMoblie(String id, String password){
		
		System.out.printf(id);
		System.out.printf(password);
		
		String hashedPw = Util.getHashedString(password, "SHA-256");
		Account account = accountService.signInMoblie(id, hashedPw);
		
		// 객체를 반환하고 @ResponseBody를 설정한 경우
		// 이 객체를 JSON 문자열로 자동 변환 -> JacksonMapper				
		return account;
		
	}
	
	@GetMapping(value = "/msignup.action")
	@ResponseBody
	public String mSignUp(Account account, BindingResult br) {
		
		System.out.println(account.getMemEmail());
		
		accountService.registerMember(account);
						
		return "success";
	}
	
	

}
