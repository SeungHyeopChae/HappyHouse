package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.mapper.HospitalMapper;

@Service
public class HospitalServiceImpl implements HospitalService {

	@Autowired
	private HospitalMapper hospitalMapper;

	@Override
	public List<HospitalDto> getHospital(int no) {
		return hospitalMapper.getHospital(no);
	}
}
