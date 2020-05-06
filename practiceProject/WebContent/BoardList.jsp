<%@page import="java.util.List"%>
<%@page import="com.board.model.bean.BoardBean"%>
<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		// 화면에 보여질 게시글 개수 지정
		int pageSize = 10;
		// 현재 카운터를 클릭한 번호값 읽어들임
		String pageNum = request.getParameter("pageNum");
		// 맨 처음이나 수정, 삭제등 다른 게시글에서 이 페이지로 넘어오면 pageNum은 null임
		if (pageNum == null) {
			pageNum = "1";
		}

		int count = 0; // 전체 글의 개수 저장
		int number = 0; // 페이지 넘버링 변수

		// 현재 보고자 하는 페이지 숫자 저장
		int currentPage = Integer.parseInt(pageNum);

		BoardDAO dao = new BoardDAO();

		// 전체 게시글 개수 읽어들임
		count = dao.getAllListCount();

		// 현재 페이지에 보여줄 시작 번호를 설정
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		List<BoardBean> allList = dao.allSelect(startRow, endRow);
		// 테이블에 표시할 번호 지정
		number = count - (currentPage - 1) * pageSize;
	%>
	<center>
		<h2>전체 게시글 보기</h2>
		<table width="600" border="1">
			<tr height="40">
				<td align="right" colspan="5"><input type="button" value="글쓰기"
					onclick="location.href='BoardWriterForm.jsp'"></td>
			</tr>
			<tr height="40">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조회수</td>
			</tr>

			<%
				for (int i = 0; i < allList.size(); i++) {
					BoardBean bean = allList.get(i);
			%>
			<tr height="40">
				<td align="center" width="50"><%=number--%></td>
				<td align="left" width="320"><a
					href="BoardInfo.jsp?num=<%=bean.getNum()%>"
					style="text-decoration: none"> <%
 				if (bean.getReStep() > 1) {
 					for (int j = 0; j < (bean.getReStep() - 1) * 5; j++) {
 						%> &nbsp; <%
 					}
 				}
 			%> <%=bean.getSubject()%></a></td>
				<td align="center" width="100"><%=bean.getWriter()%></td>
				<td align="center" width="150"><%=bean.getRegDate()%></td>
				<td align="center" width="50"><%=bean.getReadCount()%></td>
			</tr>
			<%
				}
			%>

		</table>
		<p>
			<!--  페이지 카운터링 소스 -->
			<%
				if (count > 0) {
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 카운터링 숫자 한계 결정.

					// 시작 페이지
					int startPage = 1;

					if (currentPage % 10 != 0) {
						startPage = (int) (currentPage / 10) * 10 + 1;
					} else {
						startPage = ((int)(currentPage/10)-1)*10+1;
					}
					
					int pageBlock = 10; //카운터링 처리 숫자
					int endPage = startPage+pageBlock-1; // 화면에 보여질 페이지의 마지막 숫자
					
					if(endPage > pageCount) 
						endPage = pageCount;
					
					// 이전이라는 링크를 만들건지 파악
					if(startPage > 10){
					%>
			<a href="BoardList.jsp?pageNum=<%=startPage-10%>">[이전]</a>
			<%
					}
					// 페이징 처리
					for(int i = startPage; i <= endPage; i++){
						%>
					<a href="BoardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<%	
					}
					// 다음이라는 링크를 만들건지 파악
					if(endPage < pageCount){
						%>
						<a href="BoardList.jsp?pageNum=<%=startPage +10%>">[다음]</a>
					<%	
					}
				}
			%>
		
	</center>
</body>
</html>
