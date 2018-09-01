package com.farmstory.service;

import java.util.List;

import com.farmstory.vo.Account;
import com.farmstory.vo.Diary;
import com.farmstory.vo.DiaryBook;
import com.farmstory.vo.DiaryImg;

public interface DiaryService {

	void writeDiary(Diary diary);

	List<Diary> findDiary(int from, int to, String memId, int dibNo, String diaTitle);

	List<DiaryImg> findDiaryAllImg(String memId, int dibNo);

	int getCount(String memId, int dibNo);

	Diary findDiaryByDiaryNo(String diaNo);

	List<DiaryImg> findDiaryImgByDiaryNo(String diaNo);

	void deleteDiary(String diaNo);

	void deleteDiaryImgByAjax(String diaNo);

	void deleteImgForUpdate(int diaNo);

	void updateDiary(Diary diary);

	List<Diary> findDiaryCategory(String memId);

	void writeDiaryBook(DiaryBook diaryBook);

	DiaryBook findPlantInfoForInsertDirayBook(DiaryBook diaryBook);

	List<DiaryBook> findDiaryBookListByMemId(String memId);

	DiaryBook findDiaryBookInfo(int dibNo);

	void deleteDiary(int dibNo);


}
