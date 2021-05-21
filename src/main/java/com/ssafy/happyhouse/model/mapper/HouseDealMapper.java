package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.HouseDealDto;

public interface HouseDealMapper {
	
	List<HouseDealDto> listhouse(String key);
	List<HouseDealDto> listlike(String key);
	List<HouseDealDto> listall();

}
