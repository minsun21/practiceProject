<%@page import="com.board.model.bean.CarBean"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		RentcarDAO dao = new RentcarDAO();
		CarBean bean = dao.getOneCar(no);
		int category = bean.getCategory();
		String temp = "";
		if (category == 1)
			temp = "����";
		else if (category == 2)
			temp = "����";
		else if (category == 3)
			temp = "����";
	%>
	<center>
		<form action="Main.jsp?center=CarOptionSelect.jsp" method="post">
			<table width="1000">
				<tr height="100">
					<td align="center" colspan="3"><font size="5" color="gray">
							<%=bean.getName()%> ���� ����
					</font></td>
				</tr>
				<tr>
					<td rowspan="6" width="500"><img alt=""
						src="Img/<%=bean.getImg()%>" width="450"></td>
					<td width="250" align="center">���� �̸�</td>
					<td width="250" align="center"><%=bean.getName()%></td>
				</tr>
				<tr>
					<td width="250" align="center">���� ����</td>
					<td width="250" align="center"><select name="qty">
							<option value="1">1</option>
							<option value="1">2</option>
							<option value="1">3</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">���� �з�</td>
					<td width="250" align="center"><%=temp%></td>
				</tr>
				<tr>
					<td width="250" align="center">�뿩 ����</td>
					<td width="250" align="center"><%=bean.getPrice()%></td>
				</tr>
				<tr>
					<td width="250" align="center">���� ȸ��</td>
					<td width="250" align="center"><%=bean.getCompany()%></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="hidden" name="no"
						value="<%=bean.getNo()%>"> 
						<input type="hidden" name="img"
						value="<%=bean.getImg()%>"> <input type="submit"
						value="�ɼ� ���� �� ����"></td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<font size="5" color="gray">���� ���� ����</font>
			<p>
			<%=bean.getInfo() %>
		</form>
	</center>
</body>
</html>