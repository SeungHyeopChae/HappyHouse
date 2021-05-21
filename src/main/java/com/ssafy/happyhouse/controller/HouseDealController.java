package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.service.HouseDealService;


@Controller
@RequestMapping("/house")
public class HouseDealController {
	
	@Autowired 
	private HouseDealService houseDealService; 
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam String dong,  Model model)
	{
		String code = dong.split(",")[0];
		try {
			List<HouseDealDto> list;
			if(code.equals("all")) {
				list = houseDealService.listall();
			}
			else {
				list = houseDealService.listhouse(code);
			}
			model.addAttribute("houseList", list);
			return "list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/404";
		}
	}

}
