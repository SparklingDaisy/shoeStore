package com.shoe.resultInfo;

public class Shoe_resultInfoDTO {

	private int ridx;
	private String rid;
	private String rname;
	private int rprice;
	private String rimg;
	private String rdate;
	public Shoe_resultInfoDTO() {
		super();
	}
	public Shoe_resultInfoDTO(int ridx, String rid, String rname, int rprice, String rimg, String rdate) {
		super();
		this.ridx = ridx;
		this.rid = rid;
		this.rname = rname;
		this.rprice = rprice;
		this.rimg = rimg;
		this.rdate = rdate;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public int getRprice() {
		return rprice;
	}
	public void setRprice(int rprice) {
		this.rprice = rprice;
	}
	public String getRimg() {
		return rimg;
	}
	public void setRimg(String rimg) {
		this.rimg = rimg;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	
}
	