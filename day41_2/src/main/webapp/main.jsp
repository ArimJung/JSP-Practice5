<%@page import="java.util.ArrayList"%>
<%@page import="model.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request"/>
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
	function check(){
		ans = prompt("비밀번호를 입력하세요");
		if(ans==<%= member.getMpw()%>){
			location.href="controller.jsp?action=mypage";
		}
	}
</script>


<h1><a href="javascript:check()"><%=member.getMname()%></a>님, 반갑습니다! :D</h1>
<br>
<hr>
<a href="form.jsp">새로운 글 작성하기</a>
<br>
<br>
<!-- 검색 -->
<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="search">
	<table border="1">
		<tr>
		<td>제목으로 검색</td>
		<td><input type="text" name="title" ></td>
		</tr>
	
		<tr>
		<td colspan="2" align="right" ><input type="submit" value="검색하기">
		<a href="controller.jsp?action=main"><input type="button" value="검색초기화"></a>
		</td>
		</tr>
	</table>

</form>
<br>
<br>
<!-- 글 목록 -->
<table border="2">
	<tr>
		<th>번 호</th><th>제 목</th><th>작성자</th>
	</tr>
<%
	for(BoardVO v: (ArrayList<BoardVO>)datas){
%>
	<tr>
		<th><a href="controller.jsp?action=selectOne&bid=<%=v.getBid()%>"><%=v.getBid() %></a></th>
		<td><%=v.getTitle() %></td>
		<td><%=v.getWriter() %></td>
	</tr>
<%
	}
 %>
</table>

<hr>




</body>
</html>