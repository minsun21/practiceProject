<%@page import="com.board.model.bean.BoardBean"%>
<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<h2>�Խñ� ����</h2>
		<%
			int num = Integer.parseInt(request.getParameter("num").trim());

			BoardDAO dao = new BoardDAO();
			BoardBean bean = dao.getOneUpdateBoard(num);
		%>
		<form action="BoardUpdateProc.jsp" method="post">
			<table width="600" border="1">
				<tr height="40">
					<td width="120" align="center">�ۼ���</td>
					<td width="180" align="center"><%=bean.getWriter()%></td>
					<td width="120" align="center">�ۼ���</td>
					<td width="180" align="center"><%=bean.getRegDate()%></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">����</td>
					<td width="480" colspan="3">&nbsp; <input type="text"
						name="subject" value="<%=bean.getSubject()%>" size="55"></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">�н�����</td>
					<td width="480" colspan="3">&nbsp; <input type="password"
						name="password" size="55"></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">�� ����</td>
					<td width="480" colspan="3"><textarea rows="10" cols="60"
							name="content"><%=bean.getContent()%></textarea></td>
				</tr>
				<tr height="40">
					<td colspan="4" align="center"><input type="hidden" name="num"
						value="<%=bean.getNum()%>"> <input type="submit"
						value="�� ����">&nbsp;&nbsp; <input type="button"
						onclick="location.href='BoardList.jsp'" value="��ü�ۺ���"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>