package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.mapper.HouseInfoMapper;

@Service
public class HouseInfoServiceImpl implements HouseInfoService{
	
	@Autowired
	private HouseInfoMapper houseInfoMapper;

	@Override
	public List<HouseInfoDto> getList(String dong) {
		return houseInfoMapper.getList(dong);
	}

	@Override
	public HouseInfoDto getDetail(String aptName, String buildYear) {
		return houseInfoMapper.getDetail(aptName, buildYear);
	}
	

}
