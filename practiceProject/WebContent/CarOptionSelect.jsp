<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		int no = Integer.parseInt(request.getParameter("no"));
		int qty = Integer.parseInt(request.getParameter("qty"));
		String img = request.getParameter("img");
	%>
	<center>
		<form action="Main.jsp?center=CarReserveResult.jsp" method="post">
			<table width="1000">
				<tr height="100">
					<td align="center" colspan="3"><font size="6" color="gray">
							�� �� �� �� </font></td>
				</tr>
				<tr>
					<td rowspan="7" width="450"><img alt="" src="Img/<%=img%>"></td>
					<td width="250" align="center">�뿩 �Ⱓ</td>
					<td width="250" align="center"><select name="dDay">
							<option value="1">1��</option>
							<option value="2">2��</option>
							<option value="3">3��</option>
							<option value="4">4��</option>
							<option value="5">5��</option>
							<option value="6">6��</option>
							<option value="7">7��</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">�뿩��</td>
					<td width="250" align="center"><input type="date" name="rDay"
						size="15"></td>
				</tr>
				<tr>
					<td width="250" align="center">��������</td>
					<td width="250" align="center"><select name="useIn">
							<option value="1">����(1�� 1����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">wifi����</td>
					<td width="250" align="center"><select name="useWifi">
							<option value="1">����(1�� 1����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">�׺���̼� ����</td>
					<td width="250" align="center"><select name="useNavi">
							<option value="1">����(����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center">���̺��Ʈ ����</td>
					<td width="250" align="center"><select name="useBabySeat">
							<option value="1">����(1�� 1����)</option>
							<option value="2">������</option>
					</select></td>
				</tr>
				<tr>
					<td width="250" align="center"><input type="hidden" name="no"
						value="<%=no %>"> <input type="hidden" name="qty"
						value="<%=qty %>"> <input type="submit" value="���������ϱ�"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>