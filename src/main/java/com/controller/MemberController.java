package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
//	//에러처리
//			@ExceptionHandler({Exception.class})
//			public String errorPage() {
//				return "error/error";
//			}
			
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO m, Model model) throws Exception{
		//System.out.println(m);
		System.out.println(m);
		int n = service.memberAdd(m);
		System.out.println("insert 갯수: "+n);
		model.addAttribute("success","회원가입 성공!");
		return "main";
	}
	
	// 로그인
	@RequestMapping(value="/login")
	public String login(HttpSession session, @RequestParam Map<String, String> map) {
		//System.out.println(map.get("userid") + "\t" + map.get("passwd"));
		
		MemberDTO mDTO = service.idpwCheck(map);
		if (mDTO != null) {
			session.setAttribute("login", mDTO);
			
			return "main";
		} else {
			session.setAttribute("loginMsg", "아이디와 비밀번호를 확인해주세요.");
			
			return "redirect:loginForm";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("login") != null)
			session.removeAttribute("login");
		
		return "redirect:./";
	}
	
//	@RequestMapping(value = "/loginCheck/myPage")
//	public String myPage(HttpSession session) throws Exception{
//		MemberDTO dto = (MemberDTO)session.getAttribute("login");
//		dto = service.mypage(dto.getUserid());
//		session.setAttribute("login", dto);
//		//System.out.println(dto);
//		return "redirect:../myPage";
//	}
//	
//	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8")
//	public @ResponseBody String idDuplicateCheck( String id)throws Exception {
//		MemberDTO dto = service.mypage(id);
////		response.setContentType("text/html;charset=UTF-8");
////		System.out.println(dto);
////		System.out.println(id);
//		String mesg ="아이디 사용가능";
//		if (dto!=null) {
//			mesg = "아이디 중복";
//		}
//		return mesg;
//	}
//	
//	@RequestMapping(value = "/loginCheck/memberUpdate")
//	public String memberUpdate(MemberDTO m, HttpSession session)throws Exception {
//		service.memberUpdate(m);
//		MemberDTO dto = (MemberDTO)session.getAttribute("login");
//		dto = service.mypage(dto.getUserid());
//		session.setAttribute("login", dto);
////		return "redirect:../loginCheck/myPage";
//		return "redirect:../myPage";
//	}
	
//	@RequestMapping("/myPage")
//	public String mypage2() {
//	return "mypage";
//	}
}
