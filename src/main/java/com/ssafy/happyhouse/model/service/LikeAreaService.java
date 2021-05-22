package com.ssafy.happyhouse.model.service;

import com.ssafy.happyhouse.model.LikeAreaDto;

public interface LikeAreaService {
	
	boolean registerLikeArea(LikeAreaDto likeAreaDto);
	
	LikeAreaDto getLikeArea(String userId);
	
	boolean modifyLikeArea(LikeAreaDto likeAreaDto);

}
