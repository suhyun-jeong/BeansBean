package com.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;
@Service
public class MemberService {
	@Autowired
	MemberDAO dao;
	
	public int memberAdd(MemberDTO m) throws Exception{
		// TODO Auto-generated method stub
		return dao.memeberAdd(m);
	}

	// 아이디 및 비밀번호 확인
	public MemberDTO idpwCheck(Map<String, String> map) {
		return dao.idpwCheck(map);
	}
	
	// 회원 정보 가져오기
	public MemberDTO getUserInfo(String userid) {
		return dao.getUserInfo(userid);
	}

	// 회원 정보 수정
	public int userInfoUpdate(MemberDTO mDTO) {
		return dao.userInfoUpdate(mDTO);
	}

	// 아이디 중복 체크
	public int idDuplicateCheck(String inputId) {
		return dao.idDuplicateCheck(inputId);
	}

}
