<%@ page language="java" pageEncoding="UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
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
		String review = request.getParameter("content");

		
					
	
		String sql= "select * from success where hostID=? and guestID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, userID);
		rs = pstmt.executeQuery();
		
		
		
		if (rs.next()){
			
			String sql2 ="select * from review where hostID=? and guestID=?";
			pstmt2 =conn.prepareStatement(sql2);
			pstmt2.setString(1, id);
			pstmt2.setString(2, userID);
			rs1=pstmt2.executeQuery();
			if(!rs1.next()){			
	
			
			String sql1= "insert into review (hostID, guestID, guestname, guestFilename, review) select ?, userID,guestName,guestFilename,? from guestuser where userID=?";
			pstmt = conn.prepareStatement(sql1);
			

			pstmt.setString(1, id);
			pstmt.setString(2, review);
			pstmt.setString(3, userID);
		
			pstmt.executeUpdate();
			
			%>
				<jsp:forward page="hostpage.jsp?id=<%=id%>"/>
			
			
				<%}
			else if(rs1.next()){
		
	%>		<div style="border:1px solid; padding:10px;">
			  <b><font size="4" color="gray">이미 리뷰를 작성하셨습니다</font></b>
  				<br><br><br>

 		 		<input type="button" value="확인" onclick="javascript:history.back();">	
			</div>
	
	<%
			}
		else	
				{
			%>	<div style="text-align:center;">
			  <b><font size="4" color="gray">리뷰를 등록 할 권한이없습니다.</font></b>
  				<br><br><br>

 		 		<input type="button" value="확인" class="btn btn-Info" onclick="javascript:history.back();">
				</div>
			<%	}
			}
		
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
	<div style="text-align:center;">
			  <b><font size="4" color="gray">리뷰를 등록 할 권한이없습니다.</font></b>
  				<br><br><br>

 		 		<input type="button" value="확인" onclick="javascript:history.back();">	
			</div>
	

<%-- 		<jsp:forward page="hostpage.jsp"/>;	 --%>
	<!--  include file=  여기에 사진8장 들어가는 페이지 */.jsp"%>-->
	<!--  include file=  리뷰 페이지 .jsp"%> -->	
<%-- 	<%@ include file="footer.jsp"%> --%>
	
	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->

	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>