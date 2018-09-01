package com.farmstory.dao;

import java.util.ArrayList;

import com.farmstory.mapper.RegistPlantMapper;
import com.farmstory.vo.Plant;
import com.farmstory.vo.RegistPlant;

public class MySqlRegistPlantDao implements RegistPlantDao {
	
	private RegistPlantMapper registPlantMapper;
	
	
	@Override
	public void setRegistPlantMapper(RegistPlantMapper registPlantMapper) {
		this.registPlantMapper = registPlantMapper;
	}
	
	
	@Override
	public void insertRegistPlant(RegistPlant registPlant) {
		
		registPlantMapper.insertRegistPlant(registPlant);
	}


	@Override
	public ArrayList<Plant> showPlant() {
		
		
		return registPlantMapper.selectShowPlant();
	}


	@Override
	public ArrayList<Plant> searchPlant(String plaName) {
		return registPlantMapper.searchPlant(plaName);
	}


	@Override
	public int potNoTest(String regPotNo) {
		return registPlantMapper.potNoTest(regPotNo);
	}
	
	@Override
	public ArrayList<RegistPlant> selectRegistFlowerpotByMemId(String memId){
	 	return registPlantMapper.selectRegistFlowerpotByMemId(memId);
	}
	
	@Override
	public void deleteMyFlowerpotByRegPotNo(String regPotNo) {
		
		registPlantMapper.deleteMyFlowerpotByRegPotNo(regPotNo);
	}
}
