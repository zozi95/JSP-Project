<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->

<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
  <!-- 부트스트랩 CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">

<!------게스트 호스트목록 장바구니 ------------------------------------->
  
</head>
<body>
     <%@ include file="header.jsp"%>
	<%@ include file="hostdbconn.jsp"%>

   <%	
		//넘어온 주소의 id값을 얻고 아이디로 제품을 가져온다.
		String id = request.getParameter("id");
		//아이디로 제품의 정보를 불러오는것 
		String sql= "select * from cart where guestID=? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();
		
		
%>	
				<div class="container">
						<div class="row ">
							<div class="col-md-9" style="float: none; margin: 0 auto;">
		<ul class="breadcrumb">
		  <li style="margin: auto; font-size: 20px;">나의 호스트리스트</li>
		</ul>
   <hr />
	   <%	while (rs.next()){
			
	%>	

					
							<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative" style="margin: 30auto;">
								<!----호스트사진-------->
								 <img class="rounded float-left" src="./Image/<%=rs.getString("hostFilename")%>"  width="20%">
								
								<!-- ---------호스트이름----->
								 <strong class="d-inline-block mb-2 text-primary" style="margin-left: 15px;"><%=rs.getString("hostName")%></strong>
								
								<!-- ---------호스트소개내용 ----->
								  <div class="mb-1 text-muted" style="margin-left:15px;"> <%=rs.getString("date")%> <br>
								   <p class="card-text mb-auto"><%=rs.getString("hostoneIntroduction")%></p>
								   <a href="hostpage.jsp?id=<%=rs.getString("hostID") %>" class="stretched-link">상세보기</a>
								   <br><br>
								   <a href="deletehostCart.jsp?id=<%=rs.getString("hostID") %>" class="stretched-red" style="">삭제</a>
								  </div>								     
        					</div>  
 <%	} %>       					    
     					 </div>
   					</div>
   				</div>								
						
					
 <%
 
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	%>
	


	<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->
  <script src="js/jquery-3.5.1.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="https://kit.fontawesome.com/df3bed6747.js" crossorigin="anonymous"></script>
</body>
</html>