package com.shoe.item;

import java.sql.*;
import java.util.ArrayList;
import java.io.*;
import com.oreilly.servlet.*; //multipart

public class Shoe_itemDAO {
		
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	/**상품등록 관련 메소드*/
	public int uploadItem(MultipartRequest mr) { 
		String arr;
		try { 
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "insert into shoe_item values(shoe_item_iidx.nextval,?,?,?,?,default,0,?,sysdate,?)";
			ps = conn.prepareStatement(sql);
			String iid = mr.getParameter("id"); 
			String iname = mr.getParameter("iname");
			String iprice_s = mr.getParameter("iprice");
			int iprice = Integer.parseInt(iprice_s);
			String iimg = mr.getFilesystemName("iimg"); 
			String iview = mr.getParameter("iview");
			String catearr[] = mr.getParameterValues("icategory");
			String icategory = catearr[0];	//일단 인덱스0번째 값을 넣어서 기본값 + 선택한 값 들어가도록 함. 
			for(int i=1; i<catearr.length; i++) {
				icategory = icategory + "," + catearr[i];
			}
			ps.setString(1, iid);
			ps.setString(2, iname);
			ps.setInt(3, iprice);
			ps.setString(4, iimg);		
			ps.setString(5, iview);
			ps.setString(6, icategory);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {

			}
		}
	}
	
	
	/**고객용 상품 리스트 보기(default) 메소드*/
	public ArrayList<Shoe_itemDTO> itemList(String icategory, int listSize, int cp){
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			int start = (cp-1)*listSize+1;
			int end = cp*listSize;
			String sql = "select * from (select rownum as rnum, a.* "
					     +"from (select * from shoe_item where icategory like ? order by iwritedate desc) a) b " 
					     +"where rnum >=? and rnum <=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+icategory+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<Shoe_itemDTO> arr = new ArrayList<Shoe_itemDTO>();
			while(rs.next()) {
				int iidx = rs.getInt("iidx");
				//String iid = rs.getString("iid");
				String iname = rs.getString("iname");
				int iprice = rs.getInt("iprice");
				String iimg = rs.getString("iimg");
				java.sql.Date iwritedate = rs.getDate("iwritedate");
				Shoe_itemDTO dto = new Shoe_itemDTO();
				dto.setIidx(iidx);
				//dto.setIid(iid);
				dto.setIname(iname);
				dto.setIprice(iprice);
				dto.setIimg(iimg);
				dto.setIwritedate(iwritedate);
				arr.add(dto);
			}
			return arr;
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
	

	/**[보류] 고객용 상품 리스트 보기(높은 금액순) 메소드*/
	public ArrayList<Shoe_itemDTO> itemListHighCost(String icategory, int listSize, int cp){
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			int start = (cp-1)*listSize+1;
			int end = cp*listSize;
			String sql = "select * from (select rownum as rnum, a.* "
					     +"from (select * from shoe_item where icategory like ? order by iprice desc) a) b " 
					     +"where rnum >=? and rnum <=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+icategory+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<Shoe_itemDTO> arr = new ArrayList<Shoe_itemDTO>();
			while(rs.next()) {
				int iidx = rs.getInt("iidx");
				//String iid = rs.getString("iid");
				String iname = rs.getString("iname");
				int iprice = rs.getInt("iprice");
				String iimg = rs.getString("iimg");
				java.sql.Date iwritedate = rs.getDate("iwritedate");
				Shoe_itemDTO dto = new Shoe_itemDTO();
				dto.setIidx(iidx);
				//dto.setIid(iid);
				dto.setIname(iname);
				dto.setIprice(iprice);
				dto.setIimg(iimg);
				dto.setIwritedate(iwritedate);
				arr.add(dto);
			}
			return arr;
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
	
	
	/**[보류] 고객용 상품 리스트 보기(낮은 금액순) 메소드*/
	public ArrayList<Shoe_itemDTO> itemListLowCost(String icategory, int listSize, int cp){
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			int start = (cp-1)*listSize+1;
			int end = cp*listSize;
			String sql = "select * from (select rownum as rnum, a.* "
					     +"from (select * from shoe_item where icategory like ? order by iprice asc) a) b " 
					     +"where rnum >=? and rnum <=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+icategory+"%");
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<Shoe_itemDTO> arr = new ArrayList<Shoe_itemDTO>();
			while(rs.next()) {
				int iidx = rs.getInt("iidx");
				//String iid = rs.getString("iid");
				String iname = rs.getString("iname");
				int iprice = rs.getInt("iprice");
				String iimg = rs.getString("iimg");
				java.sql.Date iwritedate = rs.getDate("iwritedate");
				Shoe_itemDTO dto = new Shoe_itemDTO();
				dto.setIidx(iidx);
				//dto.setIid(iid);
				dto.setIname(iname);
				dto.setIprice(iprice);
				dto.setIimg(iimg);
				dto.setIwritedate(iwritedate);
				arr.add(dto);
			}
			return arr;
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
	
	
	/**총 게시물 수 추출 관련 메소드*/
	public int getTotalCnt(String icategory) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select count(*) from shoe_item where icategory like ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+icategory+"%");
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0? 1:count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**관리자용 상품 리스트 보기 메소드*/
	public ArrayList<Shoe_itemDTO> itemListAdmin(int listSize, int cp){
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			int start = (cp-1)*listSize+1;
			int end = cp*listSize;
			String sql = "select * from (select rownum as rnum, a.* "
					     +"from (select * from shoe_item order by iwritedate desc) a) b " 
					     +"where rnum >=? and rnum <=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<Shoe_itemDTO> arr = new ArrayList<Shoe_itemDTO>();
			while(rs.next()) {
				int iidx = rs.getInt("iidx");
				String iname = rs.getString("iname");
				int iprice = rs.getInt("iprice");
				String iimg = rs.getString("iimg");
				String isize = rs.getString("isize");
				int icnt = rs.getInt("icnt");
				String iview = rs.getString("iview");
				java.sql.Date iwritedate = rs.getDate("iwritedate");
				String icategory = rs.getString("icategory");
				String cateArr[] = icategory.split(",");
				for(int i=0; i<cateArr.length; i++) {
//					System.out.print(cateArr[i]+" "); //test용
					cateArr[i] = cateArr[i]+" ";
				}
				
				Shoe_itemDTO dto = new Shoe_itemDTO();
				dto.setIidx(iidx);
				dto.setIname(iname);
				dto.setIprice(iprice);
				dto.setIimg(iimg);
				dto.setIsize(isize);
				dto.setIcnt(icnt);
				dto.setIview(iview);
				dto.setIwritedate(iwritedate);
				dto.setIcategory(cateArr); 
//				for(int i=0; i<cateArr.length; i++) { //test용
//					System.out.println("***");
//					System.out.print(cateArr[i]+" ");
//				}
				arr.add(dto);
			}
			return arr;
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
	
	
	/**관리자용 총 게시물 수 추출 관련 메소드*/
	public int getTotalCntAdmin() {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select count(*) from shoe_item";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0? 1:count;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**관리자용 게시물 삭제 메소드*/
	public int itemDelAdmin(Shoe_itemDTO dto, String path) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "delete from shoe_item where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIidx());
			int count = ps.executeUpdate();
			//////////////////////////////////
			File f = new File(path + "/item/itemimg/" + dto.getIimg());
			if(f.exists()) {
				f.delete();
			}
			//////////////////////////////////
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**관리자용 게시물 수정 전 조회 메소드*/
	public Shoe_itemDTO itemBeforeUpdate(Shoe_itemDTO dto) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select * from shoe_item where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIidx());
			rs = ps.executeQuery();
			
			Shoe_itemDTO dtos = new Shoe_itemDTO();
			if(rs.next()) {
				dtos.setIidx(rs.getInt("iidx"));
				//dtos.setIid(rs.getString("iid"));
				dtos.setIimg(rs.getString("iimg"));
				dtos.setIname(rs.getString("iname"));
				dtos.setIprice(rs.getInt("iprice"));
				dtos.setIsize(rs.getString("isize"));
				dtos.setIview(rs.getString("iview"));
				dtos.setIwritedate(rs.getDate("iwritedate"));
				String cateArr[] = rs.getString("icategory").split(",");
				for(int i=0; i<cateArr.length; i++) {
					cateArr[i] = cateArr[i]+" ";
				}
				dtos.setIcategory(cateArr);
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
	
	
	/**수정 전 사진 삭제 메소드*/
	public void onlyImgDel(int iidx, String path) {
		try {
			String sql = "select iimg from shoe_item where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, iidx);
			rs = ps.executeQuery();
			if(rs.next()) {
				String iimg = rs.getString("iimg");
				if(iimg!=null) {
					File f = new File(path + "/item/itemimg/" + iimg);
					if(f.exists()) {
						f.delete();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**관리자용 게시물 수정 메소드*/
	public int itemUpdate(MultipartRequest mr, int iidx, String path) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			onlyImgDel(iidx, path);
			String sql = "update shoe_item set iimg=?, iname=?, iprice=?, isize=?, iview=? where iidx=?";
			ps = conn.prepareStatement(sql); 
			String iimg = mr.getFilesystemName("iimg"); 
			String iname = mr.getParameter("iname");
			String iprice_s = mr.getParameter("iprice");
			int iprice = Integer.parseInt(iprice_s);
			String isize = mr.getParameter("isize");
			String iview = mr.getParameter("iview");
		
			ps.setString(1, iimg);
			ps.setString(2, iname);
			ps.setInt(3, iprice);		
			ps.setString(4, isize);		
			ps.setString(5, iview);
			ps.setInt(6, iidx);
			
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**상품 상세 조회 메소드*/
	public Shoe_itemDTO detailPage(Shoe_itemDTO dto) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select * from shoe_item where iidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIidx());
			rs = ps.executeQuery();
			
			Shoe_itemDTO dtos = new Shoe_itemDTO();
			if(rs.next()) {
				dtos.setIidx(rs.getInt("iidx"));
				//dtos.setIid(rs.getString("iid"));
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
	
	public ArrayList<Shoe_itemDTO> itemSearchList(String search, int listSize, int cp){
        try {
            conn = com.shoe.db.ShoeDB.getConn();
            int start = (cp-1)listSize+1;
            int end = cplistSize;
            String sql = "select * from (select rownum as rnum, a.* "
                         +"from (select * from shoe_item where iname like ? order by iwritedate desc) a) b " 
                         +"where rnum >=? and rnum <=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+search+"%");
            ps.setInt(2, start);
            ps.setInt(3, end);
            rs = ps.executeQuery();
            ArrayList<Shoe_itemDTO> arr = new ArrayList<Shoe_itemDTO>();
            while(rs.next()) {
                int iidx = rs.getInt("iidx");
                //String iid = rs.getString("iid");
                String iname = rs.getString("iname");
                int iprice = rs.getInt("iprice");
                String iimg = rs.getString("iimg");
                java.sql.Date iwritedate = rs.getDate("iwritedate");
                Shoe_itemDTO dto = new Shoe_itemDTO();
                dto.setIidx(iidx);
                //dto.setIid(iid);
                dto.setIname(iname);
                dto.setIprice(iprice);
                dto.setIimg(iimg);
                dto.setIwritedate(iwritedate);
                arr.add(dto);
            }
            return arr;
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
	
}
