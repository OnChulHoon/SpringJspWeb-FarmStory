package com.farmstory.vo;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Entity;

@Entity
public class EmailSub {
	@Column
	@NotNull
	@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="형식에 맞지 않는 이메일입니다.")
	private String subEmail;
	
	private String subType;
	
	
	public String getSubEmail() {
		return subEmail;
	}
	public void setSubEmail(String subEmail) {
		this.subEmail = subEmail;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}

}
