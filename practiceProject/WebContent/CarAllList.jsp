<%@page import="com.board.model.bean.CarBean"%>
<%@page import="java.util.List"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<table>
			<tr height="100">
				<td align="center" colspan="3">
					<font size="5" color="gray"> ��ü �ڵ��� Ȯ�� </font>
				</td>
			</tr>
		
			<%
				//ī�װ� �з����� �޾ƿ�
				RentcarDAO dao = new RentcarDAO();
				List<CarBean> categoryCarList = dao.getAllCarList();
				int j = 0;
				for (int i = 0; i < categoryCarList.size(); i++) {
					CarBean bean = categoryCarList.get(i);
					if (j % 3 == 0) {
			%>
			<tr height="220">
				<%
					}
				%>
				<td width="333" align="center"><a
					href="Main.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
						<img alt="" src="Img/<%=bean.getImg()%>" width="300" height="200">
				</a>
					<p>
						<font size="3" color="gray"><b>������ : <%=bean.getName()%></b></font></td>
				<%
					j++;
					}
				%>
			
		</table>
	</center>
</body>
</html>