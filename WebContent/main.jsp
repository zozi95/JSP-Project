<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Carousel indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for carousel items -->
		<div class="carousel-inner" style="text-align: center;">
			<div class="carousel-item active">
				<img src="Image/main1.jpg" alt="First Slide">
			</div>
			<div class="carousel-item">
				<img src="Image/main2.jpg" alt="Second Slide">
			</div>
			<div class="carousel-item">
				<img src="Image/main3.jpg" alt="Third Slide">
			</div>
		</div>
		<!-- Carousel controls -->
		<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#myCarousel" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<br>
	<%@ include file="search.jsp"%>
	<div class="jumbotron">
		<h1 class="display-4" style="font-family: 'Gugi', cursive; font-size:300%" >여행의
			일락</h1>
		<p class="lead">여행의 일락은 여행으로 일하면서 즐긴다는 뜻입니다.</p>
		<p>
			<a href="join.jsp" target="_blank" class="btn btn-primary btn-lg">등록하러
				가기</a>
		</p>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #d9e5ff;">
		<div class="ml-5">
			<h3 style="font-family: 'Gugi', cursive;">일락 호스트</h3>
			
			
			
			<%@ include file="hostdbconn.jsp"%>
			
			
		<%String search = request.getParameter("search");
		if(search==null){
	
		
		String sql= "select * from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where hu.usertype=2";
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		while (rs.next()){

	%>
			
			
			<div class="card ml-5"
				style="width: 300px; height: 330px; float: left; margin-right: 10px; margin-top: 5px;">
				<img src="./Image/<%=rs.getString("hostFilename")%>" class="card-img-top" alt="..." onError="this.src='./Image/여행의일락.jpg'" width="100px" height="150px">
				<div class="card-body text-center">
					<h5 class="card-title" style="height: 15px"><%=rs.getString("guestName")%></h5>
					<p class="card-text"  style="height: 50px"><%=rs.getString("hostoneIntroduction")%></p>
					<a href="hostpage.jsp?id=<%=rs.getString("hu.userID")%>" class="btn btn-primary" style="margin-top:15px;">호스트보러가기&raquo;</a>
				
				</div>
			</div>
		<%	}
				}
				
				else if(search!=null){
				
					String sql2= "select * from guestuser as gu LEFT outer join hostuser as hu on hu.userID=gu.userID where hu.usertype=2 and (hostCountry like '%"+ search +"%' or hu.userID like '%"+ search +"%' or guestName like '%"+ search +"%' or hostWork like '%"+ search +"%')";
					pstmt1 = conn.prepareStatement(sql2);
					rs1 = pstmt1.executeQuery();
					while (rs1.next()){

						%>
								
								
								<div class="card ml-5"
									style="width: 300px; height: 330px; float: left; margin-right: 10px; margin-top: 5px;">
									<img src="./Image/<%=rs1.getString("hostFilename")%>" onError="this.src='./Image/여행의일락.jpg'" class="card-img-top" alt="..." width="100px" height="150px">
									<div class="card-body text-center">
										<h5 class="card-title" style="height: 15px"><%=rs1.getString("guestName")%></h5>
										<p class="card-text"  style="height: 50px"><%=rs1.getString("hostoneIntroduction")%></p>
										<a href="hostpage.jsp?id=<%=rs1.getString("hu.userID")%>" class="btn btn-primary" style="margin-top:15px;">호스트보러가기&raquo;</a>
									
									</div>
								</div>
							<%	}
					
					
					
				}
				%>								
 <%
 
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
			
			<button type="button" class="btn btn-info"
				style="width: 10%; float: left; margin-top: 140px; margin-left: 120px">
				더보기<br>>>
			</button>
			
			
			
		</div>
		<div style="clear: both"></div>
	</nav>
	<br>

	<br><br>
	<%@ include file="footer.jsp"%>
	




	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->

	<script src="js/bootstrap.bundle.min.js"></script> 
</body>
</html>