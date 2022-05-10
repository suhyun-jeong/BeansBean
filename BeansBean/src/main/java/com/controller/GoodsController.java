package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.GoodsDTO;
import com.service.GoodsService;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService service;
	
	@RequestMapping("/goodsList")
	public ModelAndView goodsList(String gcategory) {
		// TODO 상품목록보기
//		System.out.println(gcategory);
		if(gcategory == null) {
			gcategory = "liquid";
		}

		List<GoodsDTO> list = service.goodsList(gcategory);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
//		System.out.println(list);
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/goodsDetail")
	@ModelAttribute("goodsDetail")
	public GoodsDTO goodsDetail(String gcode) {
		System.out.println(gcode);
		GoodsDTO dto = service.goodsDetail(gcode);
		System.out.println(dto);
		return dto;
	}
	
}
