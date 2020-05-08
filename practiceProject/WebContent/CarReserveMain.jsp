<%@page import="com.board.model.bean.CarBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<!--  최신 자동차 3대만 뿌려줌 -->
		<%
			RentcarDAO dao = new RentcarDAO();
			ArrayList<CarBean> carList = dao.getSelectCarInfo();
		%>
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="3">
					<font size="5" color="gray"> 최신형 자동차 </font>
				</td>
			</tr>
		
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
						차량명 :
						<%=bean.getName()%></td>
				<%
					}
				%>
			</tr>
		</table>
		<hr color="red" size="3">
		<p>
			<font size="4" color="gray">차량 검색 하기</font><br> <br> <br>
		<form action="Main.jsp?center=CarCategoryList.jsp" method="post">
			<font size="3" color="gray"><b>차량 검색 하기</b></font>&nbsp;&nbsp; <select
				name="category">
				<option value="1">소형</option>
				<option value="2">중형</option>
				<option value="3">대형</option>
			</select>&nbsp;&nbsp;
			<input type="submit" value="검색">&nbsp;&nbsp;
		</form>
		<button onclick="location.href='Main.jsp?center=CarAllList.jsp'">전체 검색</button>
	</center>
</body>
</html>