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
		alert("�α��� �� ������ �����մϴ�.");
		location.href = 'Main.jsp?center=Login.jsp';
	</script>
	<%
		}
		// ��¥ ��
		Date d1 = new Date();
		Date d2 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		d1 = sdf.parse(rbean.getrDay());
		d2 = sdf.parse(sdf.format(d2));

		int compare = d1.compareTo(d2);
		// ���� �Ϸ��� ��¥ ���� ���� ��¥�� ũ�ٸ� -1
		// ���� �Ϸ��� ��¥�� ���� ��¥�� ���ٸ� 0
		// ���� �Ϸ��� ��¥�� ���� ��¥���� ũ�ٸ� 1
		if (compare < 0) {
	%>
	<script>
		alert("���� ��¥���� ���� ��¥�� ������ �� ����");
		history.go(-1);
	</script>
	<%
		}
		String id1 = (String) session.getAttribute("id");
		rbean.setId(id1);
		RentcarDAO dao = new RentcarDAO();
		dao.setReserveCar(rbean);

		// ���� ���� ������
		CarBean bean = dao.getOneCar(rbean.getNo());

		// ���� �� �ݾ�
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
						���� ���� �Ϸ� </font></td>
			</tr>
			<tr>
				<td align="center"><img alt="" src="Img/<%=bean.getImg()%>">
				</td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">���� �ѿ��� �ݾ�
						<%=totalCarPrice%> ��
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">���� �ѿɼ� �ݾ�
						<%=optionPrice%> ��
				</font></td>
			</tr>
			<tr height="50">
				<td align="center"><font size="5" color="red">���� �� �ݾ�
						<%=totalCarPrice+optionPrice%> ��
				</font></td>
			</tr>
		</table>
	</center>
</body>
</html>
