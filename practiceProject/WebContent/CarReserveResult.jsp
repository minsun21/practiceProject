<%@page import="com.board.model.bean.CarBean"%>
<%@page import="com.board.model.dao.RentcarDAO"%>
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
		String id = (String) session.getAttribute("id");
		if (id == null) {
	%>
	<script>
		alert("로그인 후 예약이 가능합니다.");
		location.href = 'Main.jsp?center=Login.jsp';
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
		if (compare < 0) {
	%>
	<script>
		alert("현재 날짜보다 이전 날짜는 선택할 수 없음");
		history.go(-1);
	</script>
	<%
		}
		String id1 = (String) session.getAttribute("id");
		rbean.setId(id1);
		RentcarDAO dao = new RentcarDAO();
		dao.setReserveCar(rbean);

		// 차량 정보 얻어오기
		CarBean bean = dao.getOneCar(rbean.getNo());

		// 차량 총 금액
		int totalCarPrice = bean.getPrice() * rbean.getQty() * rbean.getdDay();

		int useIn = 0;
		if (rbean.getUseIn() == 1)
			useIn = 1000;
		int useWifi = 0;
		if (rbean.getUseWifi() == 1)
			useWifi = 1000;
		int useNavi = 0;
		if (rbean.getUseNavi() == 1)
			useNavi = 1000;
		int useSeat = 0;
		if (rbean.getUseBabySeat() == 1)
			useSeat = 10000;

		int optionPrice = rbean.getQty() * rbean.getdDay() * (useIn + useWifi + useSeat);
	%>
	<center>
		<table width="1000">
			<tr height="100">
				<td align="center" colspan="2"><font size="6" color="gray">
						차량 예약 완료 </font></td>
			</tr>
			<tr>
				<td align="center"><img alt="" src="Img/<%=bean.getImg()%>">
				</td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">차량 총예약 금액
						<%=totalCarPrice%> 원
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">차량 총옵션 금액
						<%=optionPrice%> 원
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">차량 총 금액
						<%=totalCarPrice+optionPrice%> 원
				</font></td>
			</tr>
		</table>
	</center>
</body>
</html>
