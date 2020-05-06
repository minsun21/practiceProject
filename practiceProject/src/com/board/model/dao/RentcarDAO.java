package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.apache.tomcat.jdbc.pool.DataSource;

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
