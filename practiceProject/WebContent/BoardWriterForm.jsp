<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<h2>�Խñ� ����</h2>
		<form action="BoardWriterProc.jsp" method="post">
			<table width="600">
				<tr height="40">
					<td align="center" width="150">�ۼ���</td>
					<td width="450"><input type="text" name="writer" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">����</td>
					<td width="450"><input type="text" name="subject" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">�̸���</td>
					<td width="450"><input type="email" name="email" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">��й�ȣ</td>
					<td width="450"><input type="password" name="password" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">�۳���</td>
					<td width="450"><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>
					<tr height="40">
					<td align="center" colspan="2">
						<input type="submit" value="����">&nbsp;&nbsp;
						<input type="reset" value="�ٽ��ۼ�">&nbsp;&nbsp;
						<button onclick="location.href='BoardList.jsp'">��ü �Խñ� ����</button>
					</td>
				</tr>
			</table>
		</form>
		<%
			BoardDAO dao = new BoardDAO();
		%>
	</center>
</body>
</html>