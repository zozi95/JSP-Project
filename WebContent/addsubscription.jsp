<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>


<head>
    <title>신청 추가 처리</title>
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
		String sql= "select * from subscription where hostID=? and guestID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, userID);
		rs = pstmt.executeQuery();
		
		if(!rs.next()){
		
		
		//아이디로 제품의 정보를 불러오는것 
		String sql1 = "insert  into subscription (guestID, hostID, userName, useroneIntroduction, userFilename) select ?, gu.userID ,guestName as hostName, hostoneIntroduction, hostFilename from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where gu.userID= ?";
		
		pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, userID);
		pstmt1.setString(2, id);
		pstmt1.executeUpdate();
	
		String sql2 = "insert  into hostsubscription (hostID, guestID, userName, useroneIntroduction, userFilename) select ?, gu.userID ,guestName, guestIntroduction, guestFilename from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where gu.userID= ?";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, id);
		pstmt2.setString(2, userID);
		pstmt2.executeUpdate();

		/* rs=pstmt.executeQuery();
	
		
		if(rs.next()){	}
			
		String sql = "insert  into subscription (guestID, hostID, userName, useroneIntroduction, userFilename) "
					+"select ?,userID as hostID, userName, useroneIntroduction, userFilename from user where userID = ? and usetype='2'";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		rs=pstmt.executeQuery();
		if()
			
	*/
		
	%>
	<div style="text-align:center;">
    <b><font size="4" color="gray">회원정보가 추가했습니다.</font></b>
  <br><br>

  <input type="button" value="확인" class="btn btn-Info" onclick="javascript:window.location='main.jsp'">
	</div>
	<%	
		//String sql= "insert into subscription (guestID, hostID, userName, useroneIntroduction, useFilename) values(?,?,?,?,?)";
		}
		
		else{
			
		%>   
		<div style="text-align:center;">
					 <b><font size="4" color="gray">이미 신청중입니다.</font></b>
		  <br><br>
										
		  <input type="button" value="확인" class="btn btn-Info" onclick="javascript:window.location='subscription.jsp'">
	</div>
	<%
			} 
	%>
					
			
 <%
 
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
								


</body>
</html>




