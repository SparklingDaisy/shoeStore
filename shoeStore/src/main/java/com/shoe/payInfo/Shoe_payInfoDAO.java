package com.shoe.payInfo;

import java.sql.*;

import com.shoe.item.Shoe_itemDTO;
import com.shoe.member.Shoe_memberDTO;

public class Shoe_payInfoDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**결제관련메소드*/
	public int goPay(Shoe_payInfoDTO pdto, Shoe_memberDTO mdto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_payinfo values(shoe_payinfo_idx.nextval,?,?,?,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mdto.getMid());
			ps.setString(2, mdto.getMtier());
			ps.setInt(3, pdto.getPcharge());
			ps.setString(4, pdto.getPpayment());
			ps.setString(5, pdto.getPname());
			ps.setString(6, pdto.getPnum());
			ps.setString(7, pdto.getPinfo());
			ps.setString(8, pdto.getPpwd());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**충전업데이트관련메소드*/
	public int chargeUp(Shoe_payInfoDTO pdto, Shoe_memberDTO mdto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="update shoe_member set msum=?,mnu=? where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, mdto.getMsum()+pdto.getPcharge());
			ps.setInt(2, mdto.getMnu());
			ps.setString(3, mdto.getMid());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**등급확인메소드*/
	public String goTier(Shoe_memberDTO dto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select mtier from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getMid());
			ps.executeQuery();
			rs.next();
			String tier=rs.getString("mtier");
			return tier;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**잔액확인관련메소드*/
	public int goMoney(String id) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select msum from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			rs.next();
			int sum=rs.getInt("msum");
			return sum;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null);
				if(ps!=null);
				if(conn!=null);
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**상품조회관련메소드*/
	public Shoe_itemDTO itemSearch(int iidx) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select * from shoe_item where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, iidx);
			rs = ps.executeQuery();
			
			Shoe_itemDTO dtos = new Shoe_itemDTO();
			if(rs.next()) {
				dtos.setIidx(rs.getInt("iidx"));
				dtos.setIimg(rs.getString("iimg"));
				dtos.setIname(rs.getString("iname"));
				dtos.setIprice(rs.getInt("iprice"));
				dtos.setIsize(rs.getString("isize"));
				dtos.setIview(rs.getString("iview"));
			}
			return dtos;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	/**결제관련메소드*/
	public int itemSell(Shoe_memberDTO mdto, int price) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="update shoe_member set msum=?,mnu=? where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, mdto.getMsum()-price);
			ps.setInt(2, mdto.getMnu()+price);
			ps.setString(3, mdto.getMid());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null);
				if(conn!=null);
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**등급에 따른 할인율 관련 메소드*/
	public int goSale(Shoe_memberDTO mdto) {
		int sale=0;
		switch(mdto.getMtier()) {
			case "bronze": sale=5; break;
			case "silver": sale=10;break;
			case "gold": sale=15;break;
			case "platinum": sale=20;
			default : sale=0;
		}
		return sale;
	}
	/**등급 상승관련 메소드*/
	public int upTier(Shoe_memberDTO mdto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="update shoe_member set mtier=? where mid=?";
			ps=conn.prepareStatement(sql);
			if(mdto.getMnu()>1000000) {
				ps.setString(1, "platinum");
			}else if(mdto.getMnu()>500000) {
				ps.setString(1, "gold");
			}else if(mdto.getMnu()>100000) {
				ps.setString(1, "silver");
			}else {
				return -1;
			}
			ps.setString(2, mdto.getMid());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
