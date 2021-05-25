package com.ssafy.happyhouse.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "StationDto : 역의 정보", description = "도시철도의 역 정보를 나타낸다.")
public class StationDto {
	
	@ApiModelProperty(value = "호선", example = "1호선")
	private int route;
	@ApiModelProperty(value = "역 이름")
	private String station;
	@ApiModelProperty(value = "아파트 이름")
	private String aptName;
	@ApiModelProperty(value = "코드")
	private String code;
	@ApiModelProperty(value = "가격")
	private String dealAmount;
	

}
