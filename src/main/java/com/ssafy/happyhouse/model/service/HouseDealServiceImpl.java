package com.ssafy.happyhouse.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.mapper.HouseDealMapper;
import com.ssafy.happyhouse.util.PageNavigation;



@Service
public class HouseDealServiceImpl implements HouseDealService {
	
	@Autowired
	private HouseDealMapper houseDealMapper;

	@Override
	public List<HouseDealDto> listhouse(String code) {
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("key", map.get("key") == null ? "" : map.get("key"));
//		param.put("word", map.get("word") == null ? "" : map.get("word"));
//		int currentPage = Integer.parseInt(map.get("pg"));
//		int sizePerPage = Integer.parseInt(map.get("spp"));
//		int start = (currentPage - 1) * sizePerPage;
//		param.put("start", start);
//		param.put("spp", sizePerPage);
		
		return houseDealMapper.listhouse(code);

	}

	@Override
	public List<HouseDealDto> listlike(String key) {
		return houseDealMapper.listlike(key);
	}

	@Override
	public List<HouseDealDto> listall(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		System.out.println("pg : " + currentPage + " " + "spp : " + sizePerPage);
		int start = (currentPage - 1) * sizePerPage;
		System.out.println("start : " + start);
		param.put("start", start);
		param.put("spp", sizePerPage);
		
		return houseDealMapper.listall(param);
	}

	public HouseDealDto detail(int no) {
		return houseDealMapper.detail(no);

	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int avgAmount(String dong) {
		return houseDealMapper.avgAmount(dong);
	}
	
	

}
