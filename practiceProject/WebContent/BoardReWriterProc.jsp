<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<!-- �����͸� �ѹ��� �޾ƿ��� ��Ŭ������ ����� -->
	<jsp:useBean id="bean" class="com.board.model.BoardBean">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO dao = new BoardDAO();
		dao.reWriteBoard(bean);
		
		// �亯 ������ ��� ���� �� ��ü �Խñ� ���� ����
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>