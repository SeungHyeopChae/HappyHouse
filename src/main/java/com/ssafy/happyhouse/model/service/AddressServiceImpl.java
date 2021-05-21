package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.AddressDto;
import com.ssafy.happyhouse.model.mapper.AddressMapper;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressMapper addressMapper;
	
	
	@Override
	public List<AddressDto> getGugunList(String sicode) {
		return addressMapper.getGugunList(sicode);
	}

	@Override
	public List<AddressDto> getDongList(String guguncode) {
		return addressMapper.getDongList(guguncode);
	}

}
