package com.shoe.payInfo;

import java.sql.*;
import java.util.Calendar;
import java.util.*;

import com.shoe.cart.Shoe_cartDTO;
import com.shoe.item.Shoe_itemDTO;
import com.shoe.member.Shoe_memberDTO;
import com.shoe.result.Shoe_resultDTO;

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
				dtos.setIcnt(rs.getInt("icnt"));
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
			case "platinum": sale=20;break;
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
	/**구매내역저장메소드*/
	public int sellSave(Shoe_memberDTO mdto, Shoe_cartDTO cdto[]) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_resultinfo values(shoe_resultinfo_idx.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			for(int i=0; i<cdto.length; i++) {
				ps.setString(1, mdto.getMid());
				ps.setString(2, cdto[i].getCname());
				ps.setInt(3, cdto[i].getCprice());
				ps.setString(4, cdto[i].getCimg());
				Calendar now=Calendar.getInstance();
				int mm=now.get(Calendar.MONTH)+1;
				String mm_s=String.valueOf(mm);
				if(String.valueOf(mm).length()==1){
				   mm_s="0"+String.valueOf(mm);
				}
				int dd=now.get(Calendar.DATE);
				String dd_s=String.valueOf(dd);
				if(String.valueOf(dd).length()==1){
				   dd_s="0"+String.valueOf(dd);
				}
				String date=now.get(Calendar.YEAR)+"-"+mm_s+"-"+dd_s;
				ps.setString(5,date);
				int count=ps.executeUpdate();
			}
			return 1;
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
	/**구매내역저장메소드(바로)*/
	public int baroSave(Shoe_memberDTO mdto, Shoe_itemDTO idto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_resultinfo values(shoe_resultinfo_idx.nextval,?,?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mdto.getMid());
			ps.setString(2, idto.getIname());
			ps.setInt(3, idto.getIprice());
			ps.setString(4, idto.getIimg());
			Calendar now=Calendar.getInstance();
			int mm=now.get(Calendar.MONTH)+1;
			String mm_s=String.valueOf(mm);
			if(String.valueOf(mm).length()==1){
			   mm_s="0"+String.valueOf(mm);
			}
			int dd=now.get(Calendar.DATE);
			String dd_s=String.valueOf(dd);
			if(String.valueOf(dd).length()==1){
			   dd_s="0"+String.valueOf(dd);
			}
			String date=now.get(Calendar.YEAR)+"-"+mm_s+"-"+dd_s;
			ps.setString(5,date);
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
	/**구매내역조회메소드*/
	public ArrayList<Shoe_resultDTO> sellSearch(int cp,int ls) {
		try {
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select * from "
					+ "(select rownum as r,a.* from "
					+ "(select * from shoe_resultinfo order by ridx desc)a)b "
					+ "where r>=? and r<=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1,start);
				ps.setInt(2, end);
			rs=ps.executeQuery();
			ArrayList<Shoe_resultDTO> arr=new ArrayList<>();
			while(rs.next()) {
				int ridx=rs.getInt("ridx");
				String rid=rs.getString("rid");
				String rname=rs.getString("rname");
				int rprice=rs.getInt("rprice");
				String rimg=rs.getString("rimg");
				String rdate=rs.getString("rdate");
				Shoe_resultDTO rdto=new Shoe_resultDTO(ridx, rid, rname, rprice, rimg, rdate);
				arr.add(rdto);
			}
			return arr;
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
	/**총게시물 갯수 메소드*/
	public int getRef(String id) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select max(ridx) from shoe_resultinfo where rid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
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
}
