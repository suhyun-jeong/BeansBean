package com.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;

@Repository
public class GoodsDAO {
	@Autowired
	SqlSessionTemplate session;

	public List<GoodsDTO> goodsList(String gcategory) {
		// TODO 상품목록 보기
		List<GoodsDTO> list = session.selectList("GoodsMapper.goodsList", gcategory);
//		System.out.println(list);
		return list;
	}

	public GoodsDTO goodsDetail(String gcode) {
		// TODO 상품자세히 보기
		GoodsDTO dto = session.selectOne("GoodsMapper.goodsDetail", gcode);
		return dto;
	}

	public void cartAdd(CartDTO cart) {
		session.insert("CartMapper.cartAdd", cart);	
		
	}
	
	public void cartUpdate(Map<String, String> map) {
		int n = session.update("CartMapper.cartUpdate", map);
		
	}
	public void cartDelete(int num) {
		int n= session.delete("CartMapper.cartDel", num);
		
	}
	public void delAllCart(ArrayList<String> list) {
		int n = session.delete("CartMapper.cartAllDel", list);
		
	}

	public List<CartDTO> cartList(String userid) {
		List<CartDTO> list = session.selectList("CartMapper.cartList", userid);
		return list;
	}
}
