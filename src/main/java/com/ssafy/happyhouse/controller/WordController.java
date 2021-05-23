package com.ssafy.happyhouse.controller;


import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ssafy.happyhouse.model.WordDto;
import com.ssafy.happyhouse.model.service.WordService;

@Controller
@RequestMapping("/word")
public class WordController {
	
	@Autowired
	private WordService wordService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody List<WordDto> listWord(Model model, HttpServletResponse response) {	

		List<WordDto> list = wordService.listWord();
		return list;
	}
	
}

