package com.farmstory.vo;

//팜스토리 소개 목록 vo 설정
public class Cover {

	private int covNo;
	private String covTitle;
	private String covLcontent;
	private String covRcontent;
	private String covImg;
	
	public String getCovRcontent() {
		return covRcontent;
	}
	public void setCovRcontent(String covRcontent) {
		this.covRcontent = covRcontent;
	}
	
	public int getCovNo() {
		return covNo;
	}
	public void setCovNo(int covNo) {
		this.covNo = covNo;
	}
	public String getCovTitle() {
		return covTitle;
	}
	public void setCovTitle(String covTitle) {
		this.covTitle = covTitle;
	}
	public String getCovLcontent() {
		return covLcontent;
	}
	public void setCovLcontent(String covLcontent) {
		this.covLcontent = covLcontent;
	}
	
	public String getCovImg() {
		return covImg;
	}
	public void setCovImg(String covImg) {
		this.covImg = covImg;
	}
}
