package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.AddressDto;
import com.ssafy.happyhouse.model.HospitalDto;
import com.ssafy.happyhouse.model.HouseDealDto;
import com.ssafy.happyhouse.model.HouseInfoDto;
import com.ssafy.happyhouse.model.service.AddressService;
import com.ssafy.happyhouse.model.service.HospitalService;
import com.ssafy.happyhouse.model.service.HouseDealService;
import com.ssafy.happyhouse.model.service.HouseInfoService;
import com.ssafy.happyhouse.util.PageNavigation;


@Controller
@RequestMapping("/house")
public class HouseDealController {

	@Autowired 
	private HouseDealService houseDealService;

	@Autowired 
	private AddressService addressService;

	@Autowired 
	private HouseInfoService houseInfoService;
	
	@Autowired 
	private HospitalService hospitalService;

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam Map<String, String> map, Model model)
	{
		String spp = map.get("spp");
		map.put("spp", spp != null ? spp : "10");//sizePerPage
		String code = map.get("word");
		System.out.println(map.get("pg"));
		System.out.println(code);
		try {
			List<HouseDealDto> list;
			AddressDto latlng;
			PageNavigation pageNavigation;

			if(code.equals("all") || code.equals("")) {
				list = houseDealService.listall(map);
				pageNavigation = houseDealService.makePageNavigationAll(map);
				latlng = new AddressDto();
				latlng.setLat("37.5013068");
				latlng.setLng("127.037471");
			}
			else {
				list = houseDealService.listhouse(map);
				pageNavigation = houseDealService.makePageNavigationDong(map);
				latlng = addressService.getLatLng(code);
			}
			model.addAttribute("houseList", list);
			model.addAttribute("navigation", pageNavigation);
			model.addAttribute("latlng", latlng);
			System.out.println("생성");
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
		List<HouseInfoDto> list;
		if(dong.equals("")) {
			list = houseInfoService.getAll();
		}
		else list = houseInfoService.getList(dong);
		return list;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String viewdetail(@RequestParam("no") int no, Model model) {
		try {
			System.out.println(no);
			HouseDealDto houseDetail = houseDealService.detail(no);
			List<HospitalDto> hoslist = hospitalService.getHospital(no);
			HouseInfoDto houseInfo = houseInfoService.getDetail(houseDetail.getAptName(),houseDetail.getBuildYear(), houseDetail.getDong());
			int amount = houseDealService.avgAmount(houseDetail.getDong());
			model.addAttribute("details", houseDetail);
			model.addAttribute("infos", houseInfo);
			model.addAttribute("amount", amount);
			model.addAttribute("hospital", hoslist);
			return "house";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "상세정보를 얻어오는 중 문제가 발생했습니다.");
			return "error/404";
		}
	}




}
