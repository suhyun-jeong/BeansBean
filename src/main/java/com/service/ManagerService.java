package com.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ManagerDAO;
import com.dto.BundleDTO;
import com.dto.GoodsDTO;
import com.dto.VariationDTO;

@Service
public class ManagerService {
	@Autowired
	ManagerDAO dao;

	public void goodsADD(GoodsDTO gDTO) {
		// TODO Auto-generated method stub
		dao.goodsADD(gDTO);
	}

	public void variationADD(VariationDTO vDTO) {
		// TODO Auto-generated method stub
		dao.variationADD(vDTO);
	}

	public void bundleADD(BundleDTO bDTO) {
		// TODO Auto-generated method stub
		dao.bundleADD(bDTO);
	}

	public GoodsDTO goodsinfo(String gcode) {
		// TODO Auto-generated method stub
		return dao.goodsinfo(gcode);
	}


	public List<GoodsDTO> AllGoods() {
		// TODO Auto-generated method stub
		return dao.AllGoods();
	}
	public List<VariationDTO> selectVariation() {
		// TODO Auto-generated method stub
		return dao.selectVariation();
	}
	public List<BundleDTO> selectBundle() {
		// TODO Auto-generated method stub
		return dao.selectBundle();
	}

	public void goodsDelete(String gcode) {
		// TODO Auto-generated method stub
		dao.goodsDelete(gcode);
	}

	public List<VariationDTO> variationBygcode(String gcode) {
		// TODO Auto-generated method stub
		return dao.variationBygcode(gcode);
	}

	public List<BundleDTO> bundleBygcode(String gcode) {
		// TODO Auto-generated method stub
		return dao.bundleBygcode(gcode);
	}

	public void variationDelete(String gcode) {
		// TODO Auto-generated method stub
		dao.variationDelete(gcode);
	}

	public void bundleDelete(String gcode) {
		dao.bundleDelete(gcode);
		
	}

	public void goodsUpdate(GoodsDTO gDTO) {
		// TODO Auto-generated method stub
		dao.goodsUpdate(gDTO);
	}

}
