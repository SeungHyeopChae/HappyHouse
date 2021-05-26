package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.NoticeDto;

public interface HouseDealMapper {
	
//	List<HouseDealDto> listhouse(String code);
	List<HouseDealDto> listhouse(Map<String, Object> param);
	
	List<HouseDealDto> listlike(String key);
	
	List<HouseDealDto> listall(Map<String, Object> param);
	
	int getTotalCountAll(Map<String, String> map);
	int getTotalCountDong(Map<String, String> map);
	
	HouseDealDto detail(int no);

}
