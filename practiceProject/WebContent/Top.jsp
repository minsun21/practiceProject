<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		// ���� �̿��� �α��� ó��
		String id =(String) session.getAttribute("id");
		if(id == null){
			id="GUEST";
		}

	%>
	<table width="1000">
		<tr height="80">
			<td colspan="4">
				<a href="Main.jsp">
					<img alt="" src="Img/RENT_LOGO.png" height="65">
				</a>
			</td>
			<td align="center" width="200"><%=id %>�� �ݰ����ϴ�.</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="Main.jsp?center=CarReserveMain.jsp" style="text-decoration:none">�� �� �� ��</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="Main.jsp?center=CarAllList.jsp" style="text-decoration:none">�� �� Ȯ ��</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">�����Խ���</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">�� �� Ʈ</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">�� �� �� ��</a></font>
			</td>
		</tr>
	</table>
</body>
</html>