package com.shoe.member;
import java.sql.*;

public class Shoe_memberDTO {

	private int idx;
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
	private int msum;
	private int mnu;
	private Date mjoindate;
	
	public Shoe_memberDTO() {
		super();
	}

	public Shoe_memberDTO(int idx, String mid, String mpwd, String mname, String mbirthdate, String mgender,
			String mtel, String memail, String mad, String maddr, String mtier, int msum, int mnu,Date mjoindate) {
		
		super();
		this.idx = idx;
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
		this.msum = msum;
		this.mnu = mnu;
		this.mjoindate = mjoindate;
	}

	public int getidx() {
		return idx;
	}

	public void setidx(int idx) {
		this.idx = idx;
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

	public int getMsum() {
		return msum;
	}

	public void setMsum(int msum) {
		this.msum = msum;
	}

	public int getMnu() {
		return mnu;
	}

	public void setMnu(int mnu) {
		this.mnu = mnu;
	}
	
	
	
			
	
}
