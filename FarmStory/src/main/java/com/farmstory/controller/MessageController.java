package com.farmstory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@GetMapping(value="/coming_soon.action")
	public String showComingSoon(String msg) {
		String returnUrl= "";
		if(msg.equals("shop") || msg.equals("basket")) {
			returnUrl = "/message/coming-soon-shop";
		}else if(msg.equals("mobile")) {
			returnUrl = "/message/coming-soon-mobile";
		}
		return returnUrl;
	}
}
