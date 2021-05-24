package com.ssafy.happyhouse.model.mapper;

import java.util.List;


import com.ssafy.happyhouse.model.HouseInfoDto;

public interface HouseInfoMapper {
	
	List<HouseInfoDto> getList(String dong);

}
