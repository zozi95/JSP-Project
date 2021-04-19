<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
<meta charset="UTF-8">
<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>

<body>
	<script src="//code.jquery.com/jquery.min.js"></script>

	<%@ include file="header.jsp"%>
	
	<%@ include file="hostdbconn.jsp"%>
			
	<%	
		//세션 id 값을 얻고 세션id에 해당하는 사람이 host인지 guest인지에 따라서 페이지를 다르게 보여준다
		String id = request.getParameter("id");
		//아이디로 제품의 정보를 불러오는것 
		
				//아이디로 제품의 정보를 불러오는것 
		/* String sql= "select * from hostuser where userID=? and usertype='2' ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();
		 */
	
		String sql= "select * from subscription where guestID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();

			
		%>
		<div class="carousel slide " >

			<div class=col-md-10 style="margin: 30 auto;">
					<h3> 신청 목록</h3>
			</div>
			<table class="table table-hover" style="text-align:center; width:80%; margin: auto;">
						<tr>
							<th>호스트 이름</th>
							<th>한문장요약</th>
							<th>신청날짜</th>
							<th>사진</th>	
						</tr>	
	<%
		
		while (rs.next()){%>	
			<tr>
				<td><%=rs.getString("userName")%></td>
				<td><%=rs.getString("useroneIntroduction")%></td>
				<td><%=rs.getString("date")%></td>
				<td><img src="./Image/<%=rs.getString("userFilename")%>" width=100px height=100px /></td>
				
				<td><a href="deletesub.jsp?id=<%=rs.getString("hostID")%>" class="badge badge-danger">삭제</a></td>
				
				<!-- 호스트가 게스트의 정보를 삭제시 게스트의 아이디의값에 메세지를 추가 누구의 호스트가 거절하셨습니다 가 뜨도록 !!!!! -->
			</tr>
	<%
		}	%>
		</table>
		</div>
		<%	
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>

	<%@ include file="footer.jsp"%>
	
	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->

	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>