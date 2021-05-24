package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.util.PageNavigation;


@Controller
@RequestMapping("/house")
public class HouseDealController {
	
	@Autowired 
	private HouseDealService houseDealService; 
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam Map<String, String> map, String dong,  Model model)
	{
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		String code = dong.split(",")[0];
		
		try {
			List<HouseDealDto> list;
			PageNavigation pageNavigation = houseDealService.makePageNavigation(map);
			if(code.equals("all")) {
				list = houseDealService.listall();
			}
			else {
				list = houseDealService.listhouse(map);
			}
			
			model.addAttribute("houseList", list);
			model.addAttribute("navigation", pageNavigation);
			
			return "list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/404";
		}
	}

}
