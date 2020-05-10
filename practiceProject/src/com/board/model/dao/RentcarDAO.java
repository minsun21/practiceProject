package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

import com.board.model.bean.CarBean;
import com.board.model.bean.ReserveBean;
import com.board.model.bean.ReserveCarViewBean;

public class RentcarDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getConnection() {
		try {
			// Server.xml의 name읽어들일때 에러날 수 있음
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			// usernsme, url, password를 datasource에 저장. 그 datasource가 connection을 얻어옴.
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<CarBean> getSelectCarInfo() {
		ArrayList<CarBean> carList = new ArrayList<CarBean>();
		getConnection();
		try {
			String sql = "SELECT * FROM RENTCAR_INFO ORDER BY No DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				CarBean carBean = new CarBean();
				carBean.setNo(rs.getInt(1));
				carBean.setName(rs.getString(2));
				carBean.setCategory(rs.getInt(3));
				carBean.setPrice(rs.getInt(4));
				carBean.setUsePeople(rs.getInt(5));
				carBean.setCompany(rs.getString(6));
				carBean.setImg(rs.getString(7));
				carBean.setInfo(rs.getString(8));
				count++;
				carList.add(carBean);
				if (count > 2)
					break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return carList;
	}

	// 소형,중형, 대형 분류에 따라 리스트 리턴
	public ArrayList<CarBean> getCategoryCarList(int category) {
		ArrayList<CarBean> carList = new ArrayList<CarBean>();
		getConnection();
		try {
			String sql = "SELECT * FROM RENTCAR_INFO WHERE CATEGORY=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarBean carBean = new CarBean();
				carBean.setNo(rs.getInt(1));
				carBean.setName(rs.getString(2));
				carBean.setCategory(rs.getInt(3));
				carBean.setPrice(rs.getInt(4));
				carBean.setUsePeople(rs.getInt(5));
				carBean.setCompany(rs.getString(6));
				carBean.setImg(rs.getString(7));
				carBean.setInfo(rs.getString(8));
				carList.add(carBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return carList;
	}

	// 전체 차량 리스트 리턴
	public ArrayList<CarBean> getAllCarList() throws SQLException {
		getConnection();
		ArrayList<CarBean> allCarList = new ArrayList<CarBean>();
		String sql = "SELECT * FROM RENTCAR_INFO";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				CarBean carBean = new CarBean();
				carBean.setNo(rs.getInt(1));
				carBean.setName(rs.getString(2));
				carBean.setCategory(rs.getInt(3));
				carBean.setPrice(rs.getInt(4));
				carBean.setUsePeople(rs.getInt(5));
				carBean.setCompany(rs.getString(6));
				carBean.setImg(rs.getString(7));
				carBean.setInfo(rs.getString(8));
				allCarList.add(carBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return allCarList;
	}

	public CarBean getOneCar(int no) throws SQLException {
		getConnection();
		CarBean carBean = new CarBean();
		try {
			String sql = "SELECT * FROM RENTCAR_INFO WHERE No = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				carBean.setNo(rs.getInt(1));
				carBean.setName(rs.getString(2));
				carBean.setCategory(rs.getInt(3));
				carBean.setPrice(rs.getInt(4));
				carBean.setUsePeople(rs.getInt(5));
				carBean.setCompany(rs.getString(6));
				carBean.setImg(rs.getString(7));
				carBean.setInfo(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return carBean;
	}

	public int getMember(String id, String pass) throws SQLException {
		int result = 0;
		getConnection();
		try {
			String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=? AND PASS1=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return result;
	}

	public void setReserveCar(ReserveBean bean) throws SQLException {
		getConnection();
		try {
			String sql = "INSERT INTO CAR_RESERVE_INFO VALUES(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bean.getNo());
			pstmt.setInt(2, bean.getQty());
			pstmt.setInt(3, bean.getdDay());
			pstmt.setString(4, bean.getrDay());
			pstmt.setInt(5, bean.getUseIn());
			pstmt.setInt(6, bean.getUseWifi());
			pstmt.setInt(7, bean.getUseNavi());
			pstmt.setInt(8, bean.getUseBabySeat());
			pstmt.setString(9, bean.getId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}

	// 예약 정보 확인
	public List<ReserveCarViewBean> getAllReserve(String id) throws SQLException {
		getConnection();
		List<ReserveCarViewBean> beanList = new ArrayList<ReserveCarViewBean>();
		try {
			String sql = "";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReserveCarViewBean bean = new ReserveCarViewBean();
				bean.setName(rs.getString(2));
				bean.setPrice(rs.getInt(4));
				bean.setImg(rs.getString(7));
				bean.setQty(rs.getInt(11));
				bean.setdDay(rs.getInt(12));
				bean.setrDay(rs.getString(13));
				bean.setUseIn(rs.getInt(14));
				bean.setUseWifi(rs.getInt(15));
				bean.setUseNavi(rs.getInt(16));
				bean.setUseBabySeat(rs.getInt(17));
				beanList.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return beanList;
	}

	public void carRemoveReserve(String id, String rday) throws SQLException {
		getConnection();
		try {
			String sql = "DELETE FROM CAR_RESERVE_INFO WHERE ID=? RDAY=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, rday);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}
}
