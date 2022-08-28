package com.shoe.bbs;

import java.sql.*;
import java.util.*;
import java.io.*;

public class Shoe_bbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public Shoe_bbsDAO() {
		// TODO Auto-generated constructor stub
	}
	/**ref추출 관련 메서드*/
	public int getMaxRef() {
		try {
			String sql="select max(bref) from shoe_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	/**글쓰기 관련 메서드*/
	public int bbsWrite(String bid, String bsubject, String bcontent, String bimg) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			int bref=getMaxRef();
			String sql="insert into shoe_bbs values(shoe_bbs_idx.nextval,?,?,?,sysdate,?,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, bid);
			ps.setString(2, bsubject);
			ps.setString(3, bcontent);
			ps.setString(4, bimg);
			ps.setInt(5, bref+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**sun변경 관련 메서드*/
	public void updateSun(int bref,int bsunbun) {
		try {
			String sql="update shoe_bbs set bsunbun=bsunbun+1 where bref=? and bsunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bref);
			ps.setInt(2, bsunbun);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	/**답변쓰기 관련 메서드*/
	public int bbsReWrite(int bref, int blev, int bsunbun, String bid, String bsubject, String bcontent, String bimg) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			updateSun(bref, bsunbun+1);
			String sql="insert into shoe_bbs values(shoe_bbs_idx.nextval,?,?,?,sysdate,?,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, bid);
			ps.setString(2, bsubject);
			ps.setString(3, bcontent);
			ps.setString(4, bimg);
			ps.setInt(5, bref);
			ps.setInt(6, blev+1);
			ps.setInt(7, bsunbun+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**총게시물수 추출 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select count(*) from shoe_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**글 목록 관련 메서드*/
	public ArrayList<Shoe_bbsDTO> bbsList(int ls,int cp){
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql="select * from "
					+ "(select rownum as r,a.* from "
					+ "(select * from shoe_bbs order by bref desc,bsunbun asc)a)b "
					+ "where r>=? and r<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			ArrayList<Shoe_bbsDTO> arr=new ArrayList<Shoe_bbsDTO>();
			while(rs.next()) {
				int bidx=rs.getInt("bidx");
				String bid=rs.getString("bid");
				String bsubject=rs.getString("bsubject");
				String bcontent=rs.getString("bcontent");
				java.sql.Date bwritedate=rs.getDate("bwritedate");
				String bimg=rs.getString("bimg");
				int breadnum=rs.getInt("breadnum");
				int bref=rs.getInt("bref");
				int blev=rs.getInt("blev");
				int bsunbun=rs.getInt("bsunbun");
				Shoe_bbsDTO dto=new Shoe_bbsDTO(bidx, bid, bsubject, bcontent, bwritedate, bimg, breadnum, bref, blev, bsunbun);
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
	/**본문 관련 메서드*/
	public Shoe_bbsDTO bbsContent(int bidx) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="select * from shoe_bbs where bidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bidx);
			rs=ps.executeQuery();
			Shoe_bbsDTO dto=null;
			if(rs.next()) {
				String bid=rs.getString("bid");
				String bsubject=rs.getString("bsubject");
				String bcontent=rs.getString("bcontent");
				java.sql.Date bwritedate=rs.getDate("bwritedate");
				String bimg=rs.getString("bimg");
				int breadnum=rs.getInt("breadnum");
				int bref=rs.getInt("bref");
				int blev=rs.getInt("blev");
				int bsunbun=rs.getInt("bsunbun");
				dto=new Shoe_bbsDTO(bidx, bid, bsubject, bcontent, bwritedate, bimg, breadnum, bref, blev, bsunbun);
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
	/**조회수 관련 메서드*/
	public int breadnum(int bidx,int breadnum) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="update shoe_bbs set breadnum=? where bidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, breadnum);
			ps.setInt(2, bidx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**게시글 삭제 관련 메서드*/
	public int bbsDelete(int bref, String bimg, String path) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			String sql="delete from shoe_bbs where bref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bref);
			int count=ps.executeUpdate();
			if(bimg==null) {
				return count;
			}else {
				File f=new File(path+"/bbs/img/"+bimg);
				if(f.exists()) {
					f.delete();
				}
				return count;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**게시글 수정시 기존 사진 삭제 관련 메서드*/
	public void updateBimg(int bidx, String path) {
		try {
			String sql="select bimg from shoe_bbs where bidx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bidx);
			rs=ps.executeQuery();
			if(rs.next()) {
				String obimg=rs.getString(1);
				if(obimg!=null) {
					File f=new File(path+"/"+obimg);
					if(f.exists()) {
						f.delete();
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	/**게시글 수정 관련 메서드*/
	public int bbsUpdate(int bidx, String bsubject, String bcontent, String bimg, String path) {
		try {
			conn=com.shoe.db.ShoeDB.getConn();
			updateBimg(bidx, path);
			String sql="update shoe_bbs set bsubject=?, bcontent=?, bimg=? where bidx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, bsubject);
			ps.setString(2, bcontent);
			ps.setString(3, bimg);
			ps.setInt(4, bidx);
			return ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
}
