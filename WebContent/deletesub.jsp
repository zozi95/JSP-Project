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
		String id = request.getParameter("id");
		String sql ="select * from hostsubscription where hostID = ? and guestID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
		
		String sql1= "delete from hostsubscription where hostID = ? and guestID = ?";
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		
		String sql3= "delete from subscription where hostID =? and guestID =?";
		pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
	%>
	<div style="text-align:center;">
	      <b><font size="4" color="gray">회원정보가 삭제되었습니다.</font></b>
        <br><br>
    
        <input type="button" value="확인" onclick="javascript:window.location='subscription.jsp'">
        </div>
<% }

		else{	String id1 = request.getParameter("id");
				String sql2= "delete from subscription where hostID = ? and guestID = ?";
				pstmt1 = conn.prepareStatement(sql2);
				pstmt1.setString(1, id1);
				pstmt1.setString(2, userID);
				pstmt1.executeUpdate();
		



%>
	<div style="text-align:center;">
	      <b><font size="4" color="gray">신청정보가 삭제되었습니다.</font></b>
        <br><br>
    
        <input type="button" value="확인" class="btn btn-Info" onclick="javascript:window.location='subscription.jsp'">
        </div>
        
        <%}
		 %>
</body>
</html>




