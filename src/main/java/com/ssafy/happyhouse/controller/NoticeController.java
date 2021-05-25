package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.happyhouse.model.service.NoticeService;
import com.ssafy.happyhouse.util.PageNavigation;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String noticeList() {
		
		return "notice/notice";
	}
	
	@RequestMapping(value = "/mvwrite", method = RequestMethod.GET)
	public String mvWrite() {
		return "notice/write";
	}
	
	@RequestMapping(value="/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String registerArticle(NoticeDto noticeDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		
		if(memberDto != null) {
			noticeDto.setUserId(memberDto.getUserId());
			logger.debug(noticeDto.getSubject());
			System.out.println(noticeDto.getSubject());
			try {
				noticeService.registerArticle(noticeDto);
				return "redirect:list?pg=1&key=&word=";
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "글 작성 중 문제가 발생했습니다.");
				return "error/404";
				// TODO: handle exception
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/404";
		}
	}
	

	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@RequestParam Map<String, String> map, Model model) {
		String pg = map.get("pg");
		String spp = map.get("spp");
		
		System.out.println("router - > pg : " + pg + "spp : " + spp);
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		
			List<NoticeDto> list = noticeService.listArticle(map);
			PageNavigation pageNavigation = noticeService.makePageNavigation(map);
			model.addAttribute("articles", list);
			model.addAttribute("navigation", pageNavigation);
			return "notice/notice";
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("articleNo") int articleNo, Model model) {
		try {
			noticeService.deleteArticle(articleNo);
			return "redirect:list?pg=1&key=&word=";
		} catch (Exception e){
			e.printStackTrace();
			model.addAttribute("msg", "글 삭제 중 문제가 발생했습니다.");
			return "error/404";
		}
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("articleNo") int articleNo, Model model) {
		try {
			NoticeDto noticeDto = noticeService.getArticle(articleNo);
			model.addAttribute("article", noticeDto);
			return "notice/modify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글 수정 처리 중 문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(NoticeDto noticeDto, Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			noticeDto.setUserId(memberDto.getUserId());
			try {
				noticeService.modifyArticle(noticeDto);
				return "redirect:list?pg=1&key=&word=";
			} catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("msg", "글 수정 중 문제가 발생했습니다.");
				return "error/404";
			}
		} else {
			model.addAttribute("msg", "로그인 후 사용 가능한 페이지입니다.");
			return "error/404";
		}
	}
	
}
