<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
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
	String user = null;	
	 user = request.getParameter("user");
	
	if(user.equals(userID)){
		String id = request.getParameter("id");
		String sql ="delete from review where hostID = ? and guestID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, userID);
		pstmt.executeUpdate();
		%>
	 	<jsp:forward page="hostpage.jsp?id=<%=id%>"/>



	<%} else{
	
	%>
			<div style="text-align:center;">
	      <b><font size="4" color="gray">자신의 리뷰만 삭제가능합니다.</font></b>
        <br><br>
    
        <input type="button" value="확인" class="btn btn-Info" onclick="javascript:history.back();">
        </div>
        
	
	
	
	<%}
	
	
	%>
	</body>
</html>
	