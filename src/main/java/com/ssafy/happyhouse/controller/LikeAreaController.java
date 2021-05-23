package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.LikeAreaDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.LikeAreaService;

@Controller
@RequestMapping("/likearea")
public class LikeAreaController {
	
	@Autowired
	private LikeAreaService likeAreaService;
	
	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String likearea() {
		return "LikeArea";
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(LikeAreaDto likeAreaDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		try {
			LikeAreaDto tmp = likeAreaService.getLikeArea(memberDto.getUserId());
			likeAreaDto.setUserid(memberDto.getUserId());
			if(tmp == null) {			
				likeAreaService.registerLikeArea(likeAreaDto);
			}
			else {
				likeAreaService.modifyLikeArea(likeAreaDto);
			}
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "관심지역중  문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	
	
	
}
