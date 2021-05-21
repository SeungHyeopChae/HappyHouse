package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "NoticeDto : 공지 의 정보", description = "공지의 상세 정보를 나타낸다.")
public class NoticeDto {
	@ApiModelProperty(value = "번호", example = "111")
	private int articleNo;
	@ApiModelProperty(value = "아이디")
	private String userId;
	@ApiModelProperty(value = "제목")
	private String subject;
	@ApiModelProperty(value = "내용")
	private String content;
	@ApiModelProperty(value = "등록시간")
	private String regtime;
	
	
public NoticeDto() {}
	
	public NoticeDto(int articleNo, String userId, String subject, String content, String regtime) {
		super();
		this.articleNo = articleNo;
		this.userId = userId;
		this.subject = subject;
		this.content = content;
		this.regtime = regtime;
	}

	

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	@Override
	public String toString() {
		return "NoticeDto [userId=" + userId + ", subject=" + subject + ", content=" + content + ", regtime=" + regtime
				+ ", articleNo=" + articleNo + "]";
	}

}
