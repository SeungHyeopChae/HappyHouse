package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;

public interface NoticeMapper {

	int registerArticle(NoticeDto noticeDto);
	
	List<NoticeDto> listArticle(Map<String, Object> map);
	
	public int getTotalCount(Map<String, String> map);
	
	NoticeDto getArticle(int articleNo);
	
	int modifyArticle(NoticeDto noticeDto);
	
	int deleteArticle(int articleNo);

}
