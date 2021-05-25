package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "HouseDealDto : 매물 의 정보", description = "매물의 상세 정보를 나타낸다.")
public class HouseDealDto {

	@ApiModelProperty(value = "번호", example = "111")
	private int no;
	@ApiModelProperty(value = "돟")
	private String dong;
	@ApiModelProperty(value = "아파트 이름")
	private String aptName;
	@ApiModelProperty(value = "코드")
	private String code;
	@ApiModelProperty(value = "가격")
	private String dealAmount;
	@ApiModelProperty(value = "건축년")
	private String buildYear;
	@ApiModelProperty(value = "등록년")
	private String dealYear;
	@ApiModelProperty(value = "등록월")
	private String dealMonth;
	@ApiModelProperty(value = "등록일")
	private String dealDay;
	@ApiModelProperty(value = "면적")
	private String area;
	@ApiModelProperty(value = "층수")
	private String floor;
	@ApiModelProperty(value = "지번")
	private String jibun;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	public String getDealYear() {
		return dealYear;
	}
	public void setDealYear(String dealYear) {
		this.dealYear = dealYear;
	}
	public String getDealMonth() {
		return dealMonth;
	}
	public void setDealMonth(String dealMonth) {
		this.dealMonth = dealMonth;
	}
	public String getDealDay() {
		return dealDay;
	}
	public void setDealDay(String dealDay) {
		this.dealDay = dealDay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
		this.floor = floor;
	}
	public String getJibun() {
		return jibun;
	}
	public void setJibun(String jibun) {
		this.jibun = jibun;
	}
	
	
	

}
