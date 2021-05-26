package com.ssafy.happyhouse.controller;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.NewsDto;
import com.ssafy.happyhouse.util.NaverCrawler;

@Controller
@RequestMapping("/news")
@CrossOrigin("*")
public class NewsController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String news() {
		
		return "news/news";
	}
	

   @RequestMapping(value = "/list", method = RequestMethod.GET, headers = { "Content-type=application/json" })
   public String newsList(Model model) throws SQLException {

      String id = "N9MGUWM9Te0sYR4F1RPi";
      String secret = "q09x3rqGtd";
      List<NewsDto> newsList1 = new ArrayList<NewsDto>();
      List<NewsDto> newsList2 = new ArrayList<NewsDto>();
      try {
         NaverCrawler crawler1 = new NaverCrawler();
         NaverCrawler crawler2 = new NaverCrawler();
         String url1 = URLEncoder.encode("기사", "UTF-8");
         String url2 = URLEncoder.encode("집값 기사", "UTF-8");
         String response1 = crawler1.search(id, secret, url1);
         String response2 = crawler2.search(id, secret, url2);


         String[] fields = { "title", "link", "description" };
         String[] fields2 = { "title", "link", "description" };
         Map<String, Object> result1 = crawler1.getResult(response1, fields);
         List<Map<String, Object>> items1 = (List<Map<String, Object>>) result1.get("result");
         
         Map<String, Object> result2 = crawler2.getResult(response2, fields);
         List<Map<String, Object>> items2 = (List<Map<String, Object>>) result2.get("result");
         //5개만 출력할수있게 하기
         int index=1;
         for (Map<String, Object> item1 : items1) {
            NewsDto newsDto = new NewsDto();
            for (String field : fields) {
               if (field == "title") {
                  newsDto.setTitle(item1.get(field).toString());
               } else if (field == "link") {
                  newsDto.setLink(item1.get(field).toString());
               } else if (field == "description") {
                  newsDto.setDescription(item1.get(field).toString());
               }
            }
            newsList1.add(newsDto);
            
            if(index==10) {
               break;
            }
            index++;
         }
         int index2=1;
         for (Map<String, Object> item2 : items2) {
        	 NewsDto newsDto = new NewsDto();
        	 for (String field2 : fields2) {
        		 if (field2 == "title") {
        			 newsDto.setTitle(item2.get(field2).toString());
        		 } else if (field2 == "link") {
        			 newsDto.setLink(item2.get(field2).toString());
        		 } else if (field2 == "description") {
        			 newsDto.setDescription(item2.get(field2).toString());
        		 }
        	 }
        	 newsList2.add(newsDto);
        	 
        	 if(index2==10) {
        		 break;
        	 }
        	 index2++;
         }
         model.addAttribute("news1", newsList1);
         model.addAttribute("news2", newsList2);
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      return "news/news";
   }
   
   
//   @RequestMapping(value = "/getNewsjutak", method = RequestMethod.GET, headers = { "Content-type=application/json" })
//   public List<NewsDto> newsList2(Model model) throws SQLException {
//
//      String id = "N9MGUWM9Te0sYR4F1RPi";
//      String secret = "q09x3rqGtd";
//      List<NewsDto> newsList = new ArrayList<NewsDto>();
//      try {
//         NaverCrawler crawler = new NaverCrawler();
//         String url = URLEncoder.encode("주택 기사", "UTF-8");
//         String response = crawler.search(id, secret, url);
//
//
//         String[] fields = { "title", "link", "description" };
//         Map<String, Object> result = crawler.getResult(response, fields);
//         
//         List<Map<String, Object>> items = (List<Map<String, Object>>) result.get("result");
//         //5개만 출력할수있게 하기
//         int index=1;
//         for (Map<String, Object> item : items) {
//            NewsDto newsDto = new NewsDto();
//            for (String field : fields) {
//               if (field == "title") {
//                  newsDto.setTitle(item.get(field).toString());
//               } else if (field == "link") {
//                  newsDto.setLink(item.get(field).toString());
//               } else if (field == "description") {
//                  newsDto.setDescription(item.get(field).toString());
//               }
//            }
//            newsList.add(newsDto);
//            
//            if(index==5) {
//               break;
//            }
//            index++;
//         }
//         model.addAttribute("news2", newsList);
//      } catch (Exception e) {
//         e.printStackTrace();
//      }
//      return newsList;
//   }


}