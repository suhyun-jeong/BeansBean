package com.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.OrderinfoDTO;

@Repository
public class OrderDAO {

	@Autowired
	SqlSessionTemplate session;

	// 상품 한 개 주문하기
	public int oneGoodsOrder(OrderinfoDTO oiDTO) {
		return session.insert("OrderMapper.oneGoodsOrder", oiDTO);
	}
	
}
