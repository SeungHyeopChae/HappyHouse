package com.ssafy.happyhouse.model.service;

import java.util.List;
import com.ssafy.happyhouse.model.HouseDealDto;

public interface HouseDealService {

	List<HouseDealDto> listhouse(String key);
	List<HouseDealDto> listlike(String key);
	List<HouseDealDto> listall();
	HouseDealDto detail(int no);
}
