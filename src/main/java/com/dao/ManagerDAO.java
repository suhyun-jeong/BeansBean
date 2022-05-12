package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BundleDTO;
import com.dto.GoodsDTO;
import com.dto.VariationDTO;

@Repository
public class ManagerDAO {
	@Autowired
	SqlSessionTemplate session;

	public void goodsADD(GoodsDTO gDTO) {
		// TODO Auto-generated method stub
		session.insert("ManagerMapper.goodsADD",gDTO);
	}

	public void variationADD(VariationDTO vDTO) {
		// TODO Auto-generated method stub
		session.insert("ManagerMapper.variationADD",vDTO);
	}

	public void bundleADD(BundleDTO bDTO) {
		// TODO Auto-generated method stub
		session.insert("ManagerMapper.bundleADD",bDTO);
	}

	public GoodsDTO goodsinfo(String gcode) {
		// TODO Auto-generated method stub
		return session.selectOne("ManagerMapper.goodsinfo", gcode);
	}

	public List<GoodsDTO> AllGoods() {
		List<GoodsDTO> list = session.selectList("ManagerMapper.AllGoods");
		return list;
	}

	public List<VariationDTO> selectVariation() {
		List<VariationDTO> list = session.selectList("ManagerMapper.selectVariation");
		return list;
	}

	public List<BundleDTO> selectBundle() {
		List<BundleDTO> list = session.selectList("ManagerMapper.selectBundle");
		return list;
	}
	
}
