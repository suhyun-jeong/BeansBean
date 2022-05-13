package com.controller;

import javax.servlet.http.HttpSession;

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
		System.out.println(cDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cDTO", cDTO);
		mav.setViewName("order");
		
		return mav;
	}
	
	// 상품 한 개 주문
	@RequestMapping(value="/oneGoodsOrder")
	public String oneGoodsOrder(HttpSession session, OrderinfoDTO oiDTO) {
		System.out.println(oiDTO);

		session.setAttribute("orderMsg", "상품 구매 성공");
		
		return "order";
		// return "redirect:./";
	}
	
}
