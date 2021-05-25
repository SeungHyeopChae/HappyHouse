package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.AddressDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.service.AddressService;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.model.service.HouseInfoService;


@Controller
@RequestMapping("/house")
public class HouseDealController {
	
	@Autowired 
	private HouseDealService houseDealService;
	
	@Autowired 
	private AddressService addressService;
	
	@Autowired 
	private HouseInfoService houseInfoService;
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam String dong,  Model model)
	{
		String code = dong.split(",")[0];
		try {
			List<HouseDealDto> list;
			AddressDto latlng;
			if(code.equals("all")) {
				list = houseDealService.listall();
				latlng = new AddressDto();
				latlng.setLat("37.5013068");
				latlng.setLng("127.037471");
			}
			else {
				list = houseDealService.listhouse(code);
				latlng = addressService.getLatLng(code);
			}
			model.addAttribute("houseList", list);
			model.addAttribute("latlng", latlng);
			return "list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/404";
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody List<HouseInfoDto> dong(@RequestParam("dong") String dong, Model model, HttpServletResponse response) {
		System.out.println("리스트 얻기");
		List<HouseInfoDto> list = houseInfoService.getList(dong);
		return list;
	}

}
