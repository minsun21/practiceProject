<%@page import="com.board.model.bean.ReserveCarViewBean"%>
<%@page import="com.board.model.bean.ReserveBean"%>
<%@page import="java.util.List"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
	String id = (String) session.getAttribute("id");

	if(id==null){
	%>
	<script>
			alert("로그인을 먼저 해주세요");
			location.href='Main.jsp?center=Login.jsp';
		</script>
	<%	
		}
	
		// 로그인 되어 있는 아이디를 읽어 옴
		RentcarDAO dao = new RentcarDAO();
		List<ReserveCarViewBean> beanList = dao.getAllReserve(id);
	%>
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center"><font size="6" color="gray">차량예약화면</font></td>
			</tr>
			<tr height="40">
				<td width="150" align="center">이미지</td>
				<td width="100" align="center">이름</td>
				<td width="150" align="center">대여일</td>
				<td width="60" align="center">대여기간</td>
				<td width="100" align="center">금액</td>
				<td width="60" align="center">수량</td>
				<td width="60" align="center">보험</td>
				<td width="60" align="center">wifi</td>
				<td width="60" align="center">베이비시트</td>
				<td width="60" align="center">네비게이션</td>
				<td width="80" align="center">삭제</td>
			</tr>
			<%
				for(int i = 0 ; i<beanList.size();i++){
					ReserveCarViewBean bean = beanList.get(i);
			%>
			<tr height="70">
				<td width="150" align="center"><img alt="" src="Img/<%=bean.getImg() %>" widabbr="120" heabbr="70"></td>
				<td width="100" align="center"><%=bean.getName() %></td>
				<td width="150" align="center"><%=bean.getdDay() %></td>
				<td width="60" align="center"><%=bean.getrDay() %></td>
				<td width="100" align="center"><%=bean.getPrice() %>원</td>
				<td width="60" align="center"><%=bean.getQty() %></td>
				<td width="60" align="center"><%=bean.getUseIn() %></td>
				<td width="60" align="center"><%=bean.getUseWifi() %></td>
				<td width="60" align="center"><%=bean.getUseBabySeat() %></td>
				<td width="60" align="center"><%=bean.getUseNavi() %></td>
				<td width="80" align="center">
				<button onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%=bean.getrDay()%>'">삭제</button>
				</td>
			</tr>
			<%
			
				}
			%>
		</table>
	</center>
</body>
</html>