package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class MainController {

	@Autowired
	GoodsService service;
	
	@RequestMapping("/")
	public ModelAndView goodsList(String gcategory) {
		// TODO 메인화면 (우선은 coffee상품만)

		List<GoodsDTO> list = service.goodsList("coffee");
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
//		System.out.println(list);
		mav.setViewName("main");
		return mav;
	}
	
}
