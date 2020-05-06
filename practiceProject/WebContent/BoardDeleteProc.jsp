<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<%
	request.setCharacterEncoding("euc-kr");
	String pass = request.getParameter("password");
	int num = Integer.parseInt(request.getParameter("num").trim());
	BoardDAO dao = new BoardDAO();
	String password = dao.getPassword(num);
	
	if(pass.equals(password)){
		dao.deleteBoard(num);
	}else{
	%>
		<script type="text/javascript">
			alert("패스워드가 일치하지 않음");
			history.go(-1);
		</script>
	<%
	}
	
	response.sendRedirect("BoardList.jsp");
%>

</body>
</html>