package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
