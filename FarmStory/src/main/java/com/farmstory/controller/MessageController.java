package com.farmstory.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmstory.service.MessageService;
import com.farmstory.vo.EmailSub;

@Controller
public class MessageController {
	
	@Autowired
	@Qualifier(value = "messageService")
	private MessageService messageService;
	
	@GetMapping(value = "/coming_soon.action")
	public String showComingSoon(String msg) {
		String returnUrl= "";
		if(msg.equals("shop") || msg.equals("basket")) {
			returnUrl = "/message/coming-soon-shop";
		}else if(msg.equals("mobile")) {
			returnUrl = "/message/coming-soon-mobile";
		}
		return returnUrl;
	}
	
	@ResponseBody
	@PostMapping(value="/email-subscribe-register.action")
	public String writeEmailSubscribe(EmailSub emailSub) {
		
		String returnMsg = "";
		if(emailSub.getSubEmail() != null &&
		   emailSub.getSubEmail() != "") {
			messageService.writeEmailSubscribe(emailSub);
			returnMsg = "success";
		}else {
			returnMsg = "error";
		}
		
		return returnMsg;
	}
	
	@ResponseBody
	@PostMapping(value = "/subscribe_email_exists.action")
	public boolean isSubscribeEmailExists(String subEmail){
		
		return messageService.findSubscribeEmailBySubEmail(subEmail);
		
	}
}
