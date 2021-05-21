package com.ssafy.happyhouse.model.service;

import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {

	boolean registerMember(MemberDto memberDto);

	MemberDto login(Map<String, String> map);

	MemberDto getMember(String userId);
	
	boolean modifyMember(MemberDto memberDto);
	
	boolean deleteMember(String userId);
	
}
