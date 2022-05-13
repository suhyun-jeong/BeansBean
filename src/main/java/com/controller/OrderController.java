package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.OrderinfoDTO;

@Controller
public class OrderController {
	/* 상품 주문에 대한 컨트롤러 */

	// 상품 주문 화면
	@RequestMapping(value="/orderForm")
	public ModelAndView orderForm(CartDTO cDTO) {
		/*
		CartDTO cDTO = new CartDTO(10, "aaa", "C00001", "커피필 원두커피 1kg", 9200, "bca", "vca", 120, "C1.jpg");
		if (cDTO.getUserid() == null)
			cDTO.setUserid("admin");
		cDTO.setNum(111);
		cDTO.setBcategory("50 박스");
		cDTO.setGamount(5);
		System.out.println(cDTO);
		 */
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cDTO", cDTO);
		mav.setViewName("order");
		
		return mav;
	}
	
	// 상품 한 개 주문
	@RequestMapping(value="/oneGoodsOrder")
	public String oneGoodsOrder(OrderinfoDTO oiDTO) {
		System.out.println(oiDTO);
		
		return "redirect:./";
	}
	
}
