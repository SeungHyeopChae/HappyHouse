package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.WordDto;
import com.ssafy.happyhouse.model.mapper.WordMapper;

@Service
public class WordServiceImpl implements WordService {
	
	@Autowired
	private WordMapper wordMapper;

	@Override
	public List<WordDto> listWord() {
		return wordMapper.listWord();
	}

}
