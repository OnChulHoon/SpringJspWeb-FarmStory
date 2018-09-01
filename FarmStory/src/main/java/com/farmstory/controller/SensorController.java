package com.farmstory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmstory.service.SensorService;
import com.farmstory.vo.PlantVal;

@Controller
public class SensorController {

	@Autowired
	@Qualifier("sensorService")
	private SensorService sensorService;

	//////////////////////////////////////////////////////////////////////////////////////////////
	// 센서 값 받아오는 부분 //
	//////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping(value = "sensor/write.action")
	@ResponseBody
	public String helloArduino(int value1, int value2, int value3, int value4, String potnum,int value5, PlantVal plantVal) {
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		System.out.println(value4);
		System.out.println(potnum);
		System.out.println(value5);
		plantVal.setRegPotNo(potnum);
		plantVal.setPlvType("온도");
		plantVal.setPlvVal(value1);
		sensorService.writeSensor(plantVal);
		plantVal.setPlvType("습도");
		plantVal.setPlvVal(value2);
		sensorService.writeSensor(plantVal);
		plantVal.setPlvType("조도");
		plantVal.setPlvVal(value3);
		sensorService.writeSensor(plantVal);
		plantVal.setPlvType("압력");
		plantVal.setPlvVal(value4);
		plantVal.setPlvChk(value5);
		sensorService.writeSensor(plantVal);
		return potnum;
	}
	///////////////////////////////////////////////////////////////////////////////////////////////
	// 압력 값만 받아오는 부분 //
	///////////////////////////////////////////////////////////////////////////////////////////////
	

}
