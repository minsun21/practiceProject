<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<center>
		<form action="LoginProc.jsp" method="post">
			<table width="300">
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							로그인 </font></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">아이디</td>
					<td width="180"><input type="text" name="id" size="15"></td>
				</tr>
				<tr height="40">
					<td width="120" align="center">패스워드</td>
					<td width="180"><input type="password" name="password" size="15"></td>
				</tr>
				<tr height="40">
					<td colspan="2" align="center"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>