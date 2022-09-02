package com.shoe.item;

import java.sql.Date;

public class Shoe_itemDTO {
	
	private int iidx;
	private String iid;
	private String iname;
	private int iprice;
	private String iimg;
	private String isize;
	private int icnt;
	private String iview;
	private Date iwritedate;
	private String icategory[];
	
	
	public Shoe_itemDTO() {
		super();
	}


	public int getIidx() {
		return iidx;
	}


	public void setIidx(int iidx) {
		this.iidx = iidx;
	}


	public String getIid() {
		return iid;
	}


	public void setIid(String iid) {
		this.iid = iid;
	}


	public String getIname() {
		return iname;
	}


	public void setIname(String iname) {
		this.iname = iname;
	}


	public int getIprice() {
		return iprice;
	}


	public void setIprice(int iprice) {
		this.iprice = iprice;
	}


	public String getIimg() {
		return iimg;
	}


	public void setIimg(String iimg) {
		this.iimg = iimg;
	}


	public String getIsize() {
		return isize;
	}


	public void setIsize(String isize) {
		this.isize = isize;
	}


	public int getIcnt() {
		return icnt;
	}


	public void setIcnt(int icnt) {
		this.icnt = icnt;
	}


	public String getIview() {
		return iview;
	}


	public void setIview(String iview) {
		this.iview = iview;
	}


	public Date getIwritedate() {
		return iwritedate;
	}


	public void setIwritedate(Date iwritedate) {
		this.iwritedate = iwritedate;
	}


	public String[] getIcategory() {
		return icategory;
	}


	public void setIcategory(String[] icategory) {
		this.icategory = icategory;
	}
	
	

}
