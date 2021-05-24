package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDealDto;


public interface HouseDealMapper {
	
	List<HouseDealDto> listhouse(Map<String, Object> param);
	
	List<HouseDealDto> listlike(String key);
	
	List<HouseDealDto> listall();
	
	int getTotalCount(Map<String, String> map);

}
