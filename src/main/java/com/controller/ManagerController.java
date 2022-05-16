package com.controller;


import java.io.File;
import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import com.dto.BundleDTO;
import com.dto.GoodsDTO;
import com.dto.VariationDTO;
import java.io.File;
import java.util.Iterator;
import com.dto.BundleDTO;
import com.dto.GoodsDTO;
import com.dto.VariationDTO;


import com.service.ManagerService;


@Controller
public class ManagerController {
	@Autowired
	ManagerService service;
	

	
	@RequestMapping(value = "/CtrlGoods")
	public ModelAndView controlGoods() {
		List<GoodsDTO> list = service.AllGoods();
		List<VariationDTO> vlist = service.selectVariation();
		List<BundleDTO> blist = service.selectBundle();
		ModelAndView model = new ModelAndView();
		model.addObject("AllGoods",list);
		model.addObject("vlist",vlist);
		model.addObject("blist",blist);
		model.setViewName("controlGoods");
		return model;
	}
	
	@ResponseBody	//제품 수정
	@RequestMapping(value = "goodsUpdate")
	public void goodsUpdate(GoodsDTO gDTO) {
		System.out.println(gDTO);
		service.goodsUpdate(gDTO);
		
	}
	
	@ResponseBody	//종류, 번들 삭제
	@RequestMapping(value = "delVriBud")
	public void delVriBud(String gcode) {
		service.variationDelete(gcode);
		service.bundleDelete(gcode);
		
	}
	
	@ResponseBody	//제품삭제
	@RequestMapping(value = "goodsDelete")
	public void goodsDelete(String gcode) {
		service.goodsDelete(gcode);
		
	}
	
	@RequestMapping(value="/goodsUpdatePage")
	public ModelAndView goodsUpdatePage(String gcode) {
		GoodsDTO gdto = service.goodsinfo(gcode);
		List<VariationDTO> vlist = service.variationBygcode(gcode);
		List<BundleDTO> blist = service.bundleBygcode(gcode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("gdto", gdto);
		mav.addObject("vlist", vlist);
		mav.addObject("blist", blist);
		mav.setViewName("goodsPage");
		
		return mav;
	}
	
	@ResponseBody	//제품등록
	@RequestMapping(value = "insertGoods", method = RequestMethod.POST)
	public void insertGoods(GoodsDTO gDTO, Model model) {
		System.out.println(gDTO);		
		service.goodsADD(gDTO);
		model.addAttribute("success","제품 등록 성공");
	}
	
	@ResponseBody	//variation 등록
	@RequestMapping(value = "insertVariation")
	public void insertVariation(VariationDTO vDTO) {
		System.out.println(vDTO);
		service.variationADD(vDTO);
	}
	
	@ResponseBody	//bundle 등록
	@RequestMapping(value = "insertBundle")
	public void insertBundle(BundleDTO bDTO) {
		System.out.println(bDTO);
		service.bundleADD(bDTO);
	}
	
	@ResponseBody	//이미지 이름 추출
	@RequestMapping(value = "imageName", method = RequestMethod.POST)
	public String imageName(MultipartHttpServletRequest request) {
		System.out.println("imageName");
		Iterator<String> iterator = request.getFileNames();
		String uploadFileName;
		MultipartFile mFile = null;
		String orgFileName = ""; //진짜 파일명
		while(iterator.hasNext()) {
			uploadFileName = iterator.next();
			mFile = request.getFile(uploadFileName);
			orgFileName = mFile.getOriginalFilename();    
		}//while
			return orgFileName;
	}
	
	@ResponseBody	//이미지 저장, dir 변경
	@RequestMapping(value = "imageUpload", method = RequestMethod.POST)
	public void imageUpload(MultipartHttpServletRequest request) {
		System.out.println("imageUpload");
		File dir=new File("C:\\eclipse\\STS_STU\\WORKSPACE\\BeansBean\\src\\main\\webapp\\WEB-INF\\views\\images");
		Iterator<String> iterator = request.getFileNames();
		String uploadFileName;
        MultipartFile mFile = null;
        String orgFileName = ""; //진짜 파일명
        while(iterator.hasNext()) {
            uploadFileName = iterator.next();
            mFile = request.getFile(uploadFileName);
            
            orgFileName = mFile.getOriginalFilename();    
                try {
                    mFile.transferTo(new File(dir + File.separator + orgFileName));
                }catch(Exception e){
                    e.getStackTrace();
                }
        }//while
	}
	
	@RequestMapping(value = "/gcodeDuplicateCheck", produces = "text/plain;charset=UTF-8") //코드 중복 검사
	public @ResponseBody String gcodeDuplicateCheck( String gcode) {
		GoodsDTO gdto = service.goodsinfo(gcode);
		String mesg ="코드 사용가능";
		if (gdto!=null) {
			mesg = "코드 중복";
		}
		return mesg;
	}
}
