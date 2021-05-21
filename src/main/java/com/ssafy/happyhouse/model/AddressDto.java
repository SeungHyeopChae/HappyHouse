package com.ssafy.happyhouse.model;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "AddressDto : 주소의 정보", description = "주소의 상세정보를 나타낸다.")
public class AddressDto {
	@ApiModelProperty(value = "번호", example = "111")
	private int no;
	@ApiModelProperty(value = "시")
	private String city;
	@ApiModelProperty(value = "코드")
	private String code;
	@ApiModelProperty(value = "동코드")
	private String dongcode;
	@ApiModelProperty(value = "구군")
	private String gugun;
	@ApiModelProperty(value = "동")
	private String dong;
	@ApiModelProperty(value = "위도")
	private String lat;
	@ApiModelProperty(value = "경도")
	private String lng;


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDongcode() {
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
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
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}


}
