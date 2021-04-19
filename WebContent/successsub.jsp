<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
<head>
    <title>회원 삭제 처리</title>
</head>
<body>
<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
%>

	<%@ include file="hostdbconn.jsp"%>
			
	<%	
		//넘어온 주소의 id값을 얻고 아이디로 제품을 가져온다.
		
		//userID 호스트 아이디
		//id 게스트 아이디
		
		String id = request.getParameter("id");
		//아이디로 제품의 정보를 불러오는것 
		String sql= "insert  into success (hostID, guestID) values(?, ?) ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		
		String sql1= "delete from hostsubscription where hostID = ? and guestID = ?";
		pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, userID);
		pstmt1.setString(2, id);
		pstmt1.executeUpdate();

		String sql2= "delete from subscription where hostID = ? and guestID = ?";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, userID);
		pstmt2.executeUpdate();
		
	%>
	
	  <!--     <b><font size="4" color="gray">게스트가 업무를 완료하였습니다.</font></b> -->
       	<jsp:forward page="hostsubscription.jsp"/>

</body>
</html>




