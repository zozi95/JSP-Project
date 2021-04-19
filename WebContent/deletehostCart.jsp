<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">


<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
%>
	<%@ include file="hostdbconn.jsp"%>
			
	<%	
		String id = request.getParameter("id");
		String sql ="delete from cart where hostID = ? and guestID = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, userID);
		pstmt.executeUpdate();
		%>
	 	<jsp:forward page="hostCart.jsp"/>



