<%@page import="com.board.model.BoardBean"%>
<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		int num = Integer.parseInt(request.getParameter("num").trim());
		BoardBean bean = dao.getOneUpdateBoard(num);
	%>
	<center>
		<h2>게시글 삭제</h2>
		<form action="BoardDeleteProc.jsp" method="post">
			<table width="600" border="1">
				<tr height="40">
					<td width="120" align="center">작성자</td>
					<td width="180" align="center"><%=bean.getWriter()%></td>
					<td width="120" align="center">작성일</td>
					<td width="180" align="center"><%=bean.getRegDate()%></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">제목</td>
					<td align="left" colspan="3"><%=bean.getSubject()%></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">패스워드</td>
					<td align="left" colspan="3"><input type="password"
						name="password" size="55"></td>
				</tr>
				<tr height="40">
					<td align="center" colspan="4">
					<input type="hidden" name="num" value="<%=num %>">
					<input type="submit"
						value="글삭제">&nbsp;&nbsp; <input type="button"
						onclick="location.href='BoardList.jsp'" value="목록보기"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>