package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("IngrementDTO")
public class IngrementDTO {
	private int ingreno;
	private int num;
	private String ingre;
	private int capacity;
	public IngrementDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IngrementDTO(int ingreno, int num, String ingre, int capacity) {
		super();
		this.ingreno = ingreno;
		this.num = num;
		this.ingre = ingre;
		this.capacity = capacity;
	}
	@Override
	public String toString() {
		return "IngrementDTO [ingreno=" + ingreno + ", num=" + num + ", ingre=" + ingre + ", capacity=" + capacity
				+ "]";
	}
	public int getIngreno() {
		return ingreno;
	}
	public void setIngreno(int ingreno) {
		this.ingreno = ingreno;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
}
