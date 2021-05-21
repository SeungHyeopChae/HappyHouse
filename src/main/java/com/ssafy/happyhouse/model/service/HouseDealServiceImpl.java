package com.ssafy.happyhouse.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.mapper.HouseDealMapper;



@Service
public class HouseDealServiceImpl implements HouseDealService {
	
	@Autowired
	private HouseDealMapper houseDealMapper;

	@Override
	public List<HouseDealDto> listhouse(String key) {
		return houseDealMapper.listhouse(key);

	}

	@Override
	public List<HouseDealDto> listlike(String key) {
		return houseDealMapper.listlike(key);
	}

	@Override
	public List<HouseDealDto> listall() {
		return houseDealMapper.listall();
	}
	
	

}
