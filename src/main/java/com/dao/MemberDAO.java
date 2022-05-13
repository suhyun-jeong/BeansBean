package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate session;
	
	public int memeberAdd(MemberDTO m) throws Exception{
		// TODO Auto-generated method stub
		return session.insert("MemberMapper.memberAdd",m);
	}

	// 아이디 및 비밀번호 확인
	public MemberDTO idpwCheck(Map<String, String> map) {
		return session.selectOne("MemberMapper.idpwCheck", map);
	}

	// 회원 정보 가져오기
	public MemberDTO getUserInfo(String userid) {
		return session.selectOne("MemberMapper.getUserInfo", userid);
	}

	// 회원 정보 수정
	public int userInfoUpdate(MemberDTO mDTO) {
		return session.update("MemberMapper.userInfoUpdate", mDTO);
	}


	// 아이디 중복 체크
	public int idDuplicateCheck(String inputId) {
		return session.selectOne("MemberMapper.idDuplicateCheck", inputId);
	}

}
