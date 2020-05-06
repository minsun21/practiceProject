package com.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.jdbc.pool.DataSource;

import com.board.model.bean.BoardBean;

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

	public List<BoardBean> allSelect(int startRow, int endRow) {
		List<BoardBean> list = new ArrayList<BoardBean>();
		getConnection();
		try {
			String sql = "SELECT * FROM (SELECT Row_Number() OVER (ORDER BY REF DESC, RE_STEP ASC) AS rownum, *FROM BOARD) T1 WHERE rownum BETWEEN ? AND ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(2));
				bean.setWriter(rs.getString(3));
				bean.setEmail(rs.getString(4));
				bean.setSubject(rs.getString(5));
				bean.setPassword(rs.getString(6));
				bean.setRegDate(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setReStep(rs.getInt(9));
				bean.setReLevel(rs.getInt(10));
				bean.setReadCount(rs.getInt(11));
				bean.setContent(rs.getString(12));
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
				bean.setRegDate(rs.getDate(6).toString());
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
			// 부모 글 RE_STEP에 1을 더해 줌
			pstmt.setInt(6, reStep + 1);
			pstmt.setInt(7, reLevel + 1);
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

	// BoardUpdate, BoardDelete
	public BoardBean getOneUpdateBoard(int num) {
		BoardBean bean = new BoardBean();
		getConnection();
		try {
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
				bean.setRegDate(rs.getDate(6).toString());
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

	public String getPassword(int num) {
		getConnection();
		String password = "";
		try {
			String sql = "SELECT PASSWORD FROM BOARD WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				password = rs.getString(1);
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
		return password;
	}

	public void updateBoard(BoardBean bean) {
		getConnection();
		try {
			String sql = "UPDATE BOARD SET SUBJECT =?,CONTENT=? WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
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

	public void deleteBoard(int num) {
		getConnection();
		try {
			String sql = "DELETE FROM BOARD WHERE NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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

	public int getAllListCount() {
		getConnection();
		int count = 0;
		try {
			String sql = "SELECT COUNT(*) FROM BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
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
		return count;
	}
}
