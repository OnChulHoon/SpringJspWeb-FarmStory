package com.farmstory.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.farmstory.common.Util;
import com.farmstory.service.PlantService;
import com.farmstory.vo.Plant;
import com.farmstory.vo.PlantImg;

@Controller
public class PlantController {

	@Autowired
	@Qualifier("plantService")
	private PlantService plantService;

	@GetMapping(value = "/plant_list.action")
	public String showPlantList(Model model) {

		List<Plant> plantInfos = plantService.findPlantInfosWithThumnailImages();

		model.addAttribute("plantInfos", plantInfos);

		return "plant/plant-list";
	}

	@GetMapping(value = "/plant_write.action")
	public String showWrite() {

		return "plant/plant-write";
	}

	@PostMapping(value = "/plant_write.action")
	public String writePlantInfo(Plant plant, MultipartHttpServletRequest mtfRequest) {

		PlantImg imgFile = null;
		// 브라우저에서 보낸 데이터 중에서 파일데이터를 받아온다.
		List<MultipartFile> fileList = mtfRequest.getFiles("plantImg");
		ArrayList<PlantImg> imgFiles = new ArrayList<>();
		int imageIdx = 0;
		// 브라우저에서 보낸 데이터 중에서 파일 데이터를 분리하여 저장한다.
		for (MultipartFile mf : fileList) {
			if (!mf.isEmpty() && mf.getOriginalFilename().length() != 0) {
				PlantImg plantImg = new PlantImg();
				imageIdx = imageIdx + 1;

				// 파일 업로드할 경로를 지정한다.
				String fileUploadPath = mtfRequest.getServletContext()
						.getRealPath("/resources/upload-image/plant-info");
				String originFileName = mf.getOriginalFilename(); // 원본 파일 이름을 받아온다.
				String uniqueFileName = System.currentTimeMillis() + "_" + originFileName; // 수정된 파일 이름을 저장한다.

				// 브라우저에서 보내진 파일을 지정된 경로에 저장한다.
				if (imageIdx == 1) { // imageIdx가 1이면 미리보기 이미지로 저장한다.
					// 저장할 미리보기 이미지의 이름을 PlantImg vo에 저장한다.
					plantImg.setPliImg("thumb_" + uniqueFileName);
					plantImg.setImgIdx(imageIdx);
					try {
						// 파일 업로드 경로에 원본파일을 수정된 파일이름으로 저장한다.
						mf.transferTo(new File(fileUploadPath, uniqueFileName));
						// 지정된 사이즈의 미리보기 이미지로 변환하여 파일 업로드 경로에 저장한다.
						Util.makeThumbnail(fileUploadPath, uniqueFileName, 570, 390);
						// 파일 업로드 경로에 변경된 이미지의 이름의 이름을 PlantImg vo에 저장한다.
						imgFile = new PlantImg();
						imgFile.setPliImg("thumb_" + uniqueFileName);
						// 지정된 경로에 업로드한 파일을 삭제한다.
						// thumbnail 이미지로 파일을 다시 생성하므로 처음 업로드한 파일은 삭제한다.
						File firstUploadFile = new File(fileUploadPath + "/" + uniqueFileName);
						// 파일의 존재여부를 확인하여 삭제를 실행한다.
						if (firstUploadFile.exists()) {
							firstUploadFile.delete();
							System.out.println("처음 업로드 파일 삭제 완료(thumnail)");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					// 저장할 상세 페이지 이미지의 이름을 PlantImg vo에 저장한다.
					plantImg.setPliImg("resize_" + uniqueFileName);
					plantImg.setImgIdx(imageIdx);
					try {
						// 파일 업로드 경로에 원본파일을 수정된 파일이름으로 저장한다.
						mf.transferTo(new File(fileUploadPath, uniqueFileName));
						// 지정된 사이즈의 사이즈 조정된 이미지로 변환하여 파일 업로드 경로에 저장한다.
						Util.imageResize(fileUploadPath, uniqueFileName, 1170, 800);
						// 파일 업로드 경로에 변경된 이미지의 이름의 이름을 PlantImg vo에 저장한다.
						imgFile = new PlantImg();
						imgFile.setPliImg("resize_" + uniqueFileName);
						// 지정된 경로에 업로드한 파일을 삭제한다.
						// resize 이미지로 파일을 다시 생성하므로 처음 업로드한 파일은 삭제한다.
						File firstUploadFile = new File(fileUploadPath + "/" + uniqueFileName);
						// 파일의 존재여부를 확인하여 삭제를 실행한다.
						if (firstUploadFile.exists()) {
							firstUploadFile.delete();
							System.out.println("처음 업로드 파일 삭제 완료(resize)");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
				// 테스트를 위한 업로드된 파일 정보를 받아온다.
				long fileSize = mf.getSize(); // 파일 사이즈 정보를 받아온다.
				System.out.println("uniqueFileName : " + uniqueFileName);
				System.out.println("fileSize : " + fileSize);

				// 업로드된 여러개의 이미지 파일을 List<PlantImg>형식으로 객체에 저장한다.
				imgFiles.add(plantImg);
			}

		}
		// 분리하여 저장한 파일들의 이름을 받아 plant vo객체에 저장한다.
		plant.setAttachments(imgFiles);

		// plant vo에 저장된 데이터를 DB에 저장한다.
		plantService.writePlantInfoWithImages(plant);

		return "redirect:/plant_list.action";
	}

	@GetMapping(value = "/plant_detail.action")
	public String showPlantDetail(@RequestParam(value = "plaNo") int plaNo, Model model, Plant plant) {

		// 상세 페이지에 선택한 식물 정보를 DB에서 조회하여 Plant vo객체에 저장한다.
		plant = plantService.findPlantInfoByPlaNo(plaNo);
		// 상세 페이지에 식물 정보 사진을 DB에서 조회하여 PlantImg vo객체에 저장한다.
		List<PlantImg> plantInfoImages = plantService.findImagesPlantInfoByPlaNo(plaNo);
		// 다른 식물 정보의 데이터들을 조회하여 객체에 저장한다.
		List<Plant> plantInfos = plantService.findPlantInfosWithThumnailImages();

		model.addAttribute("plant", plant);
		model.addAttribute("plantInfosImages", plantInfoImages);
		model.addAttribute("plantInfos", plantInfos);

		return "plant/plant-detail";
	}

	@GetMapping(value = "/plant_delete.action")
	public String deletePlantInfoWithImages(@RequestParam(value = "plaNo") int plaNo) {

		plantService.deletePlantInfoWithImages(plaNo);

		return "redirect:/plant_list.action";
	}

	@GetMapping(value = "/plant_update.action")
	public String showModifyPlantInfoWithImages(@RequestParam(value = "plaNo") int plaNo, Plant plant, Model model) {

		plant = plantService.findPlantInfoByPlaNo(plaNo);
		List<PlantImg> oldImages = plantService.findModifyImagesPlantInfoByPlaNo(plaNo);
		int lastImgIdx = plantService.findLastImgIdxValueByPlaNo(plaNo);

		model.addAttribute("plant", plant);
		model.addAttribute("oldImages", oldImages);
		model.addAttribute("lastImgIdx", lastImgIdx);

		return "plant/plant-update";
	}

	@PostMapping(value = "/plant_update.action")
	public String modifyPlantInfo(Plant plant, PlantImg plantImg, MultipartHttpServletRequest mtfRequest,
			@RequestParam(value = "lastImgIdx") int lastImgIdx, @RequestParam(value = "plaNo") int plaNo, Model model) {
		String returnUrl = "";
		String[] oldImgFileNames = mtfRequest.getParameterValues("oldImgFileName");

		PlantImg imgFile = null;
		// 브라우저에서 보낸 데이터 중에서 파일데이터를 받아온다.
		MultipartFile thumnail = mtfRequest.getFile("thumnailImg");
		List<MultipartFile> fileList = mtfRequest.getFiles("plantImg");
		ArrayList<PlantImg> imgFiles = new ArrayList<>();
		int imageIdx = 0;
		
		// 사진 수정이 없을 경우 입력된 데이터만 수정된다.
		if (thumnail == null) {
			// DB에 수정된 데이터를 입력한다.
			plantService.modifyPlantInfo(plant);
			returnUrl = "redirect:plant_detail.action?plaNo="+ plaNo;
		} else {
			// 수정할 미리보기 사진파일이 있을 경우 실행된다.
			if (!thumnail.isEmpty()) {
				PlantImg plantThumImg = new PlantImg();
				// 파일 업로드할 경로를 지정한다.
				String fileUploadPath = mtfRequest.getServletContext()
						.getRealPath("/resources/upload-image/plant-info");
				String originFileName = thumnail.getOriginalFilename(); // 원본 파일 이름을 받아온다.
				String uniqueFileName = System.currentTimeMillis() + "_" + originFileName; // 수정된 파일 이름을 저장한다.
				imageIdx = 1;
				try {
					// 파일 업로드 경로에 원본파일을 수정된 파일이름으로 저장한다.
					thumnail.transferTo(new File(fileUploadPath, uniqueFileName));
					// 지정된 사이즈의 미리보기 이미지로 변환하여 파일 업로드 경로에 저장한다.
					Util.makeThumbnail(fileUploadPath, uniqueFileName, 570, 390);
					// 파일 업로드 경로에 변경된 사진의 이름의 이름을 PlantImg vo에 저장한다.
					plantThumImg.setPliImg("thumb_" + uniqueFileName);
					plantThumImg.setPlaNo(plaNo);
					// 지정된 경로에 업로드한 파일을 삭제한다.
					// thumbnail 이미지로 파일을 다시 생성하므로 처음 업로드한 파일은 삭제한다.
					File firstUploadFile = new File(fileUploadPath + "/" + uniqueFileName);
					// 파일의 존재여부를 확인하여 삭제를 실행한다.
					if (firstUploadFile.exists()) {
						firstUploadFile.delete();
						System.out.println("처음 업로드 파일 삭제 완료(thumnail)");
					}

					File oldUploadFile = new File(fileUploadPath + "/" + oldImgFileNames[0]);
					// 파일의 존재여부를 확인하여 삭제를 실행한다.
					if (oldUploadFile.exists()) {
						oldUploadFile.delete();
						System.out.println("기존 업로드 파일 삭제 완료(thumnail)");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				// 테스트를 위한 업로드된 파일 정보를 받아온다.
				long fileSize = thumnail.getSize(); // 파일 사이즈 정보를 받아온다.
				System.out.println("thumb_uniqueFileName : " + uniqueFileName);
				System.out.println("fileSize : " + fileSize);

				// 미리보기 사진을 DB에서 찾아 수정한다.
				plantService.modifyThumnailImagePlantInfo(plantThumImg);
			}

			// 추가할 상세페이지 사진이 있을 경우 실행된다.
			if (!fileList.isEmpty()) {
				imageIdx = lastImgIdx;
				// 브라우저에서 보낸 데이터 중에서 파일 데이터를 분리하여 저장한다.
				for (MultipartFile mf : fileList) {
					if (!mf.isEmpty() && mf.getOriginalFilename().length() != 0) {
						PlantImg plantDetailImg = new PlantImg();
						imageIdx = imageIdx + 1;

						// 파일 업로드할 경로를 지정한다.
						String fileUploadPath = mtfRequest.getServletContext()
								.getRealPath("/resources/upload-image/plant-info");
						String originFileName = mf.getOriginalFilename(); // 원본 파일 이름을 받아온다.
						String uniqueFileName = System.currentTimeMillis() + "_" + originFileName; // 수정된 파일 이름을 저장한다.

						// 저장할 상세 페이지 이미지의 이름을 PlantImg vo에 저장한다.
						plantDetailImg.setPliImg("resize_" + uniqueFileName);
						plantDetailImg.setImgIdx(imageIdx);
						plantDetailImg.setPlaNo(plaNo);
						try {
							// 파일 업로드 경로에 원본파일을 수정된 파일이름으로 저장한다.
							mf.transferTo(new File(fileUploadPath, uniqueFileName));
							// 지정된 사이즈의 사이즈 조정된 이미지로 변환하여 파일 업로드 경로에 저장한다.
							Util.imageResize(fileUploadPath, uniqueFileName, 1170, 800);
							// 파일 업로드 경로에 변경된 이미지의 이름의 이름을 PlantImg vo에 저장한다.
							imgFile = new PlantImg();
							imgFile.setPliImg("resize_" + uniqueFileName);
							// 지정된 경로에 업로드한 파일을 삭제한다.
							// resize 이미지로 파일을 다시 생성하므로 처음 업로드한 파일은 삭제한다.
							File firstUploadFile = new File(fileUploadPath + "/" + uniqueFileName);
							// 파일의 존재여부를 확인하여 삭제를 실행한다.
							if (firstUploadFile.exists()) {
								firstUploadFile.delete();
								System.out.println("처음 업로드 파일 삭제 완료(resize)");
							}
						} catch (Exception e) {
							e.printStackTrace();
						}

						// 테스트를 위한 업로드된 파일 정보를 받아온다.
						long fileSize = mf.getSize(); // 파일 사이즈 정보를 받아온다.
						System.out.println("resize_uniqueFileName : " + uniqueFileName);
						System.out.println("fileSize : " + fileSize);

						// 업로드된 여러개의 이미지 파일을 List<PlantImg>형식으로 객체에 저장한다.
						imgFiles.add(plantDetailImg);
					}

				}
				// 분리하여 저장한 파일들의 이름을 받아 plant vo객체에 저장한다.
				plantImg.setAttachments(imgFiles);

				// DB에 새로운 사진들을 추가하여 저장한다.
				plantService.writeNewImagesPlantInfo(plantImg);
			}

			// DB에 수정된 데이터를 입력한다.
			plantService.modifyPlantInfo(plant);
			returnUrl = "redirect:plant_detail.action?plaNo="+ plaNo;
		}
		
		return returnUrl;
	}

	@ResponseBody
	@GetMapping(value = "/plant_delete_old_img.action")
	public String deleteOldImgFile(String oldImgFileName, @RequestParam(value = "plaNo") int plaNo,
			@RequestParam(value = "oldImgIdx") int oldImgIdx) {

		HashMap<String, Object> params = new HashMap<>();
		params.put("plaNo", plaNo);
		params.put("imgIdx", oldImgIdx);

		plantService.deleteOldImageFileByPlaNoAndImgIdx(params);
		String fileUploadPath = "/resources/upload-image/plant-info/";

		File oldUploadFile = new File(fileUploadPath + oldImgFileName);
		// 파일의 존재여부를 확인하여 삭제를 실행한다.
		if (oldUploadFile.exists()) {
			oldUploadFile.delete();
			System.out.println("기존 업로드 파일 삭제 완료(resize)");
		}

		return "success";
	}

	@GetMapping(value = "/plant_refresh_old_img.action")
	public String refreshOldImgFiles(@RequestParam(value = "plaNo") int plaNo, Model model) {

		List<PlantImg> oldImages = plantService.findModifyImagesPlantInfoByPlaNo(plaNo);

		model.addAttribute("oldImages", oldImages);

		return "plant/plant-refresh";
	}

	@GetMapping(value = "/mobile_plant_list.action")
	@ResponseBody
	public List<Plant> showPlantListForMobile(int x, String y) {

		System.out.printf("[X : %d][Y : %s]", x, y);
		System.out.println();

		List<Plant> plantInfos = plantService.findPlantInfosWithThumnailImages();

		// 객체를 반환하고 @ResponseBody를 설정한 경우
		// 이 객체를 JSON 문자열로 자동 변환 -> JacksonMapper
		return plantInfos;
	}

}
