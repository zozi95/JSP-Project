<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>일락 로그인</title>

<!-- 부트스트랩 CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
	<div class="row">
		<div class="col-lg-5 col-md-7 mx-auto">
			<div class="bg-light p-5 mt-5">
	        	<form action="loginAction.jsp" method="post">
	          		<h3 class="text-center mb-3" style="font-family:'Gugi', cursive;">일락 로그인</h3>
	          		<input type="text" class="form-control mb-3" name="userID" placeholder="아이디" maxlength="20" required>
	          		<input type="password" class="form-control mb-3" name="guestPassword" placeholder="패스워드" maxlength="20" required>
	          		<input type="submit" class="btn btn-primary form-control mb-3" value="로그인">
	          		<div>
	          		<a href="join.jsp" style="float:right">회원가입</a>
	          		<a href="#">비밀번호 찾기</a>
	          		</div>
	        	</form>
	      	</div>
	    </div>
	</div>
</div>







<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->
  <script src="js/jquery-3.5.1.min.js"></script>
  <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>