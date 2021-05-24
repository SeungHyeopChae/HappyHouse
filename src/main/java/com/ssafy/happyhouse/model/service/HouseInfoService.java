package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoService {
	
	List<HouseInfoDto> getList(String dong);

}
