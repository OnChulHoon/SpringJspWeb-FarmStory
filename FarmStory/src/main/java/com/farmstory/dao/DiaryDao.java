package com.farmstory.dao;

import java.util.List;

import com.farmstory.vo.Account;
import com.farmstory.vo.Diary;
import com.farmstory.vo.DiaryBook;
import com.farmstory.vo.DiaryImg;

public interface DiaryDao {

	void insertDiary(Diary diary);

	void insertDiaryImage(DiaryImg attachment);

	List<Diary> findDiary(int from, int to, String memId, int dibNo, String diaTitle);

	List<DiaryImg> findDiaryImg(int diaNo);

	List<DiaryImg> findDiaryAllImg(String memId, int dibNo);

	int selectCount(String memId, int dibNo);

	Diary findDiaryByDiaryNo(String diaNo);

	List<DiaryImg> findDiaryImgByDiaryNo(String diaNo);

	void deleteDiary(String diaNo);

	void deleteDiaryImgByAjax(String diaNo);

	void deleteImgForUpdate(int diaNo);

	void updateDiary(Diary diary);

	List<Diary> findDiaryCategory(String memId);

	void insertDiaryBook(DiaryBook diaryBook);

	DiaryBook findPlantInfoForInsertDirayBook(DiaryBook diaryBook);

	List<DiaryBook> selectDiaryBookListByMemId(String memId);

	DiaryBook selectDiaryBookInfo(int dibNo);

	void deleteDiaryBook(int dibNo);


}
