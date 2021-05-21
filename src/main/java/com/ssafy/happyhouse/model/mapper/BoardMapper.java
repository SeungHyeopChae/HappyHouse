package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.BoardDto;



public interface BoardMapper {
	
	List<BoardDto> list();

	BoardDto search(String bno);

	int create(BoardDto boardDto);

	int modify(BoardDto boardDto);

	void deleteComment(String bno);
	int delete(String bno);

}
