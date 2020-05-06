<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<%
		String center = request.getParameter("center");
		// 처음 실행하면 center값 null임
		if (center == null) {
			center = "Center.jsp";
		}
	%>
	<table width="1000">
		<!-- TOP -->
		<tr height="130" align="center">
			<td align="center" width="1000"><jsp:include page="Top.jsp" /></td>
		</tr>
		<!-- CENTER -->
		<tr align="center">
			<td align="center" width="1000"><jsp:include page="<%=center%>" /></td>
		</tr>
		<!-- BOTTOM -->
		<tr height="100" align="center">
			<td align="center" width="1000"><jsp:include page="Bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>