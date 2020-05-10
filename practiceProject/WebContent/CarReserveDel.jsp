<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		String id = request.getParameter("id");
		String rday = request.getParameter("rday");
		RentcarDAO dao = new RentcarDAO();
		dao.carRemoveReserve(id,rday);
		response.sendRedirect("Main.jsp");
		
		
	%>
</body>
</html>