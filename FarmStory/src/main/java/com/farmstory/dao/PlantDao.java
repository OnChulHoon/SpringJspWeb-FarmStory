package com.farmstory.dao;

import java.util.HashMap;
import java.util.List;

import com.farmstory.vo.Plant;
import com.farmstory.vo.PlantImg;

public interface PlantDao {

	void insertPlantInfo(Plant plant);

	void insertPlantInfoImages(PlantImg attachment);

	List<Plant> selectPlantInfosWithThumnailImages();

	Plant selectPlantInfoByPlaNo(int plaNo);

	List<PlantImg> selectImagesPlantInfoByPlaNo(int plaNo);

	void deletePlantInfoByPlaNo(int plaNo);

	void deleteImagesPlantInfoByPlaNo(int plaNo);

	List<PlantImg> selectModifyImagesPlantInfoByPlaNo(int plaNo);

	int selectLastImgIdxValueByPlaNo(int plaNo);

	void updatePlantInfo(Plant plant);

	void updateThumnailImagePlantInfo(PlantImg plantImg);

	void deleteOldImageFileByPlaNoAndImgIdx(HashMap<String, Object> params);
	
}