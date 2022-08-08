<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp" import="java.util.ArrayList,model.vo.BoardVO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:setProperty property="*" name="bVO" />

<jsp:useBean id="mDAO" class="model.dao.MemberDAO" />
<jsp:useBean id="mVO" class="model.vo.MemberVO" />
<jsp:setProperty property="*" name="mVO" />
<%
	// 어떤 요청을 받았는지 파악
	// -> 해당 요청을 수행
	
	String action = request.getParameter("action");
	
	if(action.equals("main")){
		ArrayList<BoardVO> datas=bDAO.selectAll(bVO);
		request.setAttribute("datas", datas); // 유지할 정보 
		pageContext.forward("main.jsp"); // forward 액션 (자바로 표현)
	}
	else if(action.equals("login")){
		if(mDAO.selectOne(mVO)==null){
			out.println("<script>alert('비밀번호가 일치하지 않습니다..');location.href='login.jsp'</script>");
		}
		else{
			out.println("<script>alert('로그인 성공!');location.href='controller.jsp?action=main'</script>");
		}
	}
	else if(action.equals("insert")){
		if(bDAO.insert(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("insert 오류");
		}
	}
	else if(action.equals("search")){
		ArrayList<BoardVO> datas = bDAO.search(bVO);
		request.setAttribute("datas", datas); // 유지할 정보 
		pageContext.forward("searchResult.jsp"); // forward 액션 (자바로 표현)
	}	
	else if(action.equals("selectOne")){
		BoardVO data = bDAO.selectOne(bVO);
		request.setAttribute("data", data);
		pageContext.forward("board.jsp"); 
	}
	else{
		out.println("<script>alert('action 파라미터 값이 올바르지 않습니다..');location.href='controller.jsp?action=main'</script>");
	}

%>
