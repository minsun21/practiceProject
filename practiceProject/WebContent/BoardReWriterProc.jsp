<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<!-- �����͸� �ѹ��� �޾ƿ��� ��Ŭ������ ����� -->
	<jsp:useBean id="bean" class="com.board.model.bean.BoardBean">
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