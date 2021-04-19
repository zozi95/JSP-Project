<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>일락 회원가입</title>
<!-- 부트스트랩 CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%@ include file="header.jsp" %>



<div class="container">
	<div class="row">
		<div class="col-lg-5 col-md-7 mx-auto" style="text-align:center; margin-top:120px">
			<div class="bg-light p-5 mt-5">
				<form action="#" method="post">
					<h3 class="text-center" style="font-family:'Gugi', cursive;">일락 회원가입</h3>
					<div class="btn-group" role="group" aria-label="Basic example">
  						<button onClick="location.href='guest2.jsp'" type="button" class="btn btn-secondary">게스트</button>
  					
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