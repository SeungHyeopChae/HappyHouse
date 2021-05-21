package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.BoardDto;



public interface BoardService {
	
	List<BoardDto> list();

	BoardDto search(String bno);

	boolean create(BoardDto boardDto);

	boolean modify(BoardDto boardDto);

	boolean delete(String bno);

}
