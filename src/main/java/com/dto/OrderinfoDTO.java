package com.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("OrderinfoDTO")
public class OrderinfoDTO {
	private int num;
	private String userid;
	private String gcode;
	private String gname;
	private String bcategory;
	private String vcategory;
	private int gprice;
	private int gamount;
	private String ordername; 
	private int post;
	private String addr1;
	private String addr2;
	private int phone1;
	private int phone2;
	private int phone3;
	private String paymethod;
	private Date orderday;
	private String gimage;
	public OrderinfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderinfoDTO(int num, String userid, String gcode, String gname, String bcategory, String vcategory,
			int gprice, int gamount, String ordername, int post, String addr1, String addr2, int phone1, int phone2,
			int phone3, String paymethod, Date orderday, String gimage) {
		super();
		this.num = num;
		this.userid = userid;
		this.gcode = gcode;
		this.gname = gname;
		this.bcategory = bcategory;
		this.vcategory = vcategory;
		this.gprice = gprice;
		this.gamount = gamount;
		this.ordername = ordername;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.paymethod = paymethod;
		this.orderday = orderday;
		this.gimage = gimage;
	}
	@Override
	public String toString() {
		return "OrderinfoDTO [num=" + num + ", userid=" + userid + ", gcode=" + gcode + ", gname=" + gname
				+ ", bcategory=" + bcategory + ", vcategory=" + vcategory + ", gprice=" + gprice + ", gamount="
				+ gamount + ", ordername=" + ordername + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", paymethod=" + paymethod
				+ ", orderday=" + orderday + ", gimage=" + gimage + "]";
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
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	public int getGamount() {
		return gamount;
	}
	public void setGamount(int gamount) {
		this.gamount = gamount;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public Date getOrderday() {
		return orderday;
	}
	public void setOrderday(Date orderday) {
		this.orderday = orderday;
	}
	public String getGimage() {
		return gimage;
	}
	public void setGimage(String gimage) {
		this.gimage = gimage;
	}
	
	
	
}
