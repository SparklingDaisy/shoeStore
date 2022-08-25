package com.shoe.member;

import java.sql.*;

public class shoe_memberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public shoe_memberDAO() {
		
	}
	
	/**회원가입 메서드*/
	public int memberJoin(shoe_memberDTO dto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_member values(shoe_member_idx.nextval,?,?,?,?,?,?,?,?,?,'bronze',sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getMid());
			ps.setString(2, dto.getMpwd());
			ps.setString(3, dto.getMname());
			ps.setString(4, dto.getMbirthdate());
			ps.setString(5, dto.getMgender());
			ps.setString(6, dto.getMtel());
			ps.setString(7, dto.getMemail());
			ps.setString(8, dto.getMad());
			ps.setString(9, dto.getMaddr());
			
			
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
				}
			}
			
		}
	
	/**ID중복검사 메서드*/
	public boolean idCheck(String mid) {
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select mid from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs=ps.executeQuery();
			return rs.next();				
			
		}catch(Exception e) {
			e.printStackTrace();
			return false;

		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close(); 
				if(conn!=null)conn.close();
				
			}catch(Exception e2) {
				}
			}
			
		}
	
	/**마이페이지 내 정보 메서드*/
	public ArrayList<shoe_memberDTO> myInfo(){
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select * from shoe_member"; // ?인파라미터는 밸류에만 적용가능
			ps=conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs=ps.executeQuery();
			
			ArrayList<shoe_memberDTO> arr=new ArrayList<shoe_memberDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String tel=rs.getString("tel");
				String addr=rs.getString("addr");
				java.sql.Date joindate=rs.getDate("joindate");
				
				shoe_memberDTO dto=new shoe_memberDTO(idx, id, pwd, name, email, tel, addr, joindate);
				arr.add(dto);
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
			}catch(Exception e2) {}
		}
	}
	
	

}
