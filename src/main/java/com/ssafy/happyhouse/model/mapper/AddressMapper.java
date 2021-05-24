package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.AddressDto;

public interface AddressMapper {

	List<AddressDto> getGugunList(String sicode);
	List<AddressDto> getDongList(String guguncode);
	AddressDto getLatLng(String dong);

}
