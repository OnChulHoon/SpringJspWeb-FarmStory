package com.farmstory.controller;	

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.farmstory.common.Util;
import com.farmstory.service.DiaryService;
import com.farmstory.service.RegistPlantService;
import com.farmstory.ui.ThePager;
import com.farmstory.vo.Account;
import com.farmstory.vo.Diary;
import com.farmstory.vo.DiaryBook;
import com.farmstory.vo.DiaryImg;
import com.farmstory.vo.PlantImg;
import com.farmstory.vo.RegistPlant;

@Controller
public class DiaryController {
	
	@Autowired
	@Qualifier(value = "diaryService")
	private DiaryService diaryService;
	
	@Autowired
	@Qualifier(value="registPlantService")
	private RegistPlantService registPlantService;
	
	/*@GetMapping(value = "/diary_book_write.action")
	public String diary_book_write(Model model,String diaBookName, String diaPlant, String diaCategory, String regPotNo) {
		model.addAttribute("diaBookName", diaBookName);
		model.addAttribute("diaPlant", diaPlant);
		model.addAttribute("diaCategory", diaCategory);
		model.addAttribute("regPotNo", regPotNo);
			return "diary/diary_book_write";
	}*/
	
	@PostMapping(value = "/diary_write.action")
	public String diary_write(MultipartHttpServletRequest req, Diary diary, Model model,
			String memId, int dibNo) {
		
		diary.setMemId(memId);
		//이미지 삽입
				DiaryImg imageFile = null;
				List<MultipartFile> imgFiles = req.getFiles("diiImage1");

				ArrayList<DiaryImg> files = new ArrayList<>();

				for (MultipartFile imgFile : imgFiles) {
					if (!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
						DiaryImg file = new DiaryImg();
						String path = req.getServletContext().getRealPath("/resources/upload-image/diary-info");
						String savedImageFileName = imgFile.getOriginalFilename();
						savedImageFileName = Util.getUniqueFileName(savedImageFileName);
						file.setDiiImg(savedImageFileName);
						
						try {
							imgFile.transferTo(new File(path, savedImageFileName));
							imageFile = new DiaryImg();
							imageFile.setDiiImg(savedImageFileName);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (Exception e) {

							e.printStackTrace();
						}
						
						files.add(file);
					}
				}
				diary.setAttachment(files);
				diaryService.writeDiary(diary);
				//registPlantService.registPlant(registplant);
			
				return "redirect:/diary_list.action?dibNo=" + dibNo;
	}
	//다이어리 북 리스트
	/*@GetMapping(value = "/diary_book_list.action")
	public String diary_list(Model model, HttpSession session) {
		
		String memId = ((Account)session.getAttribute("loginuser")).getMemId();
	
		//////////////////////////////////////////////////////////////////////////////
		List<Diary> diary = diaryService.findDiaryCategory(memId);
	
		ArrayList<RegistPlant> myFlowerpots = registPlantService.findRegistFlowerpotByMemId(memId);
		model.addAttribute("myFlowerpots", myFlowerpots);
		
		model.addAttribute("diaries", diary);
		model.addAttribute("memId", memId);
		
		return "diary/diary-book-list";
	}*/
	//북에 대한 리스트
	@GetMapping(value = "/diary_list.action")
	public String diary_list(Model model, HttpSession session,
			@RequestParam(value = "pageno", defaultValue = "1") int pageNo,
			@RequestParam(value = "dibNo", defaultValue = "1") int dibNo,String diaName,
			String plaName, String diaCategory, String diaTitle) {
		
		String memId = ((Account)session.getAttribute("loginuser")).getMemId();
		
		int pageSize = 4;
		//int from = pageNo * pageSize - pageSize + 1;
		//int to = pageSize;
		
		//mysql 사용시
		int from = pageNo * pageSize - pageSize;
		//int to = from + pageSize;
		
		int pagerSize = 5; //번호로 표시할 페이지 목록
		String linkUrl = "diary_list.action";
		//////////////////////////////////////////////////////////////////////////////
		List<Diary> diary = diaryService.findDiary(from, pageSize, memId, dibNo, diaTitle);
		int dataCount = diaryService.getCount(memId, dibNo);
		
		ThePager pager = new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		List<DiaryImg> diaryAllImg = diaryService.findDiaryAllImg(memId, dibNo);
	
		model.addAttribute("diaries", diary);
		model.addAttribute("pager", pager);
		model.addAttribute("diaryAllImg", diaryAllImg);
		model.addAttribute("memId", memId);
		model.addAttribute("diaName", diaName);
		model.addAttribute("plaName", plaName);
		model.addAttribute("diaCategory", diaCategory);
		return "diary/diary_list";
	}
	
	@GetMapping(value = "/diary_detail.action")
	public String diary_detail(
			@RequestParam(value = "diaNo") String diaNo, Model model, HttpSession session,
			String diaName, String plaName, String diaCategory) {
		
		String memId = ((Account)session.getAttribute("loginuser")).getMemId();
		Diary diary = diaryService.findDiaryByDiaryNo(diaNo);
		List<DiaryImg> diaryImg = diaryService.findDiaryImgByDiaryNo(diaNo);
		//List<DiaryImg> diaryAllImg = diaryService.findDiaryAllImg(memId);
		model.addAttribute("diary", diary);
		model.addAttribute("diaryImg", diaryImg);
		model.addAttribute("diaName", diaName);
		model.addAttribute("plaName", plaName);
		model.addAttribute("diaCategory", diaCategory);
		//model.addAttribute("diaryAllImg", diaryAllImg);
		
		return "diary/diary_detail";
	}
	
	@GetMapping(value = "/diary_book_detail.action")
	public String diary_book_detail(
			@RequestParam(value = "diaNo") String diaNo, Model model, HttpSession session) {
		
		String memId = ((Account)session.getAttribute("loginuser")).getMemId();
		Diary diary = diaryService.findDiaryByDiaryNo(diaNo);
		List<DiaryImg> diaryImg = diaryService.findDiaryImgByDiaryNo(diaNo);
		//List<DiaryImg> diaryAllImg = diaryService.findDiaryAllImg(memId);
		model.addAttribute("diary", diary);
		model.addAttribute("diaryImg", diaryImg);
		//model.addAttribute("diaryAllImg", diaryAllImg);
		
		return "diary/diary_detail";
	}
	
	@GetMapping(value = "/diary_delete.action")
	public String diary_delete(String diaNo) {
		diaryService.deleteDiary(diaNo);
		return "redirect:diary_list.action";
	}
	
	@GetMapping(value = "/diary_delete_image.action")
	@ResponseBody
	public String diary_delete_image(String diaNo) {
		diaryService.deleteDiaryImgByAjax(diaNo);
		return "success";
	}
	
	@GetMapping(value = "/diary_update.action")
	public String diary_update(String diaNo, Model model) {
		Diary diary = diaryService.findDiaryByDiaryNo(diaNo);
		List<DiaryImg> diaryImg = diaryService.findDiaryImgByDiaryNo(diaNo);
		model.addAttribute("diary", diary);
		model.addAttribute("diaryImg", diaryImg);
		return "diary/diary_update";
	}
	
	@PostMapping(value = "/diary_update.action")
	public String diary_update(MultipartHttpServletRequest req, Diary diary, Model model, int diaNo) {
		
		diary.setDiaNo(diaNo);
		diaryService.deleteImgForUpdate(diaNo);
		
		//이미지 삽입
				DiaryImg imageFile = null;
				List<MultipartFile> imgFiles = req.getFiles("diiImage1");

				ArrayList<DiaryImg> files = new ArrayList<>();

				for (MultipartFile imgFile : imgFiles) {
					if (!imgFile.isEmpty() && imgFile.getOriginalFilename().length() != 0) {
						DiaryImg file = new DiaryImg();
						String path = req.getServletContext().getRealPath("/resources/upload-image/diary-info");
						String savedImageFileName = imgFile.getOriginalFilename();
						savedImageFileName = Util.getUniqueFileName(savedImageFileName);
						file.setDiiImg(savedImageFileName);
						
						try {
							imgFile.transferTo(new File(path, savedImageFileName));
							imageFile = new DiaryImg();
							imageFile.setDiiImg(savedImageFileName);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (Exception e) {

							e.printStackTrace();
						}
						
						files.add(file);
					}
				}
				diary.setAttachment(files);
				diaryService.updateDiary(diary);
				model.addAttribute("diary", diary);
			
				return "redirect:diary_detail.action?diaNo=" + diaNo;
	}
	
	/*@GetMapping(value = "/diaryMonthCheck.action")
	@ResponseBody
	public String diaryMonthCheck(String memId, Model model) {
		List<Diary> diaryMonth = diaryService.findDiaryMonth(memId);
		
		return "diaryMonth";
	}*/
	
	@GetMapping(value = "/diary_write.action")
	public String showDiaryWriteForm(Model model,
			@RequestParam(value = "dibNo") int dibNo) {
		
		DiaryBook diaryBookInfo = diaryService.findDiaryBookInfo(dibNo); 
		model.addAttribute("diaryBookInfo", diaryBookInfo);
		
		return "diary/diary_write";
	}
	
	@GetMapping(value = "/diary_book_list.action")
	public String showDiaryBookList(Model model, HttpSession session, String regPotNo, DiaryBook diaryBook,
			@RequestParam(value = "plaNo", defaultValue = "-1") int plaNo) {
		
		String memId = ((Account) session.getAttribute("loginuser")).getMemId();
		List<DiaryBook> diaryBookList = diaryService.findDiaryBookListByMemId(memId);
		model.addAttribute("diaryBookList", diaryBookList);
		
		return "diary/diary-book-list";
	}
	
	@GetMapping(value = "/diary_book_write.action")
	public String showDiaryBookWriteForm(Model model, HttpSession session, String regPotNo, DiaryBook diaryBook,
			@RequestParam(value = "plaNo", defaultValue = "-1") int plaNo) {
		
		diaryBook.setRegPotNo(regPotNo);
		diaryBook.setPlaNo(plaNo);
		DiaryBook plantInfo = diaryService.findPlantInfoForInsertDirayBook(diaryBook);
		
		model.addAttribute("plantInfo", plantInfo);
		model.addAttribute("regPotNo", regPotNo);
		model.addAttribute("plaNo", plaNo);
		
		return "diary/diary-book-write";
	}
	
	@PostMapping(value = "/diary_book_write.action")
	public String writeDiaryBook(Model model, HttpSession session, MultipartHttpServletRequest req, DiaryBook diaryBook,
			@RequestParam(value = "plaNo", defaultValue = "-1") int plaNo) {
		
		diaryBook.setMemId(((Account)session.getAttribute("loginuser")).getMemId());
		
		// 브라우저에서 보낸 데이터 중에서 파일데이터를 받아온다.
		MultipartFile thumnail = req.getFile("diaryBookImg");
		DiaryBook dibImg = new DiaryBook();
		
		if (!thumnail.isEmpty()) {
			// 파일 업로드할 경로를 지정한다.
			String fileUploadPath = req.getServletContext()
					.getRealPath("/resources/upload-image/diary-book-cover");
			String originFileName = thumnail.getOriginalFilename(); // 원본 파일 이름을 받아온다.
			String uniqueFileName = System.currentTimeMillis() + "_" + originFileName; // 수정된 파일 이름을 저장한다.
			try {
				// 파일 업로드 경로에 원본파일을 수정된 파일이름으로 저장한다.
				thumnail.transferTo(new File(fileUploadPath, uniqueFileName));
				// 지정된 사이즈의 미리보기 이미지로 변환하여 파일 업로드 경로에 저장한다.
				Util.makeThumbnail(fileUploadPath, uniqueFileName, 570, 390);
				// 파일 업로드 경로에 변경된 사진의 이름의 이름을 PlantImg vo에 저장한다.
				dibImg.setDibImg("thumb_" + uniqueFileName);
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

			// 테스트를 위한 업로드된 파일 정보를 받아온다.
			long fileSize = thumnail.getSize(); // 파일 사이즈 정보를 받아온다.
			System.out.println("thumb_uniqueFileName : " + uniqueFileName);
			System.out.println("fileSize : " + fileSize);
			diaryBook.setDibImg(dibImg.getDibImg());
			// 미리보기 사진을 DB에서 찾아 수정한다.
			diaryService.writeDiaryBook(diaryBook);
		}
		
		return "redirect:diary_book_list.action";
	}
	
	@GetMapping(value = "/diary_book_delete.action")
	public String diary_book_delete(int dibNo) {
		diaryService.deleteDiary(dibNo);
		return "redirect:diary_book_list.action";
	}
	
}
