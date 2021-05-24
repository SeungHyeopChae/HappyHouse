package com.ssafy.happyhouse.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.mapper.NoticeMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	 @Autowired
	 private NoticeMapper noticeMapper;
	

	@Override
	public boolean registerArticle(NoticeDto noticeDto) {
		
		return noticeMapper.registerArticle(noticeDto) == 1;
	}

	@Override
	public List<NoticeDto> listArticle(Map<String, String> map){
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
		return noticeMapper.listArticle(param);
	}

	@Override
	public NoticeDto getArticle(int articleNo) {
		return noticeMapper.getArticle(articleNo);
	}

	@Override
	public boolean modifyArticle(NoticeDto noticeDto) {
		return noticeMapper.modifyArticle(noticeDto) == 1;
	}

	@Override
	public boolean deleteArticle(int articleNo) {
		return noticeMapper.deleteArticle(articleNo) == 1;
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg") == null ? "1" : map.get("pg"));	
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = noticeMapper.getTotalCount(map);
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
