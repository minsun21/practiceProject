<%@page import="java.util.List"%>
<%@page import="com.board.model.bean.BoardBean"%>
<%@page import="com.board.model.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		// ȭ�鿡 ������ �Խñ� ���� ����
		int pageSize = 10;
		// ���� ī���͸� Ŭ���� ��ȣ�� �о����
		String pageNum = request.getParameter("pageNum");
		// �� ó���̳� ����, ������ �ٸ� �Խñۿ��� �� �������� �Ѿ���� pageNum�� null��
		if (pageNum == null) {
			pageNum = "1";
		}

		int count = 0; // ��ü ���� ���� ����
		int number = 0; // ������ �ѹ��� ����

		// ���� ������ �ϴ� ������ ���� ����
		int currentPage = Integer.parseInt(pageNum);

		BoardDAO dao = new BoardDAO();

		// ��ü �Խñ� ���� �о����
		count = dao.getAllListCount();

		// ���� �������� ������ ���� ��ȣ�� ����
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		List<BoardBean> allList = dao.allSelect(startRow, endRow);
		// ���̺� ǥ���� ��ȣ ����
		number = count - (currentPage - 1) * pageSize;
	%>
	<center>
		<h2>��ü �Խñ� ����</h2>
		<table width="600" border="1">
			<tr height="40">
				<td align="right" colspan="5"><input type="button" value="�۾���"
					onclick="location.href='BoardWriterForm.jsp'"></td>
			</tr>
			<tr height="40">
				<td align="center" width="50">��ȣ</td>
				<td align="center" width="250">����</td>
				<td align="center" width="100">�ۼ���</td>
				<td align="center" width="150">�ۼ���</td>
				<td align="center" width="50">��ȸ��</td>
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
			<!--  ������ ī���͸� �ҽ� -->
			<%
				if (count > 0) {
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // ī���͸� ���� �Ѱ� ����.

					// ���� ������
					int startPage = 1;

					if (currentPage % 10 != 0) {
						startPage = (int) (currentPage / 10) * 10 + 1;
					} else {
						startPage = ((int)(currentPage/10)-1)*10+1;
					}
					
					int pageBlock = 10; //ī���͸� ó�� ����
					int endPage = startPage+pageBlock-1; // ȭ�鿡 ������ �������� ������ ����
					
					if(endPage > pageCount) 
						endPage = pageCount;
					
					// �����̶�� ��ũ�� ������� �ľ�
					if(startPage > 10){
					%>
			<a href="BoardList.jsp?pageNum=<%=startPage-10%>">[����]</a>
			<%
					}
					// ����¡ ó��
					for(int i = startPage; i <= endPage; i++){
						%>
					<a href="BoardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<%	
					}
					// �����̶�� ��ũ�� ������� �ľ�
					if(endPage < pageCount){
						%>
						<a href="BoardList.jsp?pageNum=<%=startPage +10%>">[����]</a>
					<%	
					}
				}
			%>
		
	</center>
</body>
</html>
