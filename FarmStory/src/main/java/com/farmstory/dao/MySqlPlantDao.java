package com.farmstory.dao;

import java.util.HashMap;
import java.util.List;

import com.farmstory.mapper.PlantMapper;
import com.farmstory.vo.Plant;
import com.farmstory.vo.PlantImg;

public class MySqlPlantDao implements PlantDao  {

	private PlantMapper plantMapper;

	public void setPlantMapper(PlantMapper plantMapper) {
		this.plantMapper = plantMapper;
	}
	
	@Override
	public void insertPlantInfo(Plant plant) {
		
		plantMapper.insertPlantInfo(plant);
	}
	
	@Override
	public void insertPlantInfoImages(PlantImg attachment) {
		
		plantMapper.insertPlantInfoImages(attachment);
	}
	
	@Override
	public List<Plant> selectPlantInfosWithThumnailImages(){
		
		return plantMapper.selectPlantInfosWithThumnailImages();
	}
	
	@Override
	public Plant selectPlantInfoByPlaNo(int plaNo) {
		
		return plantMapper.selectPlantInfoByPlaNo(plaNo);
	}
	
	@Override
	public List<PlantImg> selectImagesPlantInfoByPlaNo(int plaNo) {
		
		return plantMapper.selectImagesPlantInfoByPlaNo(plaNo);
	}
	
	@Override
	public void deletePlantInfoByPlaNo(int plaNo) {
		
		plantMapper.deletePlantInfoByPlaNo(plaNo);
	}
	
	@Override
	public void deleteImagesPlantInfoByPlaNo(int plaNo) {
		
		plantMapper.deleteImagesPlantInfoByPlaNo(plaNo);
	}
	
	@Override
	public List<PlantImg> selectModifyImagesPlantInfoByPlaNo(int plaNo){
		
		return plantMapper.selectModifyImagesPlantInfoByPlaNo(plaNo);
	}
	
	@Override
	public int selectLastImgIdxValueByPlaNo(int plaNo) {
		
		return plantMapper.selectLastImgIdxValueByPlaNo(plaNo);
	}
	
	@Override
	public void updatePlantInfo(Plant plant) {
		
		plantMapper.updatePlantInfo(plant);
	}
	
	@Override
	public void updateThumnailImagePlantInfo(PlantImg plantImg) {
		
		plantMapper.updateThumnailImagePlantInfo(plantImg);
	}
	
	@Override
	public void deleteOldImageFileByPlaNoAndImgIdx(HashMap<String, Object> params) {
		
		plantMapper.deleteOldImageFileByPlaNoAndImgIdx(params);
	}
	
}
