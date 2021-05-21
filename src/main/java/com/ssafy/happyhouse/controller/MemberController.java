package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = memberService.login(map);
			System.out.println(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);			
				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserId());
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);

			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/404";
		}
		return "index";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String regist() {
		return "member/regist";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String regist(MemberDto memberDto, Model model, HttpSession session) {
		try {
			System.out.println(memberDto);
			memberService.registerMember(memberDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원가입중  문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		try {
			memberService.deleteMember(memberDto.getUserId());
			session.invalidate();
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원탈퇴중  문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify() {
		return "member/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(MemberDto memberDto, Model model, HttpSession session) {
		try {
			memberService.modifyMember(memberDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "수정 중  문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	@RequestMapping(value = "/forget", method = RequestMethod.GET)
	public String forget() {
		return "member/forget";
	}
	
}


