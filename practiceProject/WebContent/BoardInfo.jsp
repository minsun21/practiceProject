<%@page import="com.board.model.BoardBean"%>
<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num").trim());

		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.getOneBoard(num);
	%>
	<center>
		<h2>�Խñ� ����</h2>
		<table width="600" border="1">
			<tr height="40">
				<td align="center" width="120">�۹�ȣ</td>
				<td align="center" width="120"><%=bean.getNum()%></td>
				<td align="center" width="120">��ȸ��</td>
				<td align="center" width="120"><%=bean.getReadCount()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">�ۼ���</td>
				<td align="center" width="120"><%=bean.getWriter()%></td>
				<td align="center" width="120">�ۼ���</td>
				<td align="center" width="120"><%=bean.getReg_date()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">�̸���</td>
				<td align="center" colspan="3"><%=bean.getEmail()%></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">����</td>
				<td align="center" colspan="3"><%=bean.getSubject()%></td>
			</tr>
			<tr height="80">
				<td align="center" width="120">�� ����</td>
				<td align="center" colspan="3"><%=bean.getContent()%></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4"><input type="button"
					value="��� ����"
					onclick="location.href='BoardReWriterForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getReStep()%>&re_level=<%=bean.getReLevel()%>'">
					<input type="button" value="���� �ϱ�"
					onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
						<input type="button" value="���� �ϱ�"
					onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" value="��� ����"
					onclick="location.href='BoardList.jsp'">
				</td>
			</tr>
		</table>
	</center>

</body>
</html>