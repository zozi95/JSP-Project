<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="UTF-8">
<title>Board Home Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	
	<%@ include file="header.jsp"%>
<div class="jumbotron text-center">

</div>

<div class="container">
	<div class="row">
		<div class="col-sm-1">
			
			<c:choose>
				<c:when test="${empty userID}">
				
	
					<jsp:forward page="login.jsp"/>;	
				</c:when>
				<c:otherwise>
				

				</c:otherwise>
			</c:choose>
	
			<c:choose>
				<c:when test="${userID == 'admin'}">
					<br><hr>
					<a href="member_list.do" class="btn btn-success" role="button">회원명단</a>	
				</c:when>
			</c:choose>	
		</div>
		
		<div class="col-sm-9">
			<h3>인기 추천글</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${recomlist}" var="rcl">
						<tr>
							<td>${rcl.c_board_num}</td>
							<td>${rcl.c_board_category}</td>
							<td><a href="board_read.do?c_board_num=${rcl.c_board_num}">${rcl.c_board_title}</a></td>
							<td>${rcl.c_board_author}</td>
							<td>${rcl.c_board_writeday}</td>
							<td>${rcl.c_board_readcnt}</td>
							<td>${rcl.c_board_recom}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr>
			<h3>인기 조회글</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cntlist}" var="ctl">
						<tr>
							<td>${ctl.c_board_num}</td>
							<td>${ctl.c_board_category}</td>
							<td><a href="board_read.do?c_board_num=${ctl.c_board_num}">${ctl.c_board_title}</a></td>
							<td>${ctl.c_board_author}</td>
							<td>${ctl.c_board_writeday}</td>
							<td>${ctl.c_board_readcnt}</td>
							<td>${ctl.c_board_recom}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col-sm-2">
			<h3><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;게시판</h3>
			<br>
			<a href="board_list.do" class="btn btn-default btn-lg" role="button">게시판 들어가기</a>
			<br><br><br>
			<h4>&nbsp;&nbsp;방문자수: <%= application.getAttribute("counter") %></h4>
		</div>

	</div>
</div>

<%

   Integer count = (Integer)application.getAttribute("counter"); 
   if(count == null)
   {
      application.setAttribute("counter",1);   
   }
   else
   {
      count = count + 1;
      application.setAttribute("counter", count);   
   }
%>
 
</body>
</html>