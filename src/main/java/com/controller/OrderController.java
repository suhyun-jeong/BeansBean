package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.CartDTO;
import com.dto.OrderinfoDTO;
import com.service.GoodsService;
//import com.dto.CartService;
import com.service.OrderService;

@Controller
@Transactional
public class OrderController {
	/* 상품 주문에 대한 컨트롤러 */

	@Autowired
	OrderService orderService;
	
	/*
	@Autowired
	CartService cartService;
	*/
	
	@Autowired
	GoodsService goodsService;
	
	// 상품 주문 화면
	@RequestMapping(value="/orderForm")
	public ModelAndView orderForm(CartDTO cDTO) {
		System.out.println(cDTO);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cDTO", cDTO);
		mav.setViewName("order");
		
		return mav;
	}
	
	// 상품 한 개 주문하기
	@RequestMapping(value="/oneGoodsOrder")
	public String oneGoodsOrder(HttpSession session, OrderinfoDTO oiDTO) {
		System.out.println(oiDTO);
		
		int goodsAmount = goodsService.goodsDetail(oiDTO.getGcode()).getGamount();
		if (goodsAmount - oiDTO.getGamount() < 0) {	// 재고보다 많은 수량의 상품 구매 시
			session.setAttribute("success", "상품 구매 실패 - 재고 부족");
		} else {
			// 1. orderinfo 테이블에 레코드 추가
			if (oiDTO.getUserid().length() < 1) {
				/* 비회원 구매 시 userid 컬럼 not null 처리 */
				oiDTO.setUserid("비회원");	// 임시 데이터로 member 테이블에 존재하는 아무 userid 입력하기
			}
			int insertOrderinfo = orderService.oneGoodsOrder(oiDTO);
			System.out.println("orderinfo insert: " + insertOrderinfo);
			
			// 2. cart 테이블에 데이터가 있다면 삭제
			/*
			int deleteCart = CartService.delete(oiDTO.getNum());
			System.out.println("cart delete: " + deleteCart);
			 */
			
			// 3. 남은 재고 계산하여 goods 테이블 업데이트
			HashMap<String, Object> oiMap = new HashMap<>();
			oiMap.put("gcode", oiDTO.getGcode());
			oiMap.put("gamount", oiDTO.getGamount());
			int updateGoods = goodsService.updateAmount(oiMap);
			System.out.println("goods update: " + updateGoods);
			
			session.setAttribute("success", "상품 구매 성공");
		}
		
		return "redirect:./";
	}
	
}
