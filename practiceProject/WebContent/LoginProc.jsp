<%@page import="com.board.model.dao.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		RentcarDAO dao = new RentcarDAO();
		int memberCount = dao.getMember(id, password);
		
		if(memberCount==0){
			%>
			<script>
				alert("회원 아이디 혹은 패스워드가 틀립니다.");
				location.href='Main.jsp?center=Login.jsp';
			</script>
			<%
		}else{
			session.setAttribute("id", id);
			response.sendRedirect("Main.jsp");
		}
	%>

</body>
</html>