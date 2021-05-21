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
import com.ssafy.happyhouse.model.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {

	@Autowired 
	private AddressService addressService; 

	@RequestMapping(value = "/gugun", method = RequestMethod.POST)
	public @ResponseBody List<AddressDto> gugun(@RequestParam("si") String sicode, Model model, HttpServletResponse response) {	
		System.out.println(sicode);
		List<AddressDto> gunlist = addressService.getGugunList(sicode);
		return gunlist;
	}

	@RequestMapping(value = "/dong", method = RequestMethod.POST)
	public @ResponseBody List<AddressDto> dong(@RequestParam("gu") String guguncode, Model model, HttpServletResponse response) {
		List<AddressDto> donglist = addressService.getDongList(guguncode);
		return donglist;
	}

}