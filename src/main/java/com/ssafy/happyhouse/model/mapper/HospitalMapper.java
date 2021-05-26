package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.HospitalDto;

public interface HospitalMapper {
	
	List<HospitalDto> getHospital(int no);

}
