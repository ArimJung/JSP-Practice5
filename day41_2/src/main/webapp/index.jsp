<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 표지페이지 -->
<!-- main.jsp에서 datas를 출력하려면 controller를 방문해야하기 때문에 표지페이지가 존재함 -->
<jsp:forward page="controller.jsp?action=main"/>

<%
	//pageContext.forward("controller.jsp?action=main");
%>