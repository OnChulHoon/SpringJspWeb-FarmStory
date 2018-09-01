package com.farmstory.vo;

//식물등록테이블 정보를 DB에 저장하기 위한 vo 객체
public class RegistPlant {

	private String regPotNo;
	private String memId;
	private int plaNo;
	private String plaName;
	private String pliImg;
	
	
	public String getRegPotNo() {
		return regPotNo;
	}
	public void setRegPotNo(String regPotNo) {
		this.regPotNo = regPotNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getPlaNo() {
		return plaNo;
	}
	public void setPlaNo(int plaNo) {
		this.plaNo = plaNo;
	}
	public String getPlaName() {
		return plaName;
	}
	public void setPlaName(String plaName) {
		this.plaName = plaName;
	}
	public String getPliImg() {
		return pliImg;
	}
	public void setPliImg(String pliImg) {
		this.pliImg = pliImg;
	}
	
}
