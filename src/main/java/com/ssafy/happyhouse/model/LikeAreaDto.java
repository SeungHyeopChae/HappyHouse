package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "LikeAreaDto : 관심지역 의 정보", description = "관심지역의 상세 정보를 나타낸다.")
public class LikeAreaDto {
	@ApiModelProperty(value = "유저아이디")
	private String userid;
	@ApiModelProperty(value = "코드")
	private String code;
	@ApiModelProperty(value = "시")
	private String city;
	@ApiModelProperty(value = "구군")
	private String gugun;
	@ApiModelProperty(value = "동")
	private String dong;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	@Override
	public String toString() {
		return "LikeAreaDto [userid=" + userid + ", code=" + code + ", city=" + city + ", gugun=" + gugun + ", dong="
				+ dong + "]";
	}
	
	
}
