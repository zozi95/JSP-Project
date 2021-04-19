<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

<!-- ��Ʈ��Ʈ�� CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<html>
<head>
    <title>호스트 장바구니추가 </title>
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
		
		String sql1 = "select * from cart where guestID = ? and hostID = ?";
		pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, userID);
		pstmt1.setString(2, id);
		pstmt1.executeQuery();
		rs1= pstmt1.executeQuery();
		if(!rs1.next()){
		
		String sql ="insert into cart (guestID, hostID, hostName, hostoneIntroduction, hostFilename) select ?,hostuser.userID as hostID, guestName, hostoneIntroduction, hostFilename from guestuser LEFT outer join hostuser on hostuser.userID=guestuser.userID where hostuser.userID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, id);
		pstmt.executeUpdate();
		
		//

	%>
		<div style="text-align:center;">
	      <b><font size="4" color="gray">관심목록에 추가되었습니다.</font></b>
        <br><br><br>
    
        <input type="button" value="확인" class="btn btn-Info" onclick="javascript:window.location='main.jsp'">
        </div>
		<%
		}
		else{	
		
		%>
		<div style="text-align:center;">
		      <b><font size="4" color="gray">관심목록에 이미 존재합니다.</font></b>
        <br><br><br>
    
        <input type="button" value="확인" class="btn btn-Info" onclick="javascript:window.location='hostCart.jsp'">
        </div>
		<%} %>
</body>
</html>
