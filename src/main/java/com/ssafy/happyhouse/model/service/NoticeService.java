package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.util.PageNavigation;


public interface NoticeService {
	

	boolean registerArticle(NoticeDto noticeDto);	

	List<NoticeDto> listArticle(Map<String, String> map);
	
	public PageNavigation makePageNavigation(Map<String, String> map);
	
	NoticeDto getArticle(int articleNo);
	
	boolean modifyArticle(NoticeDto noticeDto);
	
	boolean deleteArticle(int articleNo);


}
