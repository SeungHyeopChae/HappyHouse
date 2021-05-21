package com.ssafy.happyhouse.model;

import java.util.List;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "NoticeResultList : 공지글 의 정보", description = "등록된 공지글의 상세 정보를 나타낸다.")
public class NoticeResultList {
	@ApiModelProperty(value = "상태")
	private String status;
	@ApiModelProperty(value = "크기")
	private int size;
	@ApiModelProperty(value = "리스트")
	private List<NoticeDto> list;
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public List<NoticeDto> getList() {
		return list;
	}
	public void setList(List<NoticeDto> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "NoticeResultList [status=" + status + ", size=" + size + ", list=" + list + "]";
	}

}
