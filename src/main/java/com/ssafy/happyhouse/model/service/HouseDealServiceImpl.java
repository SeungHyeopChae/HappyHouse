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
//	public List<HouseDealDto> listhouse(String code) {
	public List<HouseDealDto> listhouse(Map<String, String> map) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		param.put("dong", map.get("dong"));
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		int start = (currentPage - 1) * sizePerPage;
		param.put("start", start);
		param.put("spp", sizePerPage);
		
		return houseDealMapper.listhouse(param);

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
	public PageNavigation makePageNavigationAll(Map<String, String> map) {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));	
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = houseDealMapper.getTotalCountAll(map);
		System.out.println(totalCount);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	
	@Override
	public PageNavigation makePageNavigationDong(Map<String, String> map) {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));	
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = houseDealMapper.getTotalCountDong(map);
		System.out.println(totalCount);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
	
	

}
