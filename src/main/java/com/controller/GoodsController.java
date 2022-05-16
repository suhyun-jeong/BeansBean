package com.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BundleDTO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.VariationDTO;

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

			gcategory = "coffee";

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
//		System.out.println(gcode);
		GoodsDTO dto = service.goodsDetail(gcode);
//		System.out.println(dto);
		return dto;
	}
	
	@ResponseBody
	@RequestMapping("bundleDetail")
	@ModelAttribute("cartList")
	public List<BundleDTO> bundleDetail(String gcode) {
		//TODO BundleDTO 
		System.out.println(gcode);
		
		List<BundleDTO> list = service.bundleDetail(gcode);
		System.out.println(list);

		return list;
	}
	
	@ResponseBody
	@RequestMapping("variationDetail")
	public List<VariationDTO> variationDetail(String gcode) {
		//TODO BundleDTO 
		System.out.println(gcode);
		
		List<VariationDTO> list = service.variationDetail(gcode);
		System.out.println(list);

		return list;
	}
	
	
	@RequestMapping("/loginCheck/cartAdd")
	public String cartAdd(CartDTO cart, HttpSession session) {
		MemberDTO mDTO= (MemberDTO)session.getAttribute("login");
		cart.setUserid(mDTO.getUserid());
//		session.setAttribute("mesg", cart.getGcode());
		service.cartAdd(cart);
		return "redirect:../goodsDetail?gcode="+cart.getGcode();
	}
	
	@RequestMapping("loginCheck/cartList")
	public String cartList(RedirectAttributes attr, HttpSession session) {
		MemberDTO dto= (MemberDTO)session.getAttribute("login");
		String userid=dto.getUserid();
		List<CartDTO> list =service.cartList(userid);
		attr.addFlashAttribute("cartList", list);
		return "redirect:../cartList"; //servlet-context에 등록
		
	}

}
