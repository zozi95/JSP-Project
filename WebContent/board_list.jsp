<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1 align="center">일락 게시판</h1>
			<a href="homelist.do" class="btn btn-info btn-lg"> <span
				class="glyphicon glyphicon-home"></span> Home
			</a>
		</div>
		<table class="table table-hover">
			<h3>공지사항</h3>
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
				<c:forEach items="${adlist}" var="adl">
					<tr>
						<td>${adl.c_board_num}</td>
						<td>${adl.c_board_category}</td>
						<td><a href="board_read.do?c_board_num=${adl.c_board_num}">${adl.c_board_title}</a>
						</td>
						<td>${adl.c_board_author}</td>
						<td>${adl.c_board_writeday}</td>
						<td>${adl.c_board_readcnt}</td>
						<td>${adl.c_board_recom}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table table-hover">
		<h3>일락 게시판</h3>
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
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.c_board_num}</td>
						<td>${dto.c_board_category}</td>
						<td><c:forEach begin="1" end="${dto.c_board_repIndent}">☞</c:forEach>
							<a href="board_read.do?c_board_num=${dto.c_board_num}">${dto.c_board_title}</a>
						</td>
						<td>${dto.c_board_author}</td>
						<td>${dto.c_board_writeday}</td>
						<td>${dto.c_board_readcnt}</td>
						<td>${dto.c_board_recom}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="page-footer" style="text-align: center;">
			<form action="board_search.do" method="post">
				<select name="bool">
					<option value="titlebool">제 목</option>
					<option value="contentbool">내 용</option>
					<option value="authorcontenbool">제목+내용</option>
					<option value="authorbool">작성자</option>
					<option value="categorybool">카테고리</option>
				</select> 
				<input type="text" name="content">
				<input type="submit" value="검색" id="search">
			</form>
		</div>
		<hr>

		<div style="text-align: right;">
			<c:choose>
				<c:when test="${empty userID}">
					<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-pencil"></span> 글쓰기
					</button>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body" style="text-align: center;">
									<h3>로 그 인</h3>
									<br>
									<form action="member_login.do" method="post">
										<div class="form-group">
											<input type="text" placeholder="아이디" name="c_member_id" required>
										</div>
										<div class="form-group">
											<input type="password" placeholder="비밀번호" name="c_member_password" required>
										</div>
											<input type="submit" class="btn btn-info" value="로그인">
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a href="board_insertui.do" class="btn btn-info btn-lg"> 
						<span class="glyphicon glyphicon-pencil"></span> 글쓰기
					</a>
				</c:otherwise>
			</c:choose>
		</div>

	</div>

	<jsp:include page="board_page.jsp" />

</body>
</html>