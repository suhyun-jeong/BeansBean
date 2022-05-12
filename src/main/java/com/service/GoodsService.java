package com.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;

@Service
public class GoodsService {
	@Autowired
	GoodsDAO dao;

	public List<GoodsDTO> goodsList(String gcategory) {
		// TODO 상품목록 보기
		List<GoodsDTO> list = dao.goodsList(gcategory);
		return list;
	}

	public GoodsDTO goodsDetail(String gcode) {
		// TODO 상품자세히 보기
		GoodsDTO dto = dao.goodsDetail(gcode);
		return dto;
	}

	public void cartAdd(CartDTO cart) {
		dao.cartAdd(cart);
		
	}
	
	public void cartUpdate(Map<String, String> map) {
		dao.cartUpdate(map);
		
	}
	public void cartDelete(int num) {
		dao.cartDelete(num);
		
	}
	public void delAllCart(ArrayList<String> list) {
		dao.delAllCart(list);
		
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list=dao.cartList(userid);
		return list;
	}
}
