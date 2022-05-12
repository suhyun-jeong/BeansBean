package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("CartDTO")
public class CartDTO {
	private int num;
	private String userid;
	private String gcode;
	private String gname;
	private int gprice;
	private String bcategory;
	private String vcategory;
	private int  gamount;
	private String gimage;
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartDTO(int num, String userid, String gcode, String gname, int gprice, String bcategory, String vcategory,
			int gamount, String gimage) {
		super();
		this.num = num;
		this.userid = userid;
		this.gcode = gcode;
		this.gname = gname;
		this.gprice = gprice;
		this.bcategory = bcategory;
		this.vcategory = vcategory;
		this.gamount = gamount;
		this.gimage = gimage;
	}
	@Override
	public String toString() {
		return "CartDTO [num=" + num + ", userid=" + userid + ", gcode=" + gcode + ", gname=" + gname + ", gprice="
				+ gprice + ", bcategory=" + bcategory + ", vcategory=" + vcategory + ", gamount=" + gamount
				+ ", gimage=" + gimage + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getVcategory() {
		return vcategory;
	}
	public void setVcategory(String vcategory) {
		this.vcategory = vcategory;
	}
	public int getGamount() {
		return gamount;
	}
	public void setGamount(int gamount) {
		this.gamount = gamount;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	
	
}
