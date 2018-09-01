package com.farmstory.service;

import java.util.HashMap;
import java.util.List;

import com.farmstory.vo.Plant;
import com.farmstory.vo.PlantImg;

public interface PlantService {

	void writePlantInfoWithImages(Plant plant);

	List<Plant> findPlantInfosWithThumnailImages();

	Plant findPlantInfoByPlaNo(int plaNo);

	List<PlantImg> findImagesPlantInfoByPlaNo(int plaNo);

	void deletePlantInfoWithImages(int plaNo);

	List<PlantImg> findModifyImagesPlantInfoByPlaNo(int plaNo);

	int findLastImgIdxValueByPlaNo(int plaNo);

	void modifyPlantInfo(Plant plant);

	void modifyThumnailImagePlantInfo(PlantImg plantImg);

	void writeNewImagesPlantInfo(PlantImg plantImg);

	void deleteOldImageFileByPlaNoAndImgIdx(HashMap<String, Object> params);

}