package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class UserInfoController {
	/* 마이페이지, 회원 정보 수정 등에 대한 컨트롤러 */
	
	@Autowired
	MemberService service;
	
	// 마이페이지
	@RequestMapping(value="/mypage")
	public String myPage() {
		MemberDTO userInfo = service.getUserInfo();
		System.out.println(userInfo);
		
		return "myPage";
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/userInfoUpdate")
	public String userInfoUpdate() {
		System.out.println("업데이트 완료");
		
		return "main";
	}
	
}
