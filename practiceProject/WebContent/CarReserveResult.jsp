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
				alert("�α��� �� ������ �����մϴ�.");
				location.href='Main.jsp?center=Login.jsp';
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
		if(compare < 0){
			%>
			<script>
				alert("���� ��¥���� ���� ��¥�� ������ �� ����");
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
