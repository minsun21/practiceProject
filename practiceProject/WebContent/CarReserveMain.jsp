<%@page import="com.board.model.bean.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<!--  �ֽ� �ڵ��� 3�븸 �ѷ��� -->
		<%
			RentcarDAO dao = new RentcarDAO();
			ArrayList<CarBean> carList = dao.getSelectCarInfo();
		%>
		<table width="1000">
			<tr height="240">
				<%
					for (int i = 0; i < carList.size(); i++) {
						CarBean bean = carList.get(i);
				%>
				<td width="333" align="center"><a
					href="CarReserveInfo.jsp?no=<%=bean.getNo()%>"> <img alt=""
						src="Img/<%=bean.getImg()%>" width="270" height="220">
				</a>
					<p>
						������ :
						<%=bean.getName()%></td>
				<%
					}
				%>
			</tr>
		</table>
		<hr color="red" size="3">
		<p>
			<font size="4" color="gray">���� �˻� �ϱ�</font><br> <br> <br>
		<form action="CarCategoryList.jsp" method="post">
			<font size="3" color="gray"><b>���� �˻� �ϱ�</b></font>&nbsp;&nbsp; <select
				name="category">
				<option value="1">����</option>
				<option value="1">����</option>
				<option value="1">����</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="�˻�">&nbsp;&nbsp;
			<button onclick="location.href='CarAllList.jsp'">��ü �˻�</button>
		</form>
	</center>
</body>
</html>