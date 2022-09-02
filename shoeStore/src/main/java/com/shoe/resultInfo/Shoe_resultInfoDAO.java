package com.shoe.resultInfo;

import java.sql.*;
import java.util.*;

public class Shoe_resultInfoDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Shoe_resultInfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int setInfo(String rid, int rprice) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_resultInfo values(shoe_resultinfo_idx.nextval,?,'',?,'',?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rid);
			ps.setInt(2, rprice);
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
			String rdate=now.get(Calendar.YEAR)+"-"+mm_s+"-"+dd_s;
			ps.setString(3, rdate);
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	public int sumPrice(String rid, String rdate) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select sum(rprice) from shoe_resultinfo where rid=? and substr(rdate,6,2)=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rid);
			ps.setString(2, rdate);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
}
