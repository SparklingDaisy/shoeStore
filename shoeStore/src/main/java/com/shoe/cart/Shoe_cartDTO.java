package com.shoe.cart;

import java.sql.Date;

public class Shoe_cartDTO {
	
	private int cidx;
	private int ciidx;
	private String cid;
	private String cname;
	private int cprice;
	private String cimg;
	private String csize;
	private int ccnt;
	private int csum;
	private Date cputdate;
	private String mtier;
	
	
	public Shoe_cartDTO() {
		super();
	}


	public int getCidx() {
		return cidx;
	}


	public void setCidx(int cidx) {
		this.cidx = cidx;
	}


	public int getCiidx() {
		return ciidx;
	}


	public void setCiidx(int ciidx) {
		this.ciidx = ciidx;
	}


	public String getCid() {
		return cid;
	}


	public void setCid(String cid) {
		this.cid = cid;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public int getCprice() {
		return cprice;
	}


	public void setCprice(int cprice) {
		this.cprice = cprice;
	}


	public String getCimg() {
		return cimg;
	}


	public void setCimg(String cimg) {
		this.cimg = cimg;
	}


	public String getCsize() {
		return csize;
	}


	public void setCsize(String csize) {
		this.csize = csize;
	}


	public int getCcnt() {
		return ccnt;
	}


	public void setCcnt(int ccnt) {
		this.ccnt = ccnt;
	}


	public int getCsum() {
		return csum;
	}


	public void setCsum(int csum) {
		this.csum = csum;
	}


	public Date getCputdate() {
		return cputdate;
	}


	public void setCputdate(Date cputdate) {
		this.cputdate = cputdate;
	}


	public String getMtier() {
		return mtier;
	}


	public void setMtier(String mtier) {
		this.mtier = mtier;
	}



}
