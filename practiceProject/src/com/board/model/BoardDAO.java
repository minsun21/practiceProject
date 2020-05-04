package com.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

public class BoardDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public void getConnection() {
		try {
			Context initctx = new InitialContext();
			// 톰캣 서버에 정보를 담아놓은 곳으로 이동
			Context envctx = (Context) initctx.lookup("java:comp/env");

			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertBoard(BoardBean bean) {
		getConnection();
		try {
			int ref = 0; // 글 그룹.
			int reStep = 1; // 새 글.
			int reLevel = 1;

			String sql = "SELECT max(ref) FROM BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ref = rs.getInt(1) + 1; // 최대값이 +1 더해서 글 그룹 설정
			}

			String insertSql = "INSERT INTO BOARD VALUES(?,?,?,?,GETDATE(),?,?,?,0,?)";
			pstmt = con.prepareStatement(insertSql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, reStep);
			pstmt.setInt(7, reLevel);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<BoardBean> allSelect() {
		List<BoardBean> list = new ArrayList<BoardBean>();
		getConnection();
		try {
			String sql = "SELECT * FROM BOARD ORDER BY REF DESC, RE_STEP ASC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setReStep(rs.getInt(8));
				bean.setReLevel(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public BoardBean getOneBoard(int num) {
		BoardBean bean = new BoardBean();
		getConnection();
		try {
			// 조회수 1 늘려야함
			String countUpSql = "UPDATE BOARD SET read_count = read_count+1 where num=?";
			pstmt = con.prepareStatement(countUpSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			String sql = "SELECT * FROM BOARD WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setReStep(rs.getInt(8));
				bean.setReLevel(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bean;
	}

	public void reWriteBoard(BoardBean bean) {
		getConnection();
		try {
			// 부모글그룹과 글레벨, 글 스텝
			int ref = bean.getRef();
			int reStep = bean.getReStep();
			int reLevel = bean.getReLevel();
			String levelSql = "UPDATE BOARD SET RE_LEVEL= RE_LEVEL+1 WHERE REF=? AND RE_LEVEL>?";
			pstmt = con.prepareStatement(levelSql);
			pstmt.setInt(1, bean.getRef());
			pstmt.setInt(2, reLevel);
			pstmt.executeUpdate();

		
			// 답변글 데이터 저장
			String insertSql = "INSERT INTO BOARD VALUES(?,?,?,?,GETDATE(),?,?,?,0,?)";
			pstmt = con.prepareStatement(insertSql);
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			//부모 글 RE_STEP에 1을 더해 줌
			pstmt.setInt(6, reStep+1);
			pstmt.setInt(7, reLevel+1);
			pstmt.setString(8, bean.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
