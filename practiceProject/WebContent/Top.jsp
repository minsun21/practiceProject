<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		// 세션 이용한 로그인 처리
		String id =(String) session.getAttribute("id");
		if(id == null){
			id="GUEST";
		}

	%>
	<table width="1000">
		<tr height="80">
			<td colspan="4"><img alt="" src="Img/RENT_LOGO.png" height="65">
			</td>
			<td align="center" width="200"><%=id %>님 반갑습니다.</td>
		</tr>
		<tr height="50">
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">예 약 하 기</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">예 약 확 인</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">자유게시판</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">이 벤 트</a></font>
			</td>
			<td align="center" width="200" bgcolor="red">
				<font color="white" size="4"><a href="#" style="text-decoration:none">고 객 센 터</a></font>
			</td>
		</tr>
	</table>
</body>
</html>