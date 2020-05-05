<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<!-- 데이터를 한번에 받아오는 빈클래스를 사용함 -->
	<jsp:useBean id="bean" class="com.board.model.BoardBean">
		<jsp:setProperty name="bean" property="*" />
	</jsp:useBean>

	<%
		BoardDAO dao = new BoardDAO();
		dao.reWriteBoard(bean);
		
		// 답변 데이터 모두 저장 후 전체 게시글 보기 설정
		response.sendRedirect("BoardList.jsp");
	%>
</body>
</html>