<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="data" class="model.vo.BoardVO" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectOne</title>
</head>
<body>


<table border=2px;>
<tr>
<td>no</td>
<td><%=data.getBid()%>번</td>
</tr>
<tr>
<td>작성자</td>
<td><%=data.getWriter()%></td>
</tr>
<tr>
<td>제목</td>
<td><%=data.getTitle()%></td>
</tr>
<tr>
<td>내용</td>
<td><%=data.getContent()%></td>
</tr>
</table>

</body>
</html>