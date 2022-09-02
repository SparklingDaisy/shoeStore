package com.shoe.cart;

import java.sql.*;
import java.util.ArrayList;

import com.shoe.item.Shoe_itemDTO;

public class Shoe_cartDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	/**카트DB 정보 입력 메소드*/
	public int UploadCart(Shoe_cartDTO dto) {
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "insert into shoe_cart values(shoe_cart_cidx.nextval,?,?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getCiidx());
			ps.setString(2, dto.getCid());
			ps.setString(3, dto.getCname());
			ps.setInt(4, dto.getCprice());
			ps.setString(5, dto.getCimg());
			ps.setString(6, dto.getCsize());
			ps.setInt(7, dto.getCcnt());
			ps.setInt(8, (dto.getCprice()*dto.getCcnt()));
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
	
	
	/**장바구니 페이지 조회 메소드*/
	public ArrayList<Shoe_cartDTO> cartList(String id){
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select * from (select * from shoe_cart, shoe_member "
						+ "where shoe_cart.cid = shoe_member.mid) a "
						+ "where cid = ? order by cputdate desc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			ArrayList<Shoe_cartDTO> arr = new ArrayList<Shoe_cartDTO>();
			while(rs.next()) {
				Shoe_cartDTO dto = new Shoe_cartDTO();
				dto.setCidx(rs.getInt("cidx"));
				dto.setCiidx(rs.getInt("ciidx"));
				dto.setCname(rs.getString("cname"));
				dto.setCprice(rs.getInt("cprice"));
				dto.setCimg(rs.getString("cimg"));
				dto.setCsize(rs.getString("csize"));
				dto.setCcnt(rs.getInt("ccnt"));
				dto.setCsum(rs.getInt("csum"));
				dto.setCputdate(rs.getDate("cputdate"));
				dto.setMtier(rs.getString("mtier"));
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
	
	
	/**장바구니 삭제 메소드*/
	public int itemCartDel(int cidx[]) {
		int count = 0;
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "delete from shoe_cart where cidx=?";
			ps = conn.prepareStatement(sql);
			for(int i=0; i<cidx.length; i++) {
				ps.setInt(1, cidx[i]);
				count += ps.executeUpdate();
			}
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
	
	
	
	/**주문페이지(buy.jsp) 파라미터값 조회용 메소드(삭제 예정)*/
	public ArrayList<Shoe_cartDTO> confirmParam(int idx[]) {
		ArrayList<Shoe_cartDTO> arr = new ArrayList<Shoe_cartDTO>();
		try {
			conn = com.shoe.db.ShoeDB.getConn();
			String sql = "select * from shoe_cart where cidx=? order by cputdate desc";
			ps = conn.prepareStatement(sql);
			for(int i=0; i<idx.length; i++) {
				ps.setInt(1, idx[i]);
				rs = ps.executeQuery();
				if(rs.next()) {
				int cidx = rs.getInt("cidx");
				int ciidx = rs.getInt("ciidx");
				String cname = rs.getString("cname");
				int cprice = rs.getInt("cprice");
				String cimg = rs.getString("cimg");
				String csize = rs.getString("csize");
				int ccnt = rs.getInt("ccnt");
				int csum = rs.getInt("csum");
				java.sql.Date cputdate = rs.getDate("cputdate");
				
				Shoe_cartDTO dto = new Shoe_cartDTO();
				dto.setCidx(cidx);
				dto.setCiidx(ciidx);
				dto.setCname(cname);
				dto.setCprice(cprice);
				dto.setCimg(cimg);
				dto.setCsize(csize);
				dto.setCcnt(ccnt);
				dto.setCsum(csum);
				dto.setCputdate(cputdate);
				arr.add(dto);
				}
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
