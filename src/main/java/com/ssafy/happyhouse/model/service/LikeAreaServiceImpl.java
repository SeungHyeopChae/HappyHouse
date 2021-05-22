package com.ssafy.happyhouse.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.LikeAreaDto;
import com.ssafy.happyhouse.model.mapper.LikeAreaMapper;

@Service
public class LikeAreaServiceImpl implements LikeAreaService {

	
	@Autowired
	   private LikeAreaMapper likeAreaMapper;
	
	@Override
	public boolean registerLikeArea(LikeAreaDto likeAreaDto) {
		return likeAreaMapper.registerLikeArea(likeAreaDto) == 1;
	}

	@Override
	public LikeAreaDto getLikeArea(String userId) {
		return likeAreaMapper.getLikeArea(userId);
	}

	@Override
	public boolean modifyLikeArea(LikeAreaDto likeAreaDto) {
		return likeAreaMapper.modifyLikeArea(likeAreaDto) == 1;
	}

}
