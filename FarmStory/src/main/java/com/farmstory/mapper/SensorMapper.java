package com.farmstory.mapper;

import com.farmstory.vo.PlantVal;

public interface SensorMapper {
	
	void writeSensor(PlantVal plantVal);

	void writeAlarm(PlantVal plantVal);
}
