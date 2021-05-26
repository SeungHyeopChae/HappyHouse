package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseDealService {

//	public List<HouseDealDto> listhouse(String code);
	List<HouseDealDto> listlike(String key);
	List<HouseDealDto> listall(Map<String, String> map);

	PageNavigation makePageNavigationAll(Map<String, String> map);
	PageNavigation makePageNavigationDong(Map<String, String> map);
	public List<HouseDealDto> listhouse(Map<String, String> map);

	HouseDealDto detail(int no);

}
