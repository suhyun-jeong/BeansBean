package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class UserInfoController {
	/* 마이페이지, 회원 정보 수정 등에 대한 컨트롤러 */
	
	@Autowired
	MemberService service;
	
	// 마이페이지
	@RequestMapping(value="/mypage")
	public ModelAndView myPage(HttpSession session) {
		MemberDTO loginUser = (MemberDTO) session.getAttribute("login");
		MemberDTO userInfo = service.getUserInfo(loginUser.getUserid());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("userInfo", userInfo);
		mav.setViewName("myPage");
		
		return mav;
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/userInfoUpdate")
	public String userInfoUpdate(MemberDTO input, HttpSession session) {
		int updatedMember = service.userInfoUpdate(input);
		System.out.println("member update: " + updatedMember);
		
		session.setAttribute("userInfoMsg", "회원 정보가 수정되었습니다.");
		
		return "redirect:mypage";
	}
	
}
