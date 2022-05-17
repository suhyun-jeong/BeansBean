package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.Cook_BrdDTO;
import com.dto.Info_BrdDTO;
import com.dto.IngrementDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public List<Cook_BrdDTO> Cook_BRD_list() {
		// TODO 래시피 게시판 보기
		List<Cook_BrdDTO> list = session.selectList("BoardMapper.Cook_selectAll");
		return list;
	}

	public void Cook_BRD_insert(Cook_BrdDTO cook) {
		System.out.println(cook);
		int n = session.insert("BoardMapper.Cook_BRD_insert",cook);
		System.out.println("변경된 값은 : "+n);
	}

	public Cook_BrdDTO Cook_BRD_DetailView(int num) {
		Cook_BrdDTO dto = session.selectOne("BoardMapper.Cook_selectOne",num);
		return dto;
	}

	
	
	
	public List<Info_BrdDTO> Info_BRD_list() {
		// TODO 사업가 게시판 보기
		List<Info_BrdDTO> list = session.selectList("BoardMapper.Info_selectAll");
		return list;
	}

	public void Info_BRD_insert(Info_BrdDTO info) {
		int n = session.insert("BoardMapper.Info_BRD_insert",info);
		System.out.println("변경된 값은 : "+n);
	}

	public Info_BrdDTO Info_BRD_DetailView(int num) {
		Info_BrdDTO dto = session.selectOne("BoardMapper.Info_selectOne",num);
		return dto;
	}

	public int CookNumGet() {
		// TODO Auto-generated method stub
		return session.selectOne("BoardMapper.CookNumGet");
	}

	public void ingrementInsert(IngrementDTO ingre) {
		// TODO Auto-generated method stub
		session.insert("BoardMapper.ingrementInsert",ingre);
	}
	
}
