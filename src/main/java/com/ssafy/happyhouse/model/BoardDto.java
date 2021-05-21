package com.ssafy.happyhouse.model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "BoardDto : 게시글 의 정보", description = "게시글의 상세 정보를 나타낸다.")
public class BoardDto {
	
	@ApiModelProperty(value = "번호", example = "111")
	private String bno;
	@ApiModelProperty(value = "제목")
	private String title;
	@ApiModelProperty(value = "작성자")
	private String author;
	@ApiModelProperty(value = "상세정보")
	private String content;
	
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", title=" + title + ", author=" + author + ", content=" + content + "]";
	}
	

}
