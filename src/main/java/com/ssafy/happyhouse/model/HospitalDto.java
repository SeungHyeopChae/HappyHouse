package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "HospitalDto : 병원에 대한 정보", description = "병원의 상세 정보를 나타낸다.")
public class HospitalDto {
	@ApiModelProperty(value = "번호", example = "111")
	private int no;
	@ApiModelProperty(value = "시도")
	private String sido;
	@ApiModelProperty(value = "구군")
	private String gugun;
	@ApiModelProperty(value = "병원 이름")
	private String dName;
	@ApiModelProperty(value = "주소")
	private String address;
	@ApiModelProperty(value = "전화번호")
	private String tel;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	

}
