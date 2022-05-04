package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("VariationDTO")
public class VariationDTO {
	private int num;
	private String gcode;
	private String vcategory;
	public VariationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VariationDTO(int num, String gcode, String vcategory) {
		super();
		this.num = num;
		this.gcode = gcode;
		this.vcategory = vcategory;
	}
	@Override
	public String toString() {
		return "VariationDTO [num=" + num + ", gcode=" + gcode + ", vcategory=" + vcategory + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getVcategory() {
		return vcategory;
	}
	public void setVcategory(String vcategory) {
		this.vcategory = vcategory;
	}
	
}
