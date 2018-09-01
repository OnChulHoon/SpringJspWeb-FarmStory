package com.farmstory.dao;

import com.farmstory.vo.PlantVal;

public interface SensorDao {

	public void writeSensor(PlantVal plantVal);

	public void writeAlarm(PlantVal plantVal);

}
