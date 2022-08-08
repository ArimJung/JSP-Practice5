<%@page import="model.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과 페이지</title>
</head>
<body>


<table border="2">
	<tr>
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardVO v: (ArrayList<BoardVO>)datas){
%>
	<tr>
		<th><%=v.getBid() %></th>
		<td><%=v.getTitle() %></td>
		<td><%=v.getWriter() %></td>
	</tr>
<%
	}
 %>
</table>


<hr>
<a href="controller.jsp?action=main">메인으로 돌아가기</a>


</body>
</html>