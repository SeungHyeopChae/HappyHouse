package com.ssafy.happyhouse.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public boolean registerMember(MemberDto memberDto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePwd = encoder.encode(memberDto.getUserPwd());
//		System.out.println(securePwd);
		memberDto.setUserPwd(securePwd);
		return memberMapper.registerMember(memberDto) == 1;
	}

	// 수정부분 ********************************* 완성
	@Override
	public MemberDto login(Map<String, String> map) {
		if(map.get("userid") == null || map.get("userpwd") == null) 
			return null;

			String inputPwd = memberMapper.getMember(map.get("userid")).getUserPwd();
			String rawPwd = map.get("userpwd");
//			System.out.println("입력 : " + inputPwd);
//			System.out.println("바뀐비번 : " + rawPwd);
			
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(encoder.matches(rawPwd, inputPwd)) {
//				System.out.println("입력 비번2 : " + inputPwd + " 변환 비번 : " + rawPwd);
				map.replace("userpwd", inputPwd);
				return memberMapper.login(map);
			} else
				return null;
	}

	@Override
	public MemberDto getMember(String userId) {
		return memberMapper.getMember(userId);
	}

	@Override
	@Transactional
	public boolean modifyMember(MemberDto memberDto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePwd = encoder.encode(memberDto.getUserPwd());
		memberDto.setUserPwd(securePwd);
		return memberMapper.modifyMember(memberDto) == 1;
	}

	@Override
	@Transactional
	public boolean deleteMember(String userId) {
		return memberMapper.deleteMember(userId) == 1;
	}

}