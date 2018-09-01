package com.farmstory.service;

import java.util.ArrayList;

import com.farmstory.vo.Plant;
import com.farmstory.vo.RegistPlant;

public interface RegistPlantService {

	void registPlant(RegistPlant registplant);

	ArrayList<Plant> showPlant();

	ArrayList<Plant> searchPlant(String plaName);

	int potNoTest(String regPotNo);

	ArrayList<RegistPlant> findRegistFlowerpotByMemId(String memId);

	void deleteMyFlowerpotByRegPotNo(String regPotNo);

}