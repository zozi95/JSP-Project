<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"/>

<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="guestPassword" />
<jsp:setProperty name="user" property="usertype" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일락 로그인</title>
	
</head>
<body>
	<%  //세션에 userID를 얻어와서 현재 로그인 상태인지 확인한다.
		String userID = null;
		String usertype = null;
		if(session.getAttribute("userID") != null){ 
			//널값이 아니라면 아이디를 가져온다.
			userID = (String)session.getAttribute("userID");
			usertype = (String)session.getAttribute("usertype");
		}
		if(userID != null){ // 이미 로그인 되어 있으면
			out.println("<script>");
			out.println("alert('이미 로그인이 되어있습니다.')");
			out.println("location.href = 'main.jsp'");//메인페이지로
			out.println("</script>");			
		}
		
	
		//DB연결 메소드를 사용하기 위해 dao 객체 생성
		UserDAO dao = new UserDAO();
		//DB연결과 동시에 login(아이디,비번) 메소드 결과값을 정수로 받아서 상황에 따라 분기
		int result = dao.login(user.getUserID(), user.getGuestPassword());
		if(result == 1){ //정상(로그인)
			session.setAttribute("userID", user.getUserID());
			out.println("<script>");
			out.println("location.href = 'main.jsp'");//정상이므로 메인페이지로
			out.println("</script>");
		} else if (result == 0) { //비번이 틀리다.
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()"); //이전으로 돌아감
			out.println("</script>");			
		} else if (result == -1) { //아이디가 DB에 없다.
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
			out.println("history.back()");//이전으로 돌아감
			out.println("</script>");			
		} else if (result == -2) { //오류
			out.println("<script>");
			out.println("alert('데이터베이스 오류발생.')");
			out.println("history.back()");//이전으로 돌아감
			out.println("</script>");			
		}
		
	%>
</body>
</html>