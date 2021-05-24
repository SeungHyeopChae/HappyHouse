package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.AddressDto;

public interface AddressService {
	
	List<AddressDto> getGugunList(String sicode);
	List<AddressDto> getDongList(String guguncode);
	AddressDto getLatLng(String dong);

}
