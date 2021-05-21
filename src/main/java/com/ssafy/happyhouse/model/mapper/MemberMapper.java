package com.ssafy.happyhouse.model.mapper;

import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberMapper {
	

	int registerMember(MemberDto memberDto);
	
	MemberDto login(Map<String, String> map);	
	
	MemberDto getMember(String userId);
	
	int modifyMember(MemberDto memberDto);
	
	int deleteMember(String userId);

}
