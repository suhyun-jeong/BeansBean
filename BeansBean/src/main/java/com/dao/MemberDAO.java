package com.dao;

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
}
