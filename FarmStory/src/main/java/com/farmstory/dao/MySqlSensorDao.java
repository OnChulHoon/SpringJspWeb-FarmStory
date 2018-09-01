package com.farmstory.dao;

import com.farmstory.mapper.SensorMapper;
import com.farmstory.vo.PlantVal;

public class MySqlSensorDao implements SensorDao{
	private SensorMapper sensorMapper;
	
	public void setSensorMapper(SensorMapper sensorMapper) {
		this.sensorMapper = sensorMapper;
	}
	@Override
	public void writeSensor(PlantVal plantval) {
		sensorMapper.writeSensor(plantval);
	}
	@Override
	public void writeAlarm(PlantVal plantVal) {
		sensorMapper.writeAlarm(plantVal);
	}
	 
	

}
