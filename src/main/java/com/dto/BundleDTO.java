package com.dto;

public class BundleDTO {
	private int num;
	private String gcode;
	private String bcategory;
	private int bprice;
	public BundleDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BundleDTO(int num, String gcode, String bcategory, int bprice) {
		super();
		this.num = num;
		this.gcode = gcode;
		this.bcategory = bcategory;
		this.bprice = bprice;
	}
	@Override
	public String toString() {
		return "Bundle [num=" + num + ", gcode=" + gcode + ", bcategory=" + bcategory + ", bprice=" + bprice + "]";
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
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public int getBprice() {
		return bprice;
	}
	public void setBprice(int bprice) {
		this.bprice = bprice;
	}
	
}
