package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.dto.Cook_BrdDTO;
import com.dto.Info_BrdDTO;
import com.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@RequestMapping("/Info_BRD") 
	public ModelAndView Info_BRD_list() {
		//사업자 게시글 목록보기
		List<Info_BrdDTO> list =service.Info_BRD_list();
		ModelAndView mav = new ModelAndView();
		mav.addObject("Info", list);
		mav.setViewName("/Info_BRD");  
		return mav;
	}
	
	@RequestMapping(value="/Info_BRD_write", method=RequestMethod.GET)
	public String Info_BRD_write() { 
		//사업자 게시글 작성화면
		return "Info_BRD_write";
	}
	
	@RequestMapping(value="/Info_BRD_insert", method=RequestMethod.POST)
	public String Info_BRD_insert(@ModelAttribute Info_BrdDTO info ) {
		//사업자 게시글 쓰기 기능
		service.Info_BRD_insert(info);
		return "redirect:/Info_BRD";
	}
	
	@RequestMapping("/Info_BRD_DetailView" )
	@ModelAttribute("Info_BRD_DetailView") 
	public ModelAndView Info_BRD_DetailView(int num) {
		//사업자 게시글 상세페이지 보기 
		ModelAndView mav = new ModelAndView();
		Info_BrdDTO dto =service.Info_BRD_DetailView(num);
		mav.addObject("dto", dto);
		
		 //views의 Cook_BRD.jsp로 화면지정.
		return mav;
	}
	
	
	
	
	@RequestMapping("/Cook_BRD") 
	public ModelAndView Cook_BRD_list() {
		//래시피 게시글 목록보기
		List<Cook_BrdDTO> list =service.Cook_BRD_list();
		ModelAndView mav = new ModelAndView();
		mav.addObject("Cook", list);
		//mav.setViewName("/Cook_BRD");  //views의 Cook_BRD.jsp로 화면지정.
		return mav;
	}
	
	@RequestMapping(value="/Cook_BRD_write", method=RequestMethod.GET)
	public String Cook_BRD_write() { 
		//래시피 게시글 작성화면
		return "Cook_BRD_write";
	}
	
	@RequestMapping(value="/Cook_BRD_insert", method=RequestMethod.POST)
	public String Cook_BRD_insert(@ModelAttribute Cook_BrdDTO cook ) {
		//래시피 게시글 쓰기 기능
		service.Cook_BRD_insert(cook);
		return "redirect:/Cook_BRD";
	}
	
	@RequestMapping("/Cook_BRD_DetailView" )
	@ModelAttribute("Cook_BRD_DetailView") 
	public ModelAndView Cook_BRD_DetailView(int num) {
		//게시글 상세페이지 보기 
		ModelAndView mav = new ModelAndView();
		Cook_BrdDTO dto =service.Cook_BRD_DetailView(num);
		mav.addObject("dto", dto);
		return mav;
	}
}
