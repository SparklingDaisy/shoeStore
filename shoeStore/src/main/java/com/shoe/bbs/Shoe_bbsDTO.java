package com.shoe.bbs;

import java.sql.*;

public class Shoe_bbsDTO {

	private int bidx;
	private String bid;
	private String bsubject;
	private String bcontent;
	private Date bwritedate;
	private String bimg;
	private int breadnum;
	private int bref;
	private int blev;
	private int bsunbun;
	
	public Shoe_bbsDTO() {
		super();
	}
	public Shoe_bbsDTO(int bidx, String bid, String bsubject, String bcontent, Date bwritedate, String bimg,
			int breadnum, int bref, int blev, int bsunbun) {
		super();
		this.bidx = bidx;
		this.bid = bid;
		this.bsubject = bsubject;
		this.bcontent = bcontent;
		this.bwritedate = bwritedate;
		this.bimg = bimg;
		this.breadnum = breadnum;
		this.bref = bref;
		this.blev = blev;
		this.bsunbun = bsunbun;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBsubject() {
		return bsubject;
	}
	public void setBsubject(String bsubject) {
		this.bsubject = bsubject;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(Date bwritedate) {
		this.bwritedate = bwritedate;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public int getBreadnum() {
		return breadnum;
	}
	public void setBreadnum(int breadnum) {
		this.breadnum = breadnum;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBlev() {
		return blev;
	}
	public void setBlev(int blev) {
		this.blev = blev;
	}
	public int getBsunbun() {
		return bsunbun;
	}
	public void setBsunbun(int bsunbun) {
		this.bsunbun = bsunbun;
	}
	
}