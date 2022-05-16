package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.Cook_BrdDTO;
import com.dto.Info_BrdDTO;
import com.dto.IngrementDTO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;

	public List<Cook_BrdDTO> Cook_BRD_list() {
		List<Cook_BrdDTO> list = dao.Cook_BRD_list();
		return list;
	}
	public void Cook_BRD_insert(Cook_BrdDTO cook) {
		dao.Cook_BRD_insert(cook);
	}
	public Cook_BrdDTO Cook_BRD_DetailView(int num) {
		Cook_BrdDTO dto = dao.Cook_BRD_DetailView(num);
		return dto;
	}
	
	
	public List<Info_BrdDTO> Info_BRD_list() {
		List<Info_BrdDTO> list = dao.Info_BRD_list();
		return list;
	}
	public void Info_BRD_insert(Info_BrdDTO info) {
		dao.Info_BRD_insert(info);
		
	}
	public Info_BrdDTO Info_BRD_DetailView(int num) {
		Info_BrdDTO dto = dao.Info_BRD_DetailView(num);
		return dto;
	}
	public int CookNumGet() {
		// TODO Auto-generated method stub
		return dao.CookNumGet();
	}
	public void ingrementInsert(IngrementDTO ingre) {
		// TODO Auto-generated method stub
		dao.ingrementInsert(ingre);
	}
	
}
