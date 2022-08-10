<%@page import="model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp" import="java.util.ArrayList,model.vo.BoardVO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:setProperty property="*" name="bVO" />

<jsp:useBean id="mDAO" class="model.dao.MemberDAO" />
<jsp:useBean id="mVO" class="model.vo.MemberVO" scope="session"/>
<jsp:setProperty property="*" name="mVO" />
<%
	// 어떤 요청을 받았는지 파악
	// -> 해당 요청을 수행
	
	String action = request.getParameter("action");
	System.out.println("로그: "+action);
	
	
	 if(action.equals("login")){ // 로그인
		 MemberVO member = mDAO.selectOne(mVO);
		if(member!=null){
			session.setAttribute("member",member);
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			out.println("<script>alert('로그인 실패..');location.href='controller.jsp?action=logout';</script>");
			session.invalidate(); // 세션 초기화
		}
	}
	 else if(action.equals("logout")){
		 session.invalidate(); // 세션 초기화
		 response.sendRedirect("login.jsp");
	 }
	 else if(action.equals("reg")){ // 회원가입
			if(mDAO.insert(mVO)){
				response.sendRedirect("login.jsp");
			}
			else{
				throw new Exception("reg 오류");
			}
		}
	 else if(action.equals("mypage")){ // 마이페이지
		 MemberVO member = (MemberVO)session.getAttribute("member");
		// 이후에는 selectOne을 통해서 data를 받게될 예정
		 if(member!=null){
			 request.setAttribute("data", member); // 유지할 정보 
			pageContext.forward("mypage.jsp"); // forward 액션
		 }
		 else{
			 throw new Exception("mypage 오류");
		 }
		}
	 else if(action.equals("mupdate")){ // 회원정보수정
			if(mDAO.update(mVO)){ // 세션 초기화하고 로그인으로
				session.invalidate(); // 세션 정보 전체 제거하기
				 /// session.removeAttribute("member");
				response.sendRedirect("login.jsp");
			}
			else{
				throw new Exception("mupdate 오류");
			}
		/*	if(mDAO.update(mVO)){ // 마이페이지로 보낼 때
				 MemberVO member = mDAO.selectOne(mVO);
				session.setAttribute("member", member);
				pageContext.forward("controller.jsp?action=mypage");
			}
			else{
				throw new Exception("mupdate 오류");
			}
	   */
		}
	 else if(action.equals("mdelete")){ // 회원탈퇴
		 MemberVO member=(MemberVO)session.getAttribute("member");
			if(member!=null && mDAO.delete(member)){
				session.invalidate();
				response.sendRedirect("login.jsp");
			}
			else{
				throw new Exception("mdelete 오류");
			}
		 /* if(mDAO.delete(mVO)){
				out.println("<script>alert('회원 탈퇴가 완료되었습니다..')</script>");
				response.sendRedirect("login.jsp");
			}
			else{
				throw new Exception("mdelete 오류");
			}
	      */
		}
	 else if(action.equals("main")){ 
		ArrayList<BoardVO> datas=bDAO.selectAll(bVO);
		request.setAttribute("datas", datas); // 유지할 정보 
		pageContext.forward("main.jsp"); // forward 액션
	}
	else if(action.equals("insert")){ // 글 추가
		if(bDAO.insert(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("insert 오류");
		}
	}
	else if(action.equals("update")){ // 글 수정
		if(bDAO.update(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("update 오류");
		}
	}
	else if(action.equals("delete")){ // 글 삭제
		if(bDAO.delete(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("delete 오류");
		}
	}
	else if(action.equals("search")){ // 검색
		ArrayList<BoardVO> datas = bDAO.search(bVO);
		request.setAttribute("datas", datas); // 유지할 정보 
		pageContext.forward("main.jsp"); // forward 액션 
	}	
	else if(action.equals("selectOne")){ // 상세페이지
		BoardVO data = bDAO.selectOne(bVO);
		if(data==null){
			response.sendRedirect("controller.jsp?action=main");
		}
		request.setAttribute("data", data);
		pageContext.forward("board.jsp"); 
	}
	else{
		out.println("<script>alert('action 파라미터 값이 올바르지 않습니다..');location.href='controller.jsp?action=main'</script>");
	}

%>
