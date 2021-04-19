<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>  

<% request.setCharacterEncoding("UTF-8"); %> 
<!-- User클래스의 객체를 생성하여 이페이지에서 사용할수 있게한다. -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- form으로부터 전달된 파라메터들을 User객체의 set메소드를 사용하여 저장 -->
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="guestPassword"/>
<jsp:setProperty name="user" property="guestName"/>
<jsp:setProperty name="user" property="guestGender"/>
<jsp:setProperty name="user" property="guestMail"/>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<%  
		//세션에 userID를 얻어와서 현재 로그인 상태인지 확인한다.
		String userID = null;
		if(session.getAttribute("userID") != null){ 
			//널값이 아니라면 아이디를 가져온다.
			userID = (String)session.getAttribute("userID");
		}
		if(userID != null){ // 이미 로그인 되어 있으면
			out.println("<script>");
			out.println("alert('이미 로그인이 되어있습니다.')");
			out.println("location.href = 'main.jsp'");//메인페이지로
			out.println("</script>");			
		}
	
		//DB연결 메소드를 사용하기 위해 dao 객체 생성
		UserDAO dao = new UserDAO();
		//자바빈 객체 user를 입력
		int result = dao.GuestInsert(user);
		if(result == 1){ //정상(회원가입)
			session.setAttribute("userID", user.getUserID());
			out.println("<script>");
			out.println("location.href = 'main.jsp'");//정상이므로 메인페이지로
			out.println("</script>");
		} else { //오류 (id 중복일때)
			out.println("<script>");
			out.println("alert('이미 존재하는 아이디 입니다.')");
			out.println("history.back()"); //이전으로 돌아감
			out.println("</script>");			
		} 
		
	%>
</body>
</html>