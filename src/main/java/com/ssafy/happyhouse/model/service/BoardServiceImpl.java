package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.BoardDto;
import com.ssafy.happyhouse.model.mapper.BoardMapper;



@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<BoardDto> list() {
		return boardMapper.list();
	}

	@Override
	public BoardDto search(String bno) {
		return boardMapper.search(bno);
	}

	@Override
	public boolean create(BoardDto boardDto) {
		return boardMapper.create(boardDto) == 1;
	}

	@Override
	public boolean modify(BoardDto boardDto) {
		return boardMapper.modify(boardDto) == 1;
	}

	@Override
	@Transactional
	public boolean delete(String bno) {
		boardMapper.deleteComment(bno);
		return  boardMapper.delete(bno) == 1;
	}

}
