package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.OrderDAO;
import com.dto.OrderinfoDTO;

@Service
public class OrderService {
	
	@Autowired
	OrderDAO dao;
	
	// 상품 한 개 주문하기
	public int oneGoodsOrder(OrderinfoDTO oiDTO) {
		return dao.oneGoodsOrder(oiDTO);
	}
	

}
