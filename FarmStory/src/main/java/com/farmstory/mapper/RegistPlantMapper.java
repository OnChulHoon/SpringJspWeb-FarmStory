package com.farmstory.mapper;

import java.util.ArrayList;

import com.farmstory.vo.Plant;
import com.farmstory.vo.RegistPlant;

public interface RegistPlantMapper {

	void insertRegistPlant (RegistPlant registPlant);

	ArrayList<Plant> selectShowPlant();

	ArrayList<Plant> searchPlant(String plaName);

	int potNoTest(String regPotNo);
	
	ArrayList<RegistPlant> selectRegistFlowerpotByMemId(String memId);
	
	void deleteMyFlowerpotByRegPotNo(String regPotNo);
	
}
