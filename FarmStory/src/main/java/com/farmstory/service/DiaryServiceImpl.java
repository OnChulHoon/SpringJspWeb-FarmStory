package com.farmstory.service;

import java.util.List;

import com.farmstory.dao.DiaryDao;
import com.farmstory.vo.Account;
import com.farmstory.vo.Diary;
import com.farmstory.vo.DiaryBook;
import com.farmstory.vo.DiaryImg;

public class DiaryServiceImpl implements DiaryService{
	
	private DiaryDao diaryDao;

	public void setDiaryDao(DiaryDao diaryDao) {
		this.diaryDao = diaryDao;
	}

	@Override
	public void writeDiary(Diary diary) {
		
		diaryDao.insertDiary(diary);		
		List<DiaryImg> imgAttachments = diary.getAttachment();
		for (DiaryImg attachment : imgAttachments) {
			attachment.setDiaNo(diary.getDiaNo());
			attachment.setDibNo(diary.getDibNo());
			diaryDao.insertDiaryImage(attachment);
		}
	}
	
	@Override
	public List<Diary> findDiary(int from, int to, String memId, int dibNo, String diaTitle) {
		List<Diary> diary = diaryDao.findDiary(from, to, memId, dibNo, diaTitle);
		for (Diary d : diary) {
			List<DiaryImg> attachments = diaryDao.findDiaryImg(d.getDiaNo());
			d.setAttachment(attachments);
		}
		return diary;
	}

	@Override
	public List<DiaryImg> findDiaryAllImg(String memId, int dibNo) {
		
		List<DiaryImg> diaryAllImg = diaryDao.findDiaryAllImg(memId, dibNo);
		return diaryAllImg;
	}

	@Override
	public int getCount(String memId, int dibNo) {
		int count = diaryDao.selectCount(memId, dibNo);
		return count;
	}

	@Override
	public Diary findDiaryByDiaryNo(String diaNo) {
		Diary diary = diaryDao.findDiaryByDiaryNo(diaNo);
		return diary;
	}

	@Override
	public List<DiaryImg> findDiaryImgByDiaryNo(String diaNo) {
		List<DiaryImg> diaryImg = diaryDao.findDiaryImgByDiaryNo(diaNo);
		return diaryImg;
	}

	@Override
	public void deleteDiary(String diaNo) {
		diaryDao.deleteDiary(diaNo);
	}

	@Override
	public void deleteDiaryImgByAjax(String diaNo) {
		diaryDao.deleteDiaryImgByAjax(diaNo);
	}

	@Override
	public void deleteImgForUpdate(int diaNo) {
		diaryDao.deleteImgForUpdate(diaNo);
	}

	@Override
	public void updateDiary(Diary diary) {
		diaryDao.updateDiary(diary);		
		List<DiaryImg> imgAttachments = diary.getAttachment();
		for (DiaryImg attachment : imgAttachments) {
			attachment.setDiaNo(diary.getDiaNo());
			diaryDao.insertDiaryImage(attachment);
		}		
	}

	@Override
	public List<Diary> findDiaryCategory(String memId) {
		List<Diary> diary = diaryDao.findDiaryCategory(memId);
		for (Diary d : diary) {
			List<DiaryImg> attachments = diaryDao.findDiaryImg(d.getDiaNo());
			d.setAttachment(attachments);
		}
		return diary;
	}
	
	@Override
	public void writeDiaryBook(DiaryBook diaryBook) {
		diaryDao.insertDiaryBook(diaryBook);
	}
	
	@Override
	public DiaryBook findPlantInfoForInsertDirayBook(DiaryBook diaryBook) {
		
		return diaryDao.findPlantInfoForInsertDirayBook(diaryBook);
	}
	
	@Override
	public List<DiaryBook> findDiaryBookListByMemId(String memId){
		
		return diaryDao.selectDiaryBookListByMemId(memId);
	}

	@Override
	public DiaryBook findDiaryBookInfo(int dibNo) {
		DiaryBook diaryInfo = diaryDao.selectDiaryBookInfo(dibNo);
		return diaryInfo;
	}

	@Override
	public void deleteDiary(int dibNo) {
		diaryDao.deleteDiaryBook(dibNo);
	}

}
