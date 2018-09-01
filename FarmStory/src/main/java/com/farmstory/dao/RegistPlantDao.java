package com.farmstory.dao;

import java.util.ArrayList;

import com.farmstory.mapper.RegistPlantMapper;
import com.farmstory.vo.Plant;
import com.farmstory.vo.RegistPlant;

public interface RegistPlantDao {

	void setRegistPlantMapper(RegistPlantMapper registPlantMapper);

	void insertRegistPlant(RegistPlant registPlant);

	ArrayList<Plant> showPlant();

	ArrayList<Plant> searchPlant(String plaName);

	int potNoTest(String regPotNo);

	ArrayList<RegistPlant> selectRegistFlowerpotByMemId(String memId);

	void deleteMyFlowerpotByRegPotNo(String regPotNo);

}