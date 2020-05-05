<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>

	<jsp:useBean id="bean" class="com.board.model.BoardBean">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO dao = new BoardDAO();
		String password = dao.getPassword(bean.getNum());
		
		// 기존 pass값과 비교
		if(bean.getPassword().equals(password)){
			dao.updateBoard(bean);
			
			response.sendRedirect("BoardList.jsp");
		}else{
		%>
		<script type="text/javascript">
			alert("패스워드가 일치하지 않음");
			history.go(-1);
		</script>
	<%	
		}
	%>
</body>
</html>