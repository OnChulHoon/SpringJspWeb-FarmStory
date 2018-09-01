package com.farmstory.controller;

import static org.springframework.web.bind.annotation.RequestMethod.*; 

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmstory.service.RegistPlantService;
import com.farmstory.vo.Account;
import com.farmstory.vo.Plant;
import com.farmstory.vo.RegistPlant;

@Controller
public class RegistPlantController {

	@Autowired
	@Qualifier(value="registPlantService")
	private RegistPlantService registPlantService;  
	
	@RequestMapping(value="/plant_regist.action", method=GET)
		public String showPlant(Plant plant, Model model, HttpSession session) {
			
			//db에서 plant테이블 정보를 가져오는 구문
			ArrayList<Plant> plants = registPlantService.showPlant();
			//jsp로 보내주는 model
			model.addAttribute("plants", plants);
			
		return "plant/plant-regist";
	}
	
	
	@RequestMapping(value="/plant_regist.action", method=POST)
		public String registPlant(RegistPlant registplant,
				HttpSession session
				) {
			Account account = (Account) session.getAttribute("loginuser");
			registplant.setMemId(account.getMemId());
			
			System.out.println(registplant.getMemId());
			
			registPlantService.registPlant(registplant);
		
			
		return "redirect:my_flowerpot_list.action";
	}
	
	@RequestMapping(value="/search_plant.action", method=POST)
	@ResponseBody
	public ArrayList<Plant> searchPlant(String plaName) {
		
		ArrayList<Plant> plants = registPlantService.searchPlant(plaName);
		
	return plants;
}
	@RequestMapping(value="/potNo-test.action", method=POST)
	@ResponseBody
	public Map<Object, Object> potNoTest(String regPotNo) {
		
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = registPlantService.potNoTest(regPotNo);
        map.put("cnt", count);
 
        return map;
	}
	
	@RequestMapping(value="/my_flowerpot_list.action", method=GET)
	public String showMyFlowerpots(Model model, HttpSession session) {
		
		Account account = (Account) session.getAttribute("loginuser");
		String memId = account.getMemId();
		//db에서 등록한 화분의 정보를 가져오는 구문
		ArrayList<RegistPlant> myFlowerpots = registPlantService.findRegistFlowerpotByMemId(memId);
		//jsp로 보내주는 model
		model.addAttribute("myFlowerpots", myFlowerpots);
		
	return "plant/plant-regist-list";
}
	
	@RequestMapping(value="/my_flowerpot_delete.action", method=GET)
	@ResponseBody
	public String deleteMyFlowerpot(String regPotNo) {
		
		registPlantService.deleteMyFlowerpotByRegPotNo(regPotNo);

	return "success";
}
	
}
