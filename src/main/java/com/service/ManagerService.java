package com.service;

<<<<<<< HEAD
import java.util.List;

=======
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
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
<<<<<<< HEAD

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
=======
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
}
