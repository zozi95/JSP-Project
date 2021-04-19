<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>호스트의 게스트 관리</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

	<script src="//code.jquery.com/jquery.min.js"></script>

	<%@ include file="header.jsp"%>

	<%@ include file="hostdbconn.jsp"%>
<%		String id = request.getParameter("id");	
	
	
		String sql= "select * from hostsubscription where hostID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		
		rs = pstmt.executeQuery();
	

			%>
		<div class="carousel slide" >

		<div class=col-md-10 style="margin: 30 auto;">
				<h3> 신청 게스트 목록</h3>
		</div>
		<table class="table table-hover" style="text-align:center; width:80%; margin: auto;">
					<tr>
						<th>게스트 이름</th>
						<th>자기소개</th>
						<th>신청날짜</th>
						<th>프로필사진</th>	
					</tr>	
<%

	while (rs.next()){%>	
		<tr>
			<td><%=rs.getString("userName")%></td>
			<td><%=rs.getString("useroneIntroduction")%></td>
			<td><%=rs.getString("date")%></td>
			<td><img src="./Image/<%=rs.getString("userFilename")%>" onError="this.src='./Image/default.jpg'" width=100px height=100px /></td>
			<td><a href="successsub.jsp?id=<%=rs.getString("guestID")%>" class="badge badge-danger">완료</a></td>
			<td><a href="deletesub.jsp?id=<%=rs.getString("guestID")%>" class="badge badge-danger">삭제</a></td>
		</tr>
<%
	}
	%>
		</table>
		</div>
</body>
</html>