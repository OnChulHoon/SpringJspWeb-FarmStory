package com.farmstory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {

	@GetMapping(value="/shop_list.action")
	public String showShop() {
		
		return "";
	}
}
