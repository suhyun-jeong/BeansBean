package com.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
=======
import java.util.List;
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
import com.dto.BundleDTO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.VariationDTO;
=======
import com.dto.GoodsDTO;
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5

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
<<<<<<< HEAD
		// TODO GoodsDTO
		GoodsDTO dto = session.selectOne("GoodsMapper.goodsDetail", gcode);
		return dto;
	}

	public List<BundleDTO> bundleDetail(String gcode) {
		// TODO BundleDTO
		List<BundleDTO> list = session.selectList("GoodsMapper.bundleDetail", gcode);
		return list;
	}

	
	public List<VariationDTO> variationDetail(String gcode) {
		// TODO VariationDTO
		List<VariationDTO> list = session.selectList("GoodsMapper.variationDetail", gcode);
		return list;
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
=======
		// TODO 상품자세히 보기
		GoodsDTO dto = session.selectOne("GoodsMapper.goodsDetail", gcode);
		return dto;
	}
>>>>>>> 37c27722f9f3af1a7a522a9276cb0f02423895b5
}
