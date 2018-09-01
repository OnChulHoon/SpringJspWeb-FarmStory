package com.farmstory.mapper;

import java.util.ArrayList;

import com.farmstory.vo.Alarm;
import com.farmstory.vo.PlantVal;

public interface ValueMapper {

	ArrayList<PlantVal> selectValues(PlantVal plantVal);

	ArrayList<PlantVal> selectDayValues(PlantVal plantVal);

	ArrayList<Alarm> selectAlarms(String id);

	void updateAlarms(String id);

}
