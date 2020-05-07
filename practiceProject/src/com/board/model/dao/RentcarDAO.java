package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

import com.board.model.bean.CarBean;

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

}
