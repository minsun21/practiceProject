<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<jsp:useBean id="rbean" class="com.board.model.bean.ReserveBean">
		<jsp:setProperty name="rbean" property="*" />
	</jsp:useBean>
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			%>
			<script>
				alert("로그인 후 예약이 가능합니다.");
				location.href='Main.jsp?center=Login.jsp';
			</script>
			<%
		}
		// 날짜 비교
		Date d1 = new Date();
		Date d2 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		d1 = sdf.parse(rbean.getrDay());
		d2 = sdf.parse(sdf.format(d2));
		
		int compare = d1.compareTo(d2);
		// 예약 하려는 날짜 보다 현재 날짜가 크다면 -1
		// 예약 하려는 날짜와 현재 날짜가 같다면 0
		// 예약 하려는 날짜가 현재 날짜보다 크다면 1
		if(compare < 0){
			%>
			<script>
				alert("현재 날짜보다 이전 날짜는 선택할 수 없음");
				history.go(-1);
			</script>
			<%
		}
		
	%>
	<center>
	<table>
		
	</table>
	</center>
</body>
</html>
