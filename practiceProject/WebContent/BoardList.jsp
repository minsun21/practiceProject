<%@page import="java.util.List"%>
<%@page import="com.board.model.BoardBean"%>
<%@page import="com.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>전체 게시글 보기</title>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		List<BoardBean> allList = dao.allSelect();

	%>
	<center>
		<h2>전체 게시글 보기</h2>
		<table width="600" border="1" >
			<tr height="40">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조회수</td>
			</tr>
			
				<%
				for(int i = 0; i< allList.size(); i++){
					BoardBean bean = allList.get(i);
				%>
				<tr height="40">
				<td align="center" width="50"><%=i+1 %></td>
				<td align="left" width="320"><a href="BoardInfo.jsp?num=<%=bean.getNum()%>" style="text-decoration:none">
				<% 
					if(bean.getReStep() > 1){
						for(int j = 0; j< (bean.getReStep()-1)*5; j++){
				%> &nbsp;
				<%		}
					}
				 %>
				<%=bean.getSubject() %></a></td>
				<td align="center" width="100"><%=bean.getWriter() %></td>
				<td align="center" width="150"><%=bean.getReg_date() %></td>
				<td align="center" width="50"><%=bean.getReadCount()%></td>
				</tr>
				<%
				}
				%>
			<tr height="40">
			<td align="center" colspan="5">
				<input type="button" value="글쓰기" onclick="location.href='BoardWriterForm.jsp'"></td>
			</tr>
		</table>
	</center>
</body>
</html>