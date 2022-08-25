package com.shoe.member;
import java.sql.*;

public class shoe_memberDTO {

	private int midx;
	private String mid;
	private String mpwd;
	private String mname;
	private String mbirthdate;
	private String mgender;
	private String mtel;
	private String memail;
	private String mad;
	private String maddr;
	private String mtier;
	private Date mjoindate;
	
	public shoe_memberDTO() {
		super();
	}

	public shoe_memberDTO(int midx, String mid, String mpwd, String mname, String mbirthdate, String mgender,
			String mtel, String memail, String mad, String maddr, String mtier, Date mjoindate) {
		super();
		this.midx = midx;
		this.mid = mid;
		this.mpwd = mpwd;
		this.mname = mname;
		this.mbirthdate = mbirthdate;
		this.mgender = mgender;
		this.mtel = mtel;
		this.memail = memail;
		this.mad = mad;
		this.maddr = maddr;
		this.mtier = mtier;
		this.mjoindate = mjoindate;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpwd() {
		return mpwd;
	}

	public void setMpwd(String mpwd) {
		this.mpwd = mpwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMbirthdate() {
		return mbirthdate;
	}

	public void setMbirthdate(String mbirthdate) {
		this.mbirthdate = mbirthdate;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMad() {
		return mad;
	}

	public void setMad(String mad) {
		this.mad = mad;
	}

	public String getMaddr() {
		return maddr;
	}

	public void setMaddr(String maddr) {
		this.maddr = maddr;
	}

	public Date getMjoindate() {
		return mjoindate;
	}

	public void setMjoindate(Date mjoindate) {
		this.mjoindate = mjoindate;
	}

	public String getMtier() {
		return mtier;
	}

	public void setMtier(String mtier) {
		this.mtier = mtier;
	}
	
	
			
	
}
