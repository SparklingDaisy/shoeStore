package com.shoe.member;

import java.sql.*;
import java.util.*;
import com.shoe.bbs.*;

public class Shoe_memberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public Shoe_memberDAO() {
		
	}
	
	/**회원가입 메서드*/
	public int memberJoin(Shoe_memberDTO dto) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="insert into shoe_member values(shoe_member_idx.nextval,?,?,?,?,?,?,?,?,?,'bronze',0,0,sysdate)";
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
	
	/**로그인 검증 관련 메서드*/	
	public int loginCheck(String mid, String mpwd) {
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select mpwd from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, mid);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				String dbpwd=rs.getString(1);
				if(dbpwd.equals(mpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close(); //null인 경우 에러가 발생하므로 미리 조건지정해줌
				if(conn!=null)conn.close();
				
			}catch(Exception e2) {
				}
			}
			
		}
	
	/**사용자 정보 추출 관련메서드*/
	public String getUserInfo(String mid) {
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select mname from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,mid);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {
				
			}
		}
	}
	
	/**회원정보검색 메서드*/
	public Shoe_memberDTO myInfo(String sid){
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select * from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs=ps.executeQuery();
			
			Shoe_memberDTO dto=null;
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String mid=rs.getString("mid");
				String mpwd=rs.getString("mpwd");
				String mname=rs.getString("mname");
				String mbirthdate=rs.getString("mbirthdate");
				String mgender=rs.getString("mgender");
				String memail=rs.getString("memail");
				String mtel=rs.getString("mtel");
				String mad=rs.getString("mad");
				String maddr=rs.getString("maddr");
				String mtier=rs.getString("mtier");
				int msum=rs.getInt("msum");
				int mnu=rs.getInt("mnu");
				java.sql.Date mjoindate=rs.getDate("mjoindate");
				
				dto=new Shoe_memberDTO(idx, mid, mpwd, mname, mbirthdate, mgender, mtel, memail, mad, maddr, mtier, msum, mnu, mjoindate);
			}
			return dto;	
			
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
	
	/**회원정보수정 메서드*/
	public int memberUpdate(Shoe_memberDTO dto) {
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
	
			String sql="update shoe_member set mpwd=?,mtel=?,maddr=?,memail=? where mid=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getMpwd());
			ps.setString(2,dto.getMtel());
			ps.setString(3,dto.getMaddr());
			ps.setString(4,dto.getMemail());
			ps.setString(5,dto.getMid());
			
			int count=ps.executeUpdate();
			return count;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1; //잘못 되었을 경우 값이 없다~
			
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/**회원탈퇴 관련 메서드*/
	public int deleteAccount(String sid) { //사실 name만 받아오는게 더 효율적
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			
			String sql="delete from shoe_member where mid=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			int count=ps.executeUpdate();
			return count;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1; //잘못되면 음수를 돌려줌
			
		}finally {
			try {
				if(ps!=null)ps.close(); //null인 경우 에러가 발생하므로 미리 조건지정해줌
				if(conn!=null)conn.close();
				
			}catch(Exception e2) {
				}
			}
		}
	
	/**나의 질문 관련 메서드**/
	public ArrayList<Shoe_bbsDTO> myWriteList(int ls,int cp){
		
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			//String sql="select * from jsp_bbs order by idx desc";
			
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			
			String sql="select * from "
					+ "(select rownum as rnum,a.* from "
					+ "(select * from jsp_bbs order by ref desc, sunbun asc)a)b "
					+ "where rnum>=? and rnum<=?";		//커리에는 연산식을 넣지 않는 전제를 가진다.
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			
			ArrayList<Shoe_bbsDTO> arr=new ArrayList<Shoe_bbsDTO>();
			while(rs.next()) {
				
				int idx=rs.getInt("idx");
				String writer=rs.getString("writer");
				String pwd=rs.getString("pwd");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum=rs.getInt("readnum");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				Shoe_bbsDTO dto=new Shoe_bbsDTO(idx, pwd, subject, content, writedate, content, readnum, ref, lev, sunbun);
						
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
			}catch(Exception e2) {
				
			}
		}
		
	}
	

}
