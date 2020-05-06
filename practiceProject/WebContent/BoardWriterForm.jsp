<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<h2>게시글 쓰기</h2>
		<form action="BoardWriterProc.jsp" method="post">
			<table width="600">
				<tr height="40">
					<td align="center" width="150">작성자</td>
					<td width="450"><input type="text" name="writer" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">제목</td>
					<td width="450"><input type="text" name="subject" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">이메일</td>
					<td width="450"><input type="email" name="email" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">비밀번호</td>
					<td width="450"><input type="password" name="password" size="50"></td>
				</tr>
					<tr height="40">
					<td align="center" width="150">글내용</td>
					<td width="450"><textarea rows="10" cols="50" name="content"></textarea></td>
				</tr>
					<tr height="40">
					<td align="center" colspan="2">
						<input type="submit" value="전송">&nbsp;&nbsp;
						<input type="reset" value="다시작성">&nbsp;&nbsp;
						<button onclick="location.href='BoardList.jsp'">전체 게시글 보기</button>
					</td>
				</tr>
			</table>
		</form>
		<%
			BoardDAO dao = new BoardDAO();
		%>
	</center>
</body>
</html>