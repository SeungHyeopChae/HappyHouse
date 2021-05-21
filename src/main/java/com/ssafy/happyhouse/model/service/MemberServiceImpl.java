package com.ssafy.happyhouse.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
   
   @Autowired
   private MemberMapper memberMapper;
   
   @Override
   public boolean registerMember(MemberDto memberDto) {
	   return memberMapper.registerMember(memberDto) == 1;
   }

   @Override
   public MemberDto login(Map<String, String> map) {
      if(map.get("userid") == null || map.get("userpwd") == null)
         return null;
      return memberMapper.login(map);
   }

   @Override
   public MemberDto getMember(String userId) {
      return memberMapper.getMember(userId);
   }

   @Override
   public boolean modifyMember(MemberDto memberDto) {
      return memberMapper.modifyMember(memberDto) == 1;
   }

   @Override
   public boolean deleteMember(String userId) {
      return memberMapper.deleteMember(userId) == 1;
   }

}