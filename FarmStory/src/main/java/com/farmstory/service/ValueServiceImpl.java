package com.farmstory.service;

import java.util.ArrayList;

import com.farmstory.dao.ValueDao;
import com.farmstory.vo.Alarm;
import com.farmstory.vo.PlantVal;

public class ValueServiceImpl implements ValueService {
	
	private ValueDao valueDao;

	public void setValueDao(ValueDao valueDao) {
		this.valueDao = valueDao;
	}

	@Override
	public ArrayList<PlantVal> findValues(PlantVal plantVal) {
		return valueDao.findValues(plantVal);
	}

	@Override
	public ArrayList<PlantVal> findDayValues(PlantVal plantVal) {
		return valueDao.findDayValues(plantVal);
	}

	@Override
	public ArrayList<Alarm> findAlarms(String id) {
		return valueDao.findAlarms(id);
	}


}
