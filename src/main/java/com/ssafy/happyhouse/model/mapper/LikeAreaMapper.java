package com.ssafy.happyhouse.model.mapper;

import com.ssafy.happyhouse.model.LikeAreaDto;

public interface LikeAreaMapper {
	
	int registerLikeArea(LikeAreaDto likeAreaDto);
	
	LikeAreaDto getLikeArea(String userId);
	
	int modifyLikeArea(LikeAreaDto likeAreaDto);

}
