package com.shoe.payInfo;

public class Shoe_payInfoDTO {
	
	private int pidx;
	private String pid;
	private String pgrade;
	private int pcharge;
	private String ppayment;
	private String pname;
	private String pnum;
	private String pinfo;
	private String ppwd;
	private String pdate;
	
	public Shoe_payInfoDTO() {
		// TODO Auto-generated constructor stub
	}

	public Shoe_payInfoDTO(int pidx, String pid, String pgrade, int pcharge, String ppayment, String pname, String pnum,
			String pinfo, String ppwd, String pdate) {
		super();
		this.pidx = pidx;
		this.pid = pid;
		this.pgrade = pgrade;
		this.pcharge = pcharge;
		this.ppayment = ppayment;
		this.pname = pname;
		this.pnum = pnum;
		this.pinfo = pinfo;
		this.ppwd = ppwd;
		this.pdate = pdate;
	}


	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPgrade() {
		return pgrade;
	}

	public void setPgrade(String pgrade) {
		this.pgrade = pgrade;
	}

	public int getPcharge() {
		return pcharge;
	}

	public void setPcharge(int pcharge) {
		this.pcharge = pcharge;
	}

	public String getPpayment() {
		return ppayment;
	}

	public void setPpayment(String ppayment) {
		this.ppayment = ppayment;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public String getPpwd() {
		return ppwd;
	}

	public void setPpwd(String ppwd) {
		this.ppwd = ppwd;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	
}
