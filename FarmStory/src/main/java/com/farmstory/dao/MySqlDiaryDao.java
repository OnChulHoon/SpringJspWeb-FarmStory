package com.farmstory.dao;

import java.util.HashMap;
import java.util.List;

import com.farmstory.mapper.DiaryMapper;
import com.farmstory.vo.Account;
import com.farmstory.vo.Diary;
import com.farmstory.vo.DiaryBook;
import com.farmstory.vo.DiaryImg;

public class MySqlDiaryDao implements DiaryDao{
	
	private DiaryMapper diaryMapper;

	public void setDiaryMapper(DiaryMapper diaryMapper) {
		this.diaryMapper = diaryMapper;
	}

	@Override
	public void insertDiary(Diary diary) {
		diaryMapper.insertDiary(diary);
	}

	@Override
	public void insertDiaryImage(DiaryImg attachment) {
		diaryMapper.insertDiaryImage(attachment);
	}

	@Override
	public List<Diary> findDiary(int from, int to, String memId, int dibNo, String diaTitle) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("from", from);
		params.put("to", to);
		params.put("memId", memId);
		params.put("dibNo", dibNo);
		params.put("diaTitle", diaTitle);
		//List<Diary> diary = diaryMapper.findDiary(from, to, memId);
		//return diary;
		
		return diaryMapper.findDiary(params);
	}

	@Override
	public List<DiaryImg> findDiaryImg(int diaNo) {
		List<DiaryImg> diaryImg = diaryMapper.findDiaryImg(diaNo);
		return diaryImg;
	}

	@Override
	public List<DiaryImg> findDiaryAllImg(String memId, int dibNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("memId", memId);
		params.put("dibNo", dibNo);
		return diaryMapper.findDiaryAllImg(params);
		//List<DiaryImg> diaryAllImg = diaryMapper.findDiaryAllImg(memId, diaBookName);
		//return diaryAllImg;
	}

	@Override
	public int selectCount(String memId, int dibNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("memId", memId);
		params.put("dibNo", dibNo);
		return diaryMapper.selectCount(params);
		//int count = diaryMapper.selectCount(memId, dibNo);
		//return count;
	}

	@Override
	public Diary findDiaryByDiaryNo(String diaNo) {
		Diary diary = diaryMapper.findDiaryByDiaryNo(diaNo);
		return diary;
	}

	@Override
	public List<DiaryImg> findDiaryImgByDiaryNo(String diaNo) {
		List<DiaryImg> diaryImg = diaryMapper.findDiaryImgByDiaryNo(diaNo);
		return diaryImg;
	}

	@Override
	public void deleteDiary(String diaNo) {
		diaryMapper.deleteDiaryImg(diaNo);
		diaryMapper.deleteDiary(diaNo);
	}

	@Override
	public void deleteDiaryImgByAjax(String diaNo) {
		diaryMapper.deleteDiaryImgByAjax(diaNo);
	}

	@Override
	public void deleteImgForUpdate(int diaNo) {
		diaryMapper.deleteImgForUpdate(diaNo);
	}

	@Override
	public void updateDiary(Diary diary) {
		diaryMapper.updateDiary(diary);
	}

	@Override
	public List<Diary> findDiaryCategory(String memId) {
		List<Diary> diary = diaryMapper.findDiaryCategory(memId);
		return diary;
	}

	@Override
	public void insertDiaryBook(DiaryBook diaryBook) {
		diaryMapper.insertDiaryBook(diaryBook);
	}
	
	@Override
	public DiaryBook findPlantInfoForInsertDirayBook(DiaryBook diaryBook) {
		
		return diaryMapper.selectPlantInfoForInsertDirayBook(diaryBook);
	}
	
	@Override
	public List<DiaryBook> selectDiaryBookListByMemId(String memId) {
		
		return diaryMapper.selectDiaryBookListByMemId(memId);
	}

	@Override
	public DiaryBook selectDiaryBookInfo(int dibNo) {
		DiaryBook diaryInfo = diaryMapper.selectDiaryBookInfo(dibNo);
		return diaryInfo;
	}

	@Override
	public void deleteDiaryBook(int dibNo) {
		diaryMapper.deleteDiaryBook(dibNo);
	}


}
