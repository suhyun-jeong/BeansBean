package com.dto;




import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("Cook_BrdDTO")
public class Cook_BrdDTO {
	private int num;
	private String userid;
	private int type_num;
	private String title;
	private String content;
	private Date regdate;
	public Cook_BrdDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cook_BrdDTO(int num, String userid, int type_num, String title, String content, Date regdate) {
		super();
		this.num = num;
		this.userid = userid;
		this.type_num = type_num;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Cook_BrdDTO [num=" + num + ", userid=" + userid + ", type_num=" + type_num + ", title=" + title
				+ ", content=" + content + ", regdate=" + regdate + "]";
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
	public int getType_num() {
		return type_num;
	}
	public void setType_num(int type_num) {
		this.type_num = type_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
