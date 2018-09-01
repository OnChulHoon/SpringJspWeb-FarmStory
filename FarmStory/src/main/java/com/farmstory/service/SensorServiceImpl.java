package com.farmstory.service;

import com.farmstory.dao.SensorDao;
import com.farmstory.vo.PlantVal;

public class SensorServiceImpl implements SensorService {
	
	private SensorDao sensorDao;

	public void setSensorDao(SensorDao sensorDao) {
		this.sensorDao = sensorDao;
	}
	
	@Override
	public void writeSensor(PlantVal plantVal) {
		sensorDao.writeSensor(plantVal);
		int value5 = plantVal.getPlvChk();
		if(value5 == 1) {
		sensorDao.writeAlarm(plantVal);
		}
	}
	
}
